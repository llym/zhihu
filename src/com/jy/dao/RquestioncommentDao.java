package com.jy.dao;

import java.util.List;

import com.jy.entity.Rquestioncomment;

public interface RquestioncommentDao {
	
	public List<Rquestioncomment> getRquestioncomment(Integer commentid);
	
	public void insertRquestioncomment(Rquestioncomment rquestioncomment);

	public void priserqc(Integer rcommentid);
	
	public void reducerqc(Integer rcommentid);
	
}
