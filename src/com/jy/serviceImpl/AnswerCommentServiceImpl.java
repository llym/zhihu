package com.jy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.AnswercommentDao;
import com.jy.entity.Answer;
import com.jy.entity.Answercomment;
import com.jy.service.AnswerCommentService;

@Service("AnswerCommentService")
public class AnswerCommentServiceImpl implements AnswerCommentService{

	@Autowired
	AnswercommentDao answercommentdao;
	
	@Override
	public List<Answercomment> getAnswercommentService(Integer answerid) {
		// TODO Auto-generated method stub
		
		try {
			return answercommentdao.getAnswercomment(answerid);
			}
			catch(Exception e){
				return null;	
		}
	}

	@Override
	public void insertAnswercommentService(Answercomment answercomment) {
		// TODO Auto-generated method stub
		answercommentdao.insertAnswercomment(answercomment);
	}

	@Override
	public void priseacService(Integer commentid) {
		// TODO Auto-generated method stub
		answercommentdao.priseac(commentid);
	}

	@Override
	public void reduceacService(Integer commentid) {
		// TODO Auto-generated method stub
		answercommentdao.reduceac(commentid);
	}

}
