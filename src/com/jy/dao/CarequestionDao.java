package com.jy.dao;

import com.jy.entity.Carequestion;

public interface CarequestionDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Carequestion record);

    int insertSelective(Carequestion record);

    Carequestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Carequestion record);

    int updateByPrimaryKey(Carequestion record);
}