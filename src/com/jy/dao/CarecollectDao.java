package com.jy.dao;

import com.jy.entity.Carecollect;

public interface CarecollectDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Carecollect record);

    int insertSelective(Carecollect record);

    Carecollect selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Carecollect record);

    int updateByPrimaryKey(Carecollect record);
}