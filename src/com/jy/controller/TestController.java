package com.jy.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Answer;
import com.jy.entity.Answercomment;
import com.jy.entity.Carequestion;
import com.jy.entity.Careuser;
import com.jy.entity.Privatemessage;
import com.jy.entity.Question;
import com.jy.entity.Questioncomment;
import com.jy.entity.Ranswercomment;
import com.jy.entity.Rquestioncomment;
import com.jy.service.AnswerCommentService;
import com.jy.service.AnswerService;
import com.jy.service.CareQuestionService;
import com.jy.service.CareUserService;
import com.jy.service.PrivateMessageService;
import com.jy.service.QuestionCommentService;
import com.jy.service.QuestionService;
import com.jy.service.RAnswerCommentService;
import com.jy.service.RQuestionCommentService;

@Controller
public class TestController {

	@Autowired
	private CareUserService careuserservice;
	@Autowired
	private PrivateMessageService privatemessageservice;
	
	
	@RequestMapping("test1.do")
	public ModelAndView  personal(HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		String name=(String) request.getSession().getAttribute("username");
		List<Careuser> list=careuserservice.getCUService(name);
		String takename = list.get(0).getQuserid();
		if(takename.equals(name)) {
			takename = list.get(0).getUserid();
		}
		System.out.println(takename+"++++++++++++++"+name);
		Privatemessage privatemessage=new Privatemessage();
		privatemessage.setTakeuserid(name);
		privatemessage.setSenduserid(takename);
		List<Privatemessage> list1 =privatemessageservice.getuserPMService(privatemessage);
		System.out.println(list1);
		ModelAndView mav =new ModelAndView("writePM");
     	mav.addObject("culist",list);
		mav.addObject("pmdlist",list1);
		
		mav.addObject("takename",takename);
		
		return mav;
		
	}
	@RequestMapping("/chooseuc.do")
	 public  ModelAndView test(Model model,@RequestParam("takeuserid") String id,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		String name=(String) request.getSession().getAttribute("username");
		System.out.println(id);
		List<Careuser> list=careuserservice.getCUService(name);
		
		Privatemessage privatemessage=new Privatemessage();
		privatemessage.setTakeuserid(name);
		privatemessage.setSenduserid(id);
		List<Privatemessage> list1 =privatemessageservice.getuserPMService(privatemessage);
		System.out.println(list1);
		ModelAndView mav =new ModelAndView("writePM");
     	mav.addObject("culist",list);
		mav.addObject("pmdlist",list1);
		mav.addObject("takename",id);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertpm.do",produces="html/text;charset=utf-8")
	public String insertr(String pmcontent,String queid,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
			System.out.println(pmcontent+"内容");
			System.out.println(queid);
			Date date = new Date();
			String name=(String) request.getSession().getAttribute("username");
			Privatemessage privatemessage=new Privatemessage();
			privatemessage.setTakeuserid(queid);
			privatemessage.setSenduserid(name);
			privatemessage.setCreatetime(date);
			privatemessage.setPrivmesscontent(pmcontent);
			privatemessageservice.insertPMService(privatemessage);
			return "1";
	}
	

}
