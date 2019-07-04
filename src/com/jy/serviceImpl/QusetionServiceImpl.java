package com.jy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.QuestionDao;
import com.jy.entity.Question;
import com.jy.service.QuestionService;

@Service("QusetionService")
public class QusetionServiceImpl implements QuestionService {
	@Autowired
	QuestionDao questiondao;


	@Override
	public List<Question> getQuestionService(String name) {
		// TODO Auto-generated method stub
		return questiondao.getQuestion(name);
	}
	

}
