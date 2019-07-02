package com.jy.dao;

import com.jy.entity.Answer;

public interface AnswerDao {
    int deleteByPrimaryKey(Integer answerid);

    int insert(Answer record);

    int insertSelective(Answer record);

    Answer selectByPrimaryKey(Integer answerid);

    int updateByPrimaryKeySelective(Answer record);

    int updateByPrimaryKey(Answer record);
}