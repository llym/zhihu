package com.jy.service;

import java.util.List;

import com.jy.entity.Question;

public interface QuestionService {
	
	public List<Question> getQuestionService(String name);
	
	public List<Question> getHotQuestionService(Integer topicid);
	
	public List<Question> getHotService(Integer topicid);
	
	public List<Question> searchquestionService(String name);
	
	public Question getaQuestionService(Integer questionid);
	
	public void addattentionService(Integer questionid);//关注
	
	public void reduceattentionService(Integer questionid);//取消关注
	
	public void addbrowseService(Integer questionid);//浏览次数
	
	public void addqcommentService(Integer questionid);
	
	public void addanswerService(Integer questionid);
}
