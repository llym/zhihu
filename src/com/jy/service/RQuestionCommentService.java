package com.jy.service;

import java.util.List;

import com.jy.entity.Rquestioncomment;

public interface RQuestionCommentService {

	public List<Rquestioncomment> getRquestioncommentService(Integer commentid);
	
	public void insertRquestioncommentService(Rquestioncomment rquestioncomment);

	public void priserqcService(Integer rcommentid);
	
	public void reducerqcService(Integer rcommentid);
}
