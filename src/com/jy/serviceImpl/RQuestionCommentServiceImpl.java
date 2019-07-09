package com.jy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.QuestionDao;
import com.jy.dao.QuestioncommentDao;
import com.jy.dao.RquestioncommentDao;
import com.jy.entity.Rquestioncomment;
import com.jy.service.RQuestionCommentService;

@Service("RQusetionCommentService")
public class RQuestionCommentServiceImpl implements RQuestionCommentService{

	@Autowired
	RquestioncommentDao rquestioncommentdao;
	
	@Override
	public List<Rquestioncomment> getRquestioncommentService(Integer commentid) {
		// TODO Auto-generated method stub
		return rquestioncommentdao.getRquestioncomment(commentid);
	}

	@Override
	public void insertRquestioncommentService(Rquestioncomment rquestioncomment) {
		// TODO Auto-generated method stub
		rquestioncommentdao.insertRquestioncomment(rquestioncomment);
	}

	@Override
	public void priserqcService(Integer rcommentid) {
		// TODO Auto-generated method stub
		rquestioncommentdao.priserqc(rcommentid);
	}

	@Override
	public void reducerqcService(Integer rcommentid) {
		// TODO Auto-generated method stub
		rquestioncommentdao.reducerqc(rcommentid);
	}

}
