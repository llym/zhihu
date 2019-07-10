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


	@Override
	public List<Question> getHotQuestionService(Integer topicid) {
		// TODO Auto-generated method stub
		return questiondao.getHotQuestion(topicid);
	}


	@Override
	public List<Question> getHotService(Integer topicid) {
		// TODO Auto-generated method stub
		return questiondao.getHot(topicid);
	}


	@Override
	public Question getaQuestionService(Integer questionid) {
		// TODO Auto-generated method stub
		return questiondao.getaQuestion(questionid);
	}


	@Override
	public void addattentionService(Integer questionid) {
		// TODO Auto-generated method stub
		questiondao.addattention(questionid);
	}


	@Override
	public void reduceattentionService(Integer questionid) {
		// TODO Auto-generated method stub
		questiondao.reduceattention(questionid);
	}


	@Override
	public void addbrowseService(Integer questionid) {
		// TODO Auto-generated method stub
		questiondao.addbrowse(questionid);
	}


	@Override
	public void addqcommentService(Integer questionid) {
		// TODO Auto-generated method stub
		questiondao.addqcomment(questionid);
	}


	@Override
	public void addanswerService(Integer questionid) {
		// TODO Auto-generated method stub
		questiondao.addanswer(questionid);
	}
	

}
