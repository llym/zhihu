package com.jy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.AnswercommentDao;
import com.jy.entity.Answercomment;
import com.jy.service.AnswerCommentService;

@Service("AnswerCommentService")
public class AnswerCommentServiceImpl implements AnswerCommentService{

	@Autowired
	AnswercommentDao answercommentdao;
	
	@Override
	public List<Answercomment> getAnswercommentService(Integer answerid) {
		// TODO Auto-generated method stub
		return answercommentdao.getAnswercomment(answerid);
	}

	@Override
	public void insertAnswercommentService(Answercomment answercomment) {
		// TODO Auto-generated method stub
		answercommentdao.insertAnswercomment(answercomment);
	}

}
