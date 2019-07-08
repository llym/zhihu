package com.jy.service;

import java.util.List;

import com.jy.entity.Question;

public interface QuestionService {
	
	public List<Question> getQuestionService(String name);
	
	public List<Question> getHotQuestionService(Integer topicid);
}
