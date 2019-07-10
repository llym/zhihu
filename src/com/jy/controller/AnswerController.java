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
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Answer;
import com.jy.entity.Answercomment;
import com.jy.entity.Question;
import com.jy.entity.Questioncomment;
import com.jy.entity.Ranswercomment;
import com.jy.entity.Rquestioncomment;
import com.jy.service.AnswerCommentService;
import com.jy.service.AnswerService;
import com.jy.service.QuestionCommentService;
import com.jy.service.QuestionService;
import com.jy.service.RAnswerCommentService;
import com.jy.service.RQuestionCommentService;

@Controller
public class AnswerController {
	@Autowired
	private QuestionCommentService questioncommentservice ;
	@Autowired
	private RQuestionCommentService rquestioncommentservice;
	@Autowired
	private QuestionService questionservice ;
	@Autowired
	private AnswerService answerservice;
	@Autowired
	private AnswerCommentService answercommentservice;
	@Autowired
	private RAnswerCommentService ranswercommentservice;
	//通过questionid来查询
	@RequestMapping("/test.do")
	 public  ModelAndView test(Model model,@RequestParam("questionid") String id){
		Integer a=Integer.decode(id);	//a为前台传的问题id
		Question question=questionservice.getaQuestionService(a);
		questionservice.addbrowseService(a); //浏览次数加一
		System.out.println(question.getQuestionname());
		List<Questioncomment> qlist = questioncommentservice.getQuestioncommentService(question.getQuestionid());
		System.out.println(qlist);
		List<Rquestioncomment> list1 = new ArrayList<Rquestioncomment>();	
		List<Rquestioncomment> list2 = new ArrayList<Rquestioncomment>();	
		for(int i=0;i<qlist.size();i++) {
			 System.out.println(qlist.get(i).getCommentid());  
			 list1=rquestioncommentservice.getRquestioncommentService(qlist.get(i).getCommentid());
			 list2.addAll(list1);
		}
		System.out.println(list2);
		ModelAndView mav =new ModelAndView("WriteAnswer");
		mav.addObject("question",question);
		mav.addObject("questioncomment",qlist);
		mav.addObject("rquestioncomment",list2);
		//上面是问题的评论，下面是回答和回答的评论
		List<Answercomment> anlist1 = new ArrayList<Answercomment>();	
		List<Answercomment> anlist2 = new ArrayList<Answercomment>();	
		List<Ranswercomment> anlist3 = new ArrayList<Ranswercomment>();	
		List<Ranswercomment> anlist4 = new ArrayList<Ranswercomment>();	
		
		List<Answer> anlist=answerservice.getallAnswerService(a);
		for(int i=0;i<anlist.size();i++) {
			 System.out.println(anlist.get(i).getAnswerid());  
			 anlist1=answercommentservice.getAnswercommentService(anlist.get(i).getAnswerid());
			 anlist2.addAll(anlist1);
		}
		 for(int i=0;i<anlist2.size();i++) {
	        	System.out.println(anlist2.get(i).getCommentid()); 
	        	anlist3=ranswercommentservice.getRanswercommentService(anlist2.get(i).getCommentid());
	        	anlist4.addAll(anlist3);
	        }
		 mav.addObject("anlist",anlist);
	     mav.addObject("comlist",anlist2);
	     mav.addObject("rcomlist",anlist4);
		
		return mav;
	}
	//提交回答指令
	@ResponseBody
	@RequestMapping(value="/insertanswer.do",produces="html/text;charset=utf-8")
	public String insertan(String queid,String content,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		Date date = new Date();
		String name=(String) request.getSession().getAttribute("username");
		Answer answer=new Answer();
		answer.setAnswercontent(content);
		answer.setUserid(name);
		answer.setQuestionid(Integer.decode(queid));
		answer.setCreatetime(date);
		
		questionservice.addanswerService(Integer.decode(queid));//
		answerservice.insertAnswerService(answer);
		return "提交成功";
		
	}
	
}
