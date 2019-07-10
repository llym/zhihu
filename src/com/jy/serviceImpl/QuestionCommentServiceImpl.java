package com.jy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.AnswercommentDao;
import com.jy.dao.QuestioncommentDao;
import com.jy.entity.Questioncomment;
import com.jy.service.QuestionCommentService;

@Service("QuestionCommentService")
public class QuestionCommentServiceImpl implements QuestionCommentService{
	@Autowired
	QuestioncommentDao questioncommentdao;

	@Override
	public List<Questioncomment> getQuestioncommentService(Integer questionid) {
		// TODO Auto-generated method stub
		try {
			return questioncommentdao.getQuestioncomment(questionid);
			}
			catch(Exception e){
				return null;	
		}
	}

	@Override
	public void insertQuestioncommentService(Questioncomment questioncomment) {
		// TODO Auto-generated method stub
		questioncommentdao.insertQuestioncomment(questioncomment);
	}

	@Override
	public void priseqcService(Integer commentid) {
		// TODO Auto-generated method stub
		questioncommentdao.priseqc(commentid);
	}

	@Override
	public void reduceqcService(Integer commentid) {
		// TODO Auto-generated method stub
		questioncommentdao.reduceqc(commentid);
	}

	@Override
	public void insertqcommentService(Integer commentid) {
		// TODO Auto-generated method stub
		questioncommentdao.insertqcomment(commentid);
	}

}
