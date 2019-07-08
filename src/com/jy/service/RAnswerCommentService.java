package com.jy.service;

import java.util.List;

import com.jy.entity.Ranswercomment;

public interface RAnswerCommentService {

	public List<Ranswercomment> getRanswercommentService(Integer commentid);
	
	public void insertRAnswercommentService(Ranswercomment ranswercomment);
	
	public void priseracService(Integer rcommentid);
	
	public void reduceracService(Integer rcommentid);
}
