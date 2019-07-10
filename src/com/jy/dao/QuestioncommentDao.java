package com.jy.dao;

import java.util.List;

import com.jy.entity.Questioncomment;

public interface QuestioncommentDao {
    
	public List<Questioncomment> getQuestioncomment(Integer questionid);
	
	public void insertQuestioncomment(Questioncomment questioncomment);
	
	public void priseqc(Integer commentid);
	
	public void reduceqc(Integer commentid);
	
	public void  insertqcomment(Integer commentid);
	
}