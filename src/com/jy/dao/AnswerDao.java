package com.jy.dao;

import java.util.List;

import com.jy.entity.Answer;
import com.jy.entity.Question;

public interface AnswerDao {
	
	public Answer getAnswer(Integer questionid);
	
}