package com.jy.service;

import java.util.List;

import com.jy.entity.Answer;

public interface AnswerService {
	
	public Answer getAnswerService(Integer questionid);
	
	public String getPhotoService(Integer questionid);
	
	public List<Answer> getallAnswerService(Integer questionid);
	
	public void insertAnswerService(Answer answer);
	
	public void addcommentService(Integer answerid);
	
	public void addpriseService(Integer answerid);
	
	public void cancelpriseService(Integer answerid);
}
