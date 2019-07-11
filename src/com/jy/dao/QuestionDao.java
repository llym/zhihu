package com.jy.dao;

import java.util.List;

import com.jy.entity.Question;

public interface QuestionDao {
	
	public List<Question> getQuestion(String name);
	
	public List<Question> getHotQuestion(Integer topicid);
	
	public List<Question> getHot(Integer topicid);
	
	public List<Question> searchquestion(String name);
	
	//获取回答界面的问题信息
	public Question getaQuestion(Integer questionid);
	
	public void addattention(Integer questionid);
	
	public void reduceattention(Integer questionid);
	
	public void addbrowse(Integer questionid);
	
	public void addqcomment(Integer questionid);
	
	public void addanswer(Integer questionid);

	public void addQuestion(Question question);

	public List<Question> getAllQuestion();

	public void closeQuestion(int questionid);

	public void openQuestion(int questionid);

	public Question getQuestionByid(int questionid);

	public void updateQuestion(Question question);

	public List<Question> adminSearchQ(String qName);
}