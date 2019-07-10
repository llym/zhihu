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
import com.jy.entity.Privatemessage;
import com.jy.entity.QA;
import com.jy.entity.Question;
import com.jy.entity.Ranswercomment;
import com.jy.entity.User;
import com.jy.service.AnswerCommentService;
import com.jy.service.AnswerService;
import com.jy.service.PrivateMessageService;
import com.jy.service.QuestionService;
import com.jy.service.RAnswerCommentService;
import com.jy.service.UserService;


@Controller
public class LoginController {
	
	@Autowired
	private UserService userservice;
	@Autowired
	private QuestionService questionservice ;
	@Autowired
	private AnswerService answerservice;
	@Autowired
	private AnswerCommentService answercommentservice;
	@Autowired
	private RAnswerCommentService ranswercommentservice;
	@Autowired
	private PrivateMessageService privatemessageService;
	
	//主界面
	@RequestMapping("/homePage.do")
	 public ModelAndView s(){
		List<Question> Hlist= questionservice.getQuestionService("");
		List<QA> list = new ArrayList<QA>();	
		List<Answercomment> list1 = new ArrayList<Answercomment>();	
		List<Answercomment> list2 = new ArrayList<Answercomment>();	
		List<Ranswercomment> list3 = new ArrayList<Ranswercomment>();	
		List<Ranswercomment> list4 = new ArrayList<Ranswercomment>();	
         //遍历questionid，去answer表里找最热的评论，读取对应数据存到新的list集合去         
        for(int i=0;i<Hlist.size();i++) {
            	 System.out.println(Hlist.get(i).getQuestionid());  
            	 QA qa=new QA();
            	 Answer answer =new Answer();
            	 answer=answerservice.getAnswerService(Hlist.get(i).getQuestionid());
            	 if(answer!=null) {
            	 //System.out.println(answer.getPrisenumb());   
            	 qa.setQuestionid(answer.getQuestionid());
            	 qa.setName(Hlist.get(i).getQuestionname());
            	 qa.setPhoto(answer.getPhoto());
            	 qa.setDescribe(answer.getAnswercontent());
            	 qa.setPrisenumb(answer.getPrisenumb());
            	 qa.setCommentnumb(answer.getCommentnumb());
            	 qa.setUserid(answer.getUserid());
            	 qa.setAnswerid(answer.getAnswerid());
            	 list.add(qa);
            	 Integer answerid=answer.getAnswerid();
            	 list1=answercommentservice.getAnswercommentService(answerid);
            	 list2.addAll(list1);
            	 }
            }
        for(int i=0;i<list2.size();i++) {
        	System.out.println(list2.get(i).getCommentid()); 
        	Integer commentid=list2.get(i).getCommentid();
        	list3=ranswercommentservice.getRanswercommentService(commentid);
        	list4.addAll(list3);
        }
        	System.out.println(list4);
			ModelAndView mav =new ModelAndView("homePage");
			mav.addObject("quelist",list);
			mav.addObject("comlist",list2);
			mav.addObject("rcomlist",list4);
			
			return mav;
		}
	
	//登录指令
	@ResponseBody
	@RequestMapping(value="/login.do",produces="html/text;charset=utf-8")
	public String login(String username,String password,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		System.out.println(username+"++++"+password);
		session.setAttribute("username",username);
		String a=userservice.findUserService(username,password,session);
		List<Privatemessage> list=privatemessageService.getPMService(username);
		request.getSession().setAttribute("pmlist",list);
		System.out.println(a);
		return a;
	}
	//注册指令
	@ResponseBody
	@RequestMapping(value="/register.do",produces="html/text;charset=utf-8")
	public String register(String telnum,String password,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		System.out.println(telnum+"++++"+password);
		User user = new User();
		user.setTelnum(telnum);
		user.setPassword(password);
		String result=	userservice.insertUserService(user);
		return result;
	}
	
	//检查手机号是否重复
	@ResponseBody
	@RequestMapping(value="/checkTelnum.do",produces="html/text;charset=utf-8")
	public String checkTelnum(String telnum,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		System.out.println(telnum);
		User user = new User();
		user.setTelnum(telnum);
		String result=	userservice.checkTelnumService(user);
		return result;
	}
	

}
