package com.dafycredit.id.dao;

import com.dafycredit.id.bean.Counter;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CounterMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Counter record);

    int insertSelective(Counter record);

    Counter selectByPrimaryKey(Long id);
    
    Counter selectByName(String bizName);

    int updateByPrimaryKeySelective(Counter record);

    int updateByPrimaryKey(Counter record);
}