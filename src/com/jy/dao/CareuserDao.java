package com.jy.dao;

import com.jy.entity.Careuser;

public interface CareuserDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Careuser record);

    int insertSelective(Careuser record);

    Careuser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Careuser record);

    int updateByPrimaryKey(Careuser record);
}