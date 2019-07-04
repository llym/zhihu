package com.jy.dao;

import java.util.List;

import com.jy.entity.Answercomment;

public interface AnswercommentDao {
	
	public List<Answercomment> getAnswercomment(Integer answerid);
}