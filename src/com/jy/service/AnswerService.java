package com.jy.service;

import com.jy.entity.Answer;

public interface AnswerService {
	
	public Answer getAnswerService(Integer questionid);
	
	public String getPhotoService(Integer questionid);
}
