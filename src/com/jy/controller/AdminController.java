package com.jy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Answer;
import com.jy.entity.Answercomment;
import com.jy.entity.Idea;
import com.jy.entity.QA;
import com.jy.entity.Question;
import com.jy.entity.Ranswercomment;
import com.jy.entity.Topic;
import com.jy.entity.User;
import com.jy.service.AnswerCommentService;
import com.jy.service.AnswerService;
import com.jy.service.IdeaService;
import com.jy.service.QuestionService;
import com.jy.service.RAnswerCommentService;
import com.jy.service.TopicService;
import com.jy.service.UserService;

import net.sf.json.JSONArray;

@Controller
public class AdminController {

	@Autowired
	private UserService userservice;
	@Autowired
	private QuestionService questionservice;
	@Autowired
	private AnswerService answerservice;
	@Autowired
	private AnswerCommentService answercommentservice;
	@Autowired
	private RAnswerCommentService ranswercommentservice;
	@Autowired
	IdeaService ideaService;
	@Autowired
	TopicService topicService;

	@ResponseBody
	@RequestMapping(value = "adminLogin.do", produces = "html/text;charset=utf-8")
	public String adminLogin(String username, String password, HttpServletRequest request) {
		request.getSession().setAttribute("username", username);
		System.out.println("username:" + username + "pa:" + password);
		if (username.equals("admin") && password.equals("123456"))
			return "success";
		else
			return "登录失败！";
	}

	// 进入用户管理
	@RequestMapping("adminUser.do")
	public ModelAndView adminHome(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/adminUser");
		List<User> userList = userservice.getAllUser();
		JSONArray jsonArray = new JSONArray();

		for (User user : userList) {
			jsonArray.add(user);
		}
		// JSONArray object=JSONArray.fromObject(userList);
		mav.addObject("userList", jsonArray);
		return mav;
	}

	// 进入问题管理
	@RequestMapping("adminQuestion.do")
	public ModelAndView adminQuestion(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/adminQuestion");
		List<Question> questionList = questionservice.getAllQuestion();

		JSONArray jsonArray = new JSONArray();

		for (Question question : questionList) {
			jsonArray.add(question);
		}
		// JSONArray object=JSONArray.fromObject(userList);
		mav.addObject("questionList", jsonArray);
		return mav;
	}

	// 进入话题管理
	@RequestMapping("adminTopic.do")
	public ModelAndView adminTopic(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/adminTopic");
		List<Topic> topicList = topicService.getTopics();

		JSONArray jsonArray = new JSONArray();

		for (Topic topic : topicList) {
			jsonArray.add(topic);
		}
		// JSONArray object=JSONArray.fromObject(userList);
		mav.addObject("topicList", jsonArray);
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "getPhotoPath.do", produces = "html/text;charset=utf-8")
	public String getPhotoPath(String id, HttpServletRequest request) {
		User user = userservice.getUserById(id);
		String path = user.getPhoto();
		return path;
	}

	@ResponseBody
	@RequestMapping(value = "getIdeaPhotoPath.do", produces = "html/text;charset=utf-8")
	public String getIdeaPhotoPath(int id, HttpServletRequest request) {
		Idea idea = ideaService.getIdeaById(id);

		String path = idea.getPhoto();
		return path;
	}

	@ResponseBody
	@RequestMapping(value = "closeUser.do", produces = "html/text;charset=utf-8")
	public String closeUser(String userid, HttpServletRequest request) {
		return userservice.closeUser(userid);
	}

	@ResponseBody
	@RequestMapping(value = "openUser.do", produces = "html/text;charset=utf-8")
	public String openUser(String userid, HttpServletRequest request) {
		return userservice.openUser(userid);
	}

	@ResponseBody
	@RequestMapping(value = "closeTopic.do", produces = "html/text;charset=utf-8")
	public String closeTopic(int topicid, HttpServletRequest request) {
		System.out.println(topicid);
		return topicService.closeUser(topicid);
	}

