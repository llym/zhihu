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
//		System.out.println(a);
//		System.out.println(b);
		return user;	
		}
		catch(Exception e){
			return null;	
			}
		
	}
	
}
