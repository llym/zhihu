package com.jy.dao;

import java.util.List;

import com.jy.entity.Question;

public interface QuestionDao {
	
	public List<Question> getQuestion(String name);
	
	public List<Question> getHotQuestion(Integer topicid);
	
	public List<Question> getHot(Integer topicid);
	
	//获取回答界面的问题信息
	public Question getaQuestion(Integer questionid);
	
	public void addattention(Integer questionid);
	
	public void reduceattention(Integer questionid);
	
	public void addbrowse(Integer questionid);
}