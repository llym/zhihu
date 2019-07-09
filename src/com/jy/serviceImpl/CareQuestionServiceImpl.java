package com.jy.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.AnswerDao;
import com.jy.dao.CarequestionDao;
import com.jy.entity.Carequestion;
import com.jy.service.CareQuestionService;

@Service("CareQuestionService")
public class CareQuestionServiceImpl implements CareQuestionService{

	@Autowired
	CarequestionDao carequestiondao;
	
	@Override
	public void insertCarequestion(Carequestion carequestion) {
		// TODO Auto-generated method stub
		carequestiondao.insertCarequestion(carequestion);
	}

	@Override
	public void reduceCarequestionService(Carequestion carequestion) {
		// TODO Auto-generated method stub
		carequestiondao.reduceCarequestion(carequestion);
	}

	@Override
	public String getCarequestionService(Carequestion carequestion) {
		// TODO Auto-generated method stub
		Carequestion care=carequestiondao.getCarequestion(carequestion);
		if(care!=null) {
			return "1";  //已经关注
		}
		else {
			return "2";
		}
		
	}

}
