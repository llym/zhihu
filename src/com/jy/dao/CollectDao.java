package com.jy.dao;

import com.jy.entity.Collect;

public interface CollectDao {
    int deleteByPrimaryKey(Integer favoritesid);

    int insert(Collect record);

    int insertSelective(Collect record);

    Collect selectByPrimaryKey(Integer favoritesid);

    int updateByPrimaryKeySelective(Collect record);

    int updateByPrimaryKey(Collect record);
}