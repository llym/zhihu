package com.jy.service;

import java.util.List;

import com.jy.entity.Answercomment;

public interface AnswerCommentService {
	public List<Answercomment> getAnswercommentService(Integer answerid);

	public void insertAnswercommentService(Answercomment answercomment);
	
	public void priseacService(Integer commentid);
	
	public void reduceacService(Integer commentid);
	
	public void addacommentService(Integer commentid);
}
