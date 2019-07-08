package com.jy.dao;

import java.util.List;

import com.jy.entity.Question;

public interface QuestionDao {
	
	public List<Question> getQuestion(String name);

	
	public List<Question> getHotQuestion(Integer topicid);
	
}