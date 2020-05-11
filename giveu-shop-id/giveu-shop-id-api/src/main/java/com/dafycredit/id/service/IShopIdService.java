package com.dafycredit.id.service;

import java.util.List;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dafycredit.common.model.Result;
import com.dafycredit.id.hystrix.ShopIdServiceHystrixImpl;


/** 
* @ClassName: IShopIdService 
* @Description: shopId生成器接口 
* @author zhouqian@dafycredit.com
* @date 2017年4月20日 下午2:52:41 
*  
*/
@FeignClient(value = "giveu-shop-id-service",fallback = ShopIdServiceHystrixImpl.class)
public interface IShopIdService {

    /**
     * 申请单个ID
     * @param name,具体服务名称，name可以考虑枚举变量
     * @return
     */
	@RequestMapping(value = "/id/nextValue", method = RequestMethod.GET)
	Result<String> getSingleId(@RequestParam("name") String name);

    /**
     * 申请一批ID
     * @param name
     * @param size
     * @return
     */
	@RequestMapping(value = "/id/nextRange", method = RequestMethod.GET)
	Result<List<String>> getBatchId(@RequestParam("name") String name, @RequestParam("size") int size);

}