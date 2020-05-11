package com.dafycredit.common.cache;

import java.io.Serializable;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

public class RedisManager {
	
	private static final Logger logger = LoggerFactory.getLogger(RedisManager.class);
	
	public static final int TIMES = 120;
	/** 
     * 缓存是否开启，默认开启,true开启，false不开启 
     */  
    private volatile boolean redisSwitch = true; 

	@Resource
	private RedisTemplate<Serializable, Serializable> redisTemplate;

	/**
	 * 新增缓存(默认120分钟)
	 * @param key	键
	 * @param value	值
	 */
	public void add(Serializable key, Serializable value) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		opsForValue.set(key, value, TIMES, TimeUnit.MINUTES);
	}
	
	/**
	 * 新增缓存(默认传入为分钟)
	 * @param key		键
	 * @param value		值
	 * @param minutes	分钟
	 */
	public void add(Serializable key, Serializable value, int minutes) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		opsForValue.set(key, value, minutes, TimeUnit.MINUTES);
	}
	
	/**
	 * 新增缓存
	 * @param key	键
	 * @param value	值
	 * @param times	时间
	 * @param type	1-天数, 2-小时, 3-分钟, 4-秒
	 */
	public void add(Serializable key, Serializable value, int times, int type) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		if(type == 1) {
			opsForValue.set(key, value, times, TimeUnit.DAYS);
		} else if(type == 2) {
			opsForValue.set(key, value, times, TimeUnit.HOURS);
		} else if(type == 3) {
			opsForValue.set(key, value, times, TimeUnit.MINUTES);
		} else if(type == 4) {
			opsForValue.set(key, value, times, TimeUnit.SECONDS);
		}
	}
	
	/**
	 * 删除缓存
	 * @param key 键
	 */
	public void delete(Serializable key) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		opsForValue.set(key, null);
	}
	
	/**
	 * 获取缓存
	 * @param key 	键
	 * @return		值
	 */
	public Serializable get(Serializable key) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		return opsForValue.get(key);
	}
	
	/**
	 * 获取缓存, 获取不到则设置值(默认120分钟)
	 * @param key	键
	 * @param obj	值
	 * @return
	 */
	public Serializable getAndSet(Serializable key, Serializable value) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		if(opsForValue.get(key) == null) {
			opsForValue.set(key, value, TIMES, TimeUnit.MINUTES);
		} else {
			value = opsForValue.get(key);
		}
		return value;
	}
	
	/**
	 * 获取缓存, 获取不到则设置值
	 * @param key	键
	 * @param obj	值
	 * @param minutes	分钟
	 * @return
	 */
	public Serializable getAndSet(Serializable key, Serializable value, int minutes) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		if(opsForValue.get(key) == null) {
			opsForValue.set(key, value, minutes, TimeUnit.MINUTES);
		} else {
			value = opsForValue.get(key);
		}
		return value;
	}
	
	/**
	 * 获取缓存, 获取不到则设置值
	 * @param key	键
	 * @param obj	值
	 * @param minutes	分钟
	 * @param type	1-天数, 2-小时, 3-分钟, 4-秒
	 * @return
	 */
	public Serializable getAndSet(Serializable key, Serializable value, int times, int type) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		if(opsForValue.get(key) == null) {
			if(type == 1) {
				opsForValue.set(key, value, times, TimeUnit.DAYS);
			} else if(type == 2) {
				opsForValue.set(key, value, times, TimeUnit.HOURS);
			} else if(type == 3) {
				opsForValue.set(key, value, times, TimeUnit.MINUTES);
			} else if(type == 4) {
				opsForValue.set(key, value, times, TimeUnit.SECONDS);
			}
		} else {
			value = opsForValue.get(key);
		}
		return value;
	}

	/**
	 * 自增(Long)
	 * @param key
	 * @param delta
	 * @return
	 */
	public Long increment(Serializable key, Long delta) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		if(delta == null) {
			delta = 1l;
		}
		return opsForValue.increment(key, delta);
	}
	
	/**
	 * 自增(Double)
	 * @param key
	 * @param delta
	 * @return
	 */
	public Double increment(Serializable key, Double delta) {
		ValueOperations<Serializable, Serializable> opsForValue = redisTemplate.opsForValue();
		if(delta == null) {
			delta = 1.0;
		}
		return opsForValue.increment(key, delta);
	}
	
	/** 
     * 将 key的值设为 value, 当且仅当 key不存在 
     * @param key		键 
     * @param value 	值
     * @return 不存在,set 成功 = true;已经存在=false 
     */  
    public boolean setIfAbsent(Serializable key, Serializable value) {  
        return setIfAbsent(key, value, (long) TIMES, TimeUnit.MINUTES);  
    }  
	
	/** 
     * 将 key的值设为 value, 当且仅当 key不存在 
     * @param key		键 
     * @param value 	值
     * @param timeout 	失效时间
     * @param unit 		失效单位
     * @return 不存在,set 成功 = true;已经存在=false 
     */  
    public boolean setIfAbsent(Serializable key, Serializable value, Long timeout, TimeUnit unit) {  
    	if(timeout == null) {
    		timeout = (long) TIMES;
    	}
    	if(unit == null) {
    		unit = TimeUnit.MINUTES;
    	}
        return setIfAbsent(key, value, timeout, unit);  
    }  
    
    /** 
     * 原子check&set操作 
     * @param redisKey 
     * @param value 
     * @param timeout 
     * @param unit 
     * @return 
     */  
    public boolean setIfAbsent(Serializable redisKey, String value, long timeout, TimeUnit unit) {  
        boolean result = false;  
        if(redisSwitch){  
            try {  
                BoundValueOperations<Serializable, Serializable> boundValueOperations = redisTemplate.boundValueOps(redisKey);  
                result = boundValueOperations.setIfAbsent(value);  
                if(result){  
                    boundValueOperations.expire(timeout, unit);  
                }  
            } catch (Exception e) {  
                logger.error("setIfAbsent error:", e);  
            }  
        }  
        return result;  
    }  

}
