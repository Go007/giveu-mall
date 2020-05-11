package id.dao;

import com.IdApplication;
import com.alibaba.fastjson.JSON;
import com.dafycredit.common.util.DateUtil;
import com.dafycredit.id.bean.Counter;
import com.dafycredit.id.dao.CounterMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.Random;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = IdApplication.class)
public class TestShopIdDao {
	
	@Autowired
	private CounterMapper icountDao;
	
	@Test
	public void testNextRange(){
		long i=1;
		System.out.println("-------"+JSON.toJSONString(icountDao.selectByPrimaryKey(i)));
		
	}
	
	@Test
	public void testSelectByName(){
		System.out.println("-------"+JSON.toJSONString(icountDao.selectByName("pay")));
	}
	
	@Test
	public void testUpdateByPrimaryKey(){
		Counter counter=icountDao.selectByName("pay");
		long maxValue=counter.getMax()+1000;
		counter.setMax(maxValue);
		icountDao.updateByPrimaryKey(counter);
		System.out.println("---------");
	}
	
	public static void main(String [] args) {
		System.out.println(String.format("%04d", 3513));
		System.out.println(DateUtil.dateToStr(new Date(),"yyyyMMddHHmmss"));
		Random random=new Random();
		System.out.println(random.nextInt(1000));
		System.out.println(Long.MAX_VALUE);
		long a=Long.parseLong("9223372036854775807");
		
		System.out.println(a);
		System.out.println(Long.MAX_VALUE);
	}
}
