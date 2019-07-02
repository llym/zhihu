package com.jy.dao;

import com.jy.entity.Ranswercomment;

public interface RanswercommentDao {
    int deleteByPrimaryKey(Integer rcommentid);

    int insert(Ranswercomment record);

    int insertSelective(Ranswercomment record);

    Ranswercomment selectByPrimaryKey(Integer rcommentid);

    int updateByPrimaryKeySelective(Ranswercomment record);

    int updateByPrimaryKey(Ranswercomment record);
}