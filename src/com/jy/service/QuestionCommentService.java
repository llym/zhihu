package com.jy.service;

import java.util.List;

import com.jy.entity.Questioncomment;

public interface QuestionCommentService {
	public List<Questioncomment> getQuestioncommentService(Integer questionid);
	
	public void insertQuestioncommentService(Questioncomment questioncomment);
	
	public void priseqcService(Integer commentid);
	
	public void reduceqcService(Integer commentid);
	
	public void  insertqcommentService(Integer commentid);
}
