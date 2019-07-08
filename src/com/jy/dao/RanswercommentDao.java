package com.jy.dao;

import java.util.List;

import com.jy.entity.Answercomment;
import com.jy.entity.Ranswercomment;

public interface RanswercommentDao {
	
	public List<Ranswercomment> getRanswercomment(Integer commentid);
	
	public void insertRanswercomment(Ranswercomment ranswercomment);

	public void priserac(Integer rcommentid);
	
	public void reducerac(Integer rcommentid);
}