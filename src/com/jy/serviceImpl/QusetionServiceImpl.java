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
		return questiondao.getQuestion(name);
	}


	@Override
	public List<Question> getHotQuestionService(Integer topicid) {
		return questiondao.getHotQuestion(topicid);
	}


	@Override
	public List<Question> getHotService(Integer topicid) {
		return questiondao.getHot(topicid);
	}


	@Override
	public Question getaQuestionService(Integer questionid) {
		return questiondao.getaQuestion(questionid);
	}


	@Override
	public void addattentionService(Integer questionid) {
		questiondao.addattention(questionid);
	}


	@Override
	public void reduceattentionService(Integer questionid) {
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
		questiondao.addanswer(questionid);
	}


	@Override
	public List<Question> searchquestionService(String name) {
		return questiondao.searchquestion(name);
	}


	@Override
	public String addQuestion(Question question) {
		try {
			System.out.println("开始插入问题");
			questiondao.addQuestion(question);
			return "发布问题成功！";
		}catch(Exception e) {
			return "发布问题失败！";
		}
	}


	@Override
	public List<Question> getAllQuestion() {
		return questiondao.getAllQuestion();
	}


	@Override
	public String closeQuestion(int questionid) {
		try {
			questiondao.closeQuestion(questionid);
			return "success";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "close fail";
		}
	}


	@Override
	public String openQuestion(int questionid) {
		try {
			questiondao.openQuestion(questionid);
			return "success";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "open fail";
		}
	}

	@Override
	public Question getQuestionByid(int questionid) {
		return questiondao.getQuestionByid(questionid);
	}


	@Override
	public void updateQuestion(Question question) {
		questiondao.updateQuestion(question);
		
	}


	@Override
	public List<Question> adminSearchQ(String qName) {
		
		return questiondao.adminSearchQ(qName);
	}
}
