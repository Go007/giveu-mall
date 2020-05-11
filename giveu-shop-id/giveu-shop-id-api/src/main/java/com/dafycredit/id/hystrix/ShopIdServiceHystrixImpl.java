package com.dafycredit.id.hystrix;

import java.util.List;

import org.springframework.stereotype.Component;

import com.dafycredit.common.model.Result;
import com.dafycredit.id.enums.ResultCode;
import com.dafycredit.id.service.IShopIdService;

/** 
* @ClassName: ShopIdServiceHystrixImpl 
* @Description: id服务熔断器 
* @author zhouqian@dafycredit.com
* @date 2017年5月25日 上午9:59:36 
*  
*/
@Component
public class ShopIdServiceHystrixImpl implements IShopIdService {

	@Override
	public Result<String> getSingleId(String name) {
		return new Result<>(ResultCode.SERVICE_INVOKE_SINGLEID_OVERTIME.getCode(), ResultCode.SERVICE_INVOKE_SINGLEID_OVERTIME.getMsg());
	}

	@Override
	public Result<List<String>> getBatchId(String name, int size) {
		return new Result<>(ResultCode.SERVICE_INVOKE_BATCHID_OVERTIME.getCode(), ResultCode.SERVICE_INVOKE_BATCHID_OVERTIME.getMsg());
	}

}
