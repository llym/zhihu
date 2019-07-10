package com.jy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.AnswerDao;
import com.jy.entity.Answer;
import com.jy.entity.Question;
import com.jy.entity.User;
import com.jy.service.AnswerService;

@Service("AnswerService")
public class AnswerServiceImpl implements AnswerService{
	@Autowired
	AnswerDao answerdao;
	
	@Override
	public Answer getAnswerService(Integer questionid) {
		// TODO Auto-generated method stub
		try {
		Answer user=answerdao.getAnswer(questionid);
		String a=user.getUserid();
		String b=user.getAnswercontent();
			return user;	
		}
		catch(Exception e){
			return null;	
		}
	}

	@Override
	public String getPhotoService(Integer questionid) {
		// TODO Auto-generated method stub
		return answerdao.getPhoto(questionid);
	}
	@Override
	public List<Answer> getallAnswerService(Integer questionid) {
		// TODO Auto-generated method stub
		return answerdao.getallAnswer(questionid);
	}

	@Override
	public void insertAnswerService(Answer answer) {
		// TODO Auto-generated method stub
		answerdao.insertAnswer(answer);
	}

	@Override
	public void addcommentService(Integer answerid) {
		// TODO Auto-generated method stub
		answerdao.addcomment(answerid);
	}

}
