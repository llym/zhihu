package com.jy.dao;

import com.jy.entity.Questioncomment;

public interface QuestioncommentDao {
    int deleteByPrimaryKey(Integer commentid);

    int insert(Questioncomment record);

    int insertSelective(Questioncomment record);

    Questioncomment selectByPrimaryKey(Integer commentid);

    int updateByPrimaryKeySelective(Questioncomment record);

    int updateByPrimaryKey(Questioncomment record);
}