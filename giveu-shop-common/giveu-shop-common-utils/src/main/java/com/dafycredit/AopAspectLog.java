package com.dafycredit;

import com.alibaba.fastjson.JSON;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;

/**
 * AOP日志
 * @author 513416 pastry
 * @date 2017年4月19日
 */
@Aspect
@Component
public class AopAspectLog {
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Pointcut("execution(public * com.dafycredit.*.service.impl..*.*(..))")
	public void cmdMethod() {
	}

	@Before("cmdMethod()")
	public void doBefore(JoinPoint joinPoint) throws Throwable {
	}

	@AfterReturning(returning = "ret", pointcut = "cmdMethod()")
	public void doAfterReturning(Object ret) throws Throwable {
	}

	@Around(value = "cmdMethod()")
	public Object around(ProceedingJoinPoint pjp) throws Throwable {
		String requestId = "uuid";
		MethodSignature signature = (MethodSignature) pjp.getSignature();
		Method method = signature.getMethod();
		try {
			Class<?>[] parameterTypes = method.getParameterTypes();

			List<String> paramsType = new ArrayList<String>();
			for (Class<?> clazz : parameterTypes) {
				paramsType.add(clazz.getSimpleName());
			}

			List<Object> paramsValue = new ArrayList<Object>();
			Object[] args = pjp.getArgs();
			for (Object object : args) {
				paramsValue.add(JSON.toJSON(object));
			}

			String methodName = method.getName();

			logger.info("request(" + requestId + "):" + pjp.getTarget().getClass().getSimpleName() + "-" + methodName
					+ ":" + paramsValue + "(" + InetAddress.getLocalHost().getHostAddress() + ")");

			Object resultObject = pjp.proceed();

			if ("initConfig".equals(methodName)) {
				return resultObject;
			}
			return resultObject;
		} catch (Exception e) {
			logger.error("AOP Query Exception:", e);
			return null;
		}
	}
}
