package com.jy.dao;

import com.jy.entity.Question;

public interface QuestionDao {
    int deleteByPrimaryKey(Integer questionid);

    int insert(Question record);

    int insertSelective(Question record);

    Question selectByPrimaryKey(Integer questionid);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKey(Question record);
}