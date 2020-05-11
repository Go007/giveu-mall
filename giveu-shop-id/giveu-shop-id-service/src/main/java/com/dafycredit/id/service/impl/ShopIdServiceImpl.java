
package com.dafycredit.id.service.impl;

import com.dafycredit.common.cache.redis.RedisLocker;
import com.dafycredit.common.exception.SystemException;
import com.dafycredit.common.model.Result;
import com.dafycredit.common.util.DateUtil;
import com.dafycredit.id.bean.Counter;
import com.dafycredit.id.dao.CounterMapper;
import com.dafycredit.id.dto.Sequence;
import com.dafycredit.id.service.IShopIdService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicReference;

/**
 * @ClassName: ShopIdServiceImpl
 * @Description: idService的实现类
 * @author zhouqian@dafycredit.com
 * @date 2017年4月20日 下午3:15:23
 * 
 */
@RestController
public class ShopIdServiceImpl implements IShopIdService {

    private static final Logger logger = LoggerFactory.getLogger(ShopIdServiceImpl.class);

    /**
     * 保存序列（一个数据序列对应一个sequence）
     */
    private static final Map<String, Sequence> SEQUENCE_HOLDER = new ConcurrentHashMap<>();

    @Autowired
    private CounterMapper icountDao;

    @Autowired
    private RedisLocker redisLocker;

    @Override
    public Result<String> getSingleId(String name) {
        Result<String> result = new Result<>();
        try {
            if (StringUtils.isBlank(name)) {
                throw new IllegalArgumentException("序列名称不能为空");
            }
            redisLocker.lock(String.format("single%s",name), () -> {
                // 获取序列
                Sequence sequence = SEQUENCE_HOLDER.get(name);
                // 未加载到SEQUENCE_HOLDER中,或者溢出时需要重新向数据库申请
                if (sequence == null || sequence.isOverFlow()) {
                    sequence = applyNextSequence(name);
                }
                result.setData(generateId(sequence));
                return null;
            });
        } catch (Exception e) {
            //返回uuid
            result.setData(generateSingleId(name));
            logger.error("获取单个Id异常[{}],手动生成Id", name, e);
        }
        return result;
    }

    @Override
    public Result<List<String>> getBatchId(String name, int size) {
        Result<List<String>> result = new Result<>();
        try {
            if (StringUtils.isBlank(name)) {
                throw new IllegalArgumentException("序列名称不能为空");
            }
            if (size < 1) {
                throw new IllegalArgumentException("size必须大于0");
            }
            List<String> idList = new ArrayList<>(size);

            redisLocker.lock(String.format("batch%s",name), () -> {
                // 获取序列
                Sequence sequence = SEQUENCE_HOLDER.get(name);
                // 未加载到SEQUENCE_HOLDER中,或者溢出时需要重新向数据库申请
                if (sequence == null || sequence.isOverFlow()) {
                    sequence = applyNextSequence(name);
                }
                // 需要一批序列,如果序列不足重新取得
                for (int i = 0; i < size; i++) {
                    if (sequence.isOverFlow()) {
                        sequence = applyNextSequence(name);
                    }
                    idList.add(generateId(sequence));
                }
                return null;
            });
            result.setData(idList);
        } catch (Exception e) {
            logger.error("获取批量Id异常name[{}],size[{}]", name, size, e);
            result.setData(generateBatchId(name,size));
        }
        logger.info("序列名[{}],生成批量Id为[{}]",name,result.getData());
        return result;
    }

    /**
    * @Title: applyNextSequence
    * @Description: 向数据中申请下一批序列
    * @paramta: @param name
    * @paramta:@return
    * @return:Sequence
    * @throws
    */