	@ResponseBody
	@RequestMapping(value = "openTopic.do", produces = "html/text;charset=utf-8")
	public String openTopic(int topicid, HttpServletRequest request) {
		System.out.println(topicid);
		return topicService.openUser(topicid);
	}

	@ResponseBody
	@RequestMapping(value = "closeQuestion.do", produces = "html/text;charset=utf-8")
	public String closeQuestion(int questionid, HttpServletRequest request) {
		return questionservice.closeQuestion(questionid);
	}

	@ResponseBody
	@RequestMapping(value = "openQuestion.do", produces = "html/text;charset=utf-8")
	public String openQuestion(int questionid, HttpServletRequest request) {
		return questionservice.openQuestion(questionid);
	}

	// 进入问题修改
	@RequestMapping("updateQ.do")
	public ModelAndView updateQ(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/updateQuestion");
		String qid = request.getParameter("questionid");
		System.out.println("question" + qid);
		int questionid = Integer.parseInt(qid);
		Question question = questionservice.getQuestionByid(questionid);

		mav.addObject("question", question);
		return mav;
	}

	// 进入问题修改
	@RequestMapping("updateT.do")
	public ModelAndView updateT(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/updateTopic");
		String qid = request.getParameter("topicid");
		System.out.println("topic" + qid);
		int topicid = Integer.parseInt(qid);
		Topic topic = topicService.getTopicByid(topicid);

		mav.addObject("topic", topic);
		return mav;
	}

	@RequestMapping("saveQU.do")
	public ModelAndView saveQU(HttpServletRequest request, int qId, String qTitle, String qDes, int qBnum) {
		ModelAndView mav = new ModelAndView("redirect:/adminQuestion.do");
		Question question = new Question();
		question.setQuestionid(qId);
		question.setQuestionname(qTitle);
		question.setQuestiondescribe(qDes);
		question.setBrowsenumb(qBnum);
		questionservice.updateQuestion(question);

		// JSONArray object=JSONArray.fromObject(userList);
		return mav;
	}
	
	@RequestMapping("saveTU.do")
	public ModelAndView saveTU(HttpServletRequest request, int tId, String tTitle, String tDes) {
		ModelAndView mav = new ModelAndView("redirect:/adminTopic.do");
		Topic topic = new Topic();
		topic.setTopicid(tId);
		topic.setTopicdescribe(tDes);
		topic.setTopicname(tTitle);
		System.out.println("kaishi修改");
		topicService.updateTopic(topic);
		return mav;
	}
	@RequestMapping("addTopic.do")
	public ModelAndView addTopic(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/addTopic");
		return mav;
	}

	@RequestMapping("saveAT.do")
	public ModelAndView saveAT(HttpServletRequest request,String tTitle, String tDes) {
		ModelAndView mav = new ModelAndView("redirect:/adminTopic.do");
		Topic topic = new Topic();
		topic.setTopicdescribe(tDes);
		topic.setTopicname(tTitle);
		System.out.println("新增话题");
		topicService.addTopic(topic);
		return mav;
	}
	@RequestMapping("adminSearchUser.do")
	public ModelAndView adminSearchUser(HttpServletRequest request,String userid) {
		ModelAndView mav = new ModelAndView("admin/adminUser");
		List<User> userList = userservice.adminSearchUser(userid);
		JSONArray jsonArray = new JSONArray();

		for (User user : userList) {
			jsonArray.add(user);
		}
		mav.addObject("userList", jsonArray);
		return mav;
	}
	@RequestMapping("adminSearchQ.do")
	public ModelAndView adminSearchQ(HttpServletRequest request,String qName) {
		ModelAndView mav = new ModelAndView("admin/adminQuestion");
		List<Question> questionList = questionservice.adminSearchQ(qName);
		JSONArray jsonArray = new JSONArray();

		for (Question question : questionList) {
			jsonArray.add(question);
		}
		mav.addObject("questionList", jsonArray);
		return mav;
	}
}
