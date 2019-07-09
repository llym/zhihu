package com.jy.dao;

import java.util.List;

import com.jy.entity.Answer;

public interface AnswerDao {
	
	public Answer getAnswer(Integer questionid);
	
	public String getPhoto(Integer questionid);
	
	public List<Answer> getallAnswer(Integer questionid);
}