    @Transactional(timeout=10,isolation = Isolation.READ_COMMITTED)
    public  Sequence applyNextSequence(String name) {
        Sequence sequence=null;
        try {
            logger.debug("start:"+System.currentTimeMillis());
            //考虑分布式锁,name为key,保证同一时刻,查询数据没有其他线程update
            Counter counter = icountDao.selectByName(name);
            logger.debug("查询数据库count对象"+counter.toString()+"\r\n");
            if (counter.getLength() == null) {
                throw new SystemException("数据库序列长度不能为空");
            }
            if (counter.getMax() == null) {
                counter.setMax((long) 0);
            }
            // 生成格式如下：前缀（业务系统）+日期8位+生成的序列
            AtomicReference<Long> start;// 需要保证原子特性
            start = new AtomicReference<>(counter.getMax() + 1);
            Long end = start.get() + counter.getStepSize();
            int size = counter.getStepSize();
            int contentLength = counter.getLength();
            String pre = counter.getPrefix();
            counter.setMin(start.get());
            counter.setMax(end);
            counter.setLastModify(DateUtil.getCurrMiliseconds());
            int effectRow=icountDao.updateByPrimaryKey(counter);
            logger.debug("update数据库count对象"+counter.toString()+"\r\n");
            logger.debug("更新受影响行数"+effectRow);
            boolean isDate = (counter.getIsDate() == 1);
            String dateformartStr = counter.getDateFormat();
            sequence = new Sequence(name, pre, contentLength, start.get(), end, size, isDate, dateformartStr);
            SEQUENCE_HOLDER.put(name, sequence);
            logger.debug("end:"+System.currentTimeMillis());
        } catch (Exception e) {
            logger.error("申请序列异常name[{}]", name,e);
        }
        return sequence;
    }

    /**
    * @Title: generateId
    * @Description: 按照一定规则生成id
    * @paramta:@param sequence
    * @paramta:@return
    * @return:String
    * @throws
    */
    private String generateId(Sequence sequence) {// 生成固定长度Id
        StringBuilder genIdBuilder = new StringBuilder();
        String date = StringUtils.EMPTY;
        if (sequence.isDate) {
            // 对应数据库日期格式
            date = DateUtil.dateToStr(new Date(), sequence.dateFormart);
        }
        // 下一个值
        long value = sequence.nextValue();
        // 数据库中设置的长度
        int setLength = sequence.contentLength;
        // 生成元素长度
        int valueLength = String.valueOf(value).length();
        int preLength = 0;
        if(StringUtils.isNotBlank(sequence.pre)) {
            // 前缀长度
            preLength= sequence.pre.length();
        }
        int dateLength = date.length();
        // 剩余位数长度
        int remainLen = setLength - valueLength - preLength - dateLength;

        String valueStr;
        // 剩余补零位数
        if (remainLen > 0) {
            String formart = "%0" + remainLen + "d";
            String fill = String.format(formart, 0);
            valueStr = fill + value;
        } else {
            valueStr = String.valueOf(value);
        }
        // String genId = String.format("%s%s%s%s", sequence.pre, date, rand, valueStr);//
        // 前缀（2）+时间(8)位++随机字符串2位+生成的字符长度,不足补全long最大（9223372036854775807）20位
        genIdBuilder.append(sequence.pre).append(date).append(valueStr);
        return genIdBuilder.toString();
    }

    private String generateSingleId(String name){
        return name+ System.currentTimeMillis()+ StringUtils.remove(String.valueOf(UUID.randomUUID().hashCode()),"-");
    }

    private List<String> generateBatchId (String name, int size){
        List<String> idList = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            idList.add(generateSingleId(name));
        }
        return idList;
    }

    public static void main(String [] args){
        System.out.println(System.currentTimeMillis());
        System.out.println(DateUtil.getNowDate(DateUtil.DATE_FORMAT_YYYYMMDDHHmmss)+"="+ UUID.randomUUID().hashCode());
        System.out.println(DateUtil.getNowDate(DateUtil.DATE_FORMAT_YYYYMMDDHHmmss)+ System.currentTimeMillis()+ (int)(Math.random()*9000+1000));
    }

}
