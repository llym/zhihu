package com.jy.dao;

import com.jy.entity.Ideacomment;

public interface IdeacommentDao {
    int deleteByPrimaryKey(Integer commentid);

    int insert(Ideacomment record);

    int insertSelective(Ideacomment record);

    Ideacomment selectByPrimaryKey(Integer commentid);

    int updateByPrimaryKeySelective(Ideacomment record);

    int updateByPrimaryKey(Ideacomment record);
}