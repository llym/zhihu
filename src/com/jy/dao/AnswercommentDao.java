package com.jy.dao;

import com.jy.entity.Answercomment;

public interface AnswercommentDao {
    int deleteByPrimaryKey(Integer commentid);

    int insert(Answercomment record);

    int insertSelective(Answercomment record);

    Answercomment selectByPrimaryKey(Integer commentid);

    int updateByPrimaryKeySelective(Answercomment record);

    int updateByPrimaryKey(Answercomment record);
}