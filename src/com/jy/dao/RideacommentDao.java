package com.jy.dao;

import com.jy.entity.Rideacomment;

public interface RideacommentDao {
    int deleteByPrimaryKey(Integer rcommentid);

    int insert(Rideacomment record);

    int insertSelective(Rideacomment record);

    Rideacomment selectByPrimaryKey(Integer rcommentid);

    int updateByPrimaryKeySelective(Rideacomment record);

    int updateByPrimaryKey(Rideacomment record);
}