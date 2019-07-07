package com.jy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.jy.entity.QA;
import com.jy.entity.Question;
import com.jy.entity.Ranswercomment;
import com.jy.entity.User;
import com.jy.service.AnswerCommentService;
import com.jy.service.AnswerService;
import com.jy.service.QuestionService;
import com.jy.service.RAnswerCommentService;
import com.jy.service.UserService;


@Controller
public class CommentController {
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
	
	//评论指令
			@ResponseBody
			@RequestMapping(value="/insert.do",produces="html/text;charset=utf-8")
			public String insert(String commentcontent,String answerid,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
				System.out.println(commentcontent);
				System.out.println(answerid);
				Date date = new Date();
				//SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
				SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd ");
				System.out.println(dateFormat.format(date));
				String userid="111";
				Answercomment answerc=new Answercomment();
				//Integer an=Integer.decode(answerid);
				answerc.setAnswerid(Integer.decode(answerid));
				answerc.setCommentcontent(commentcontent);
				answerc.setUserid(userid);
				answerc.setCreatetime(date);
				
				answercommentservice.insertAnswercommentService(answerc);
				return "添加成功";
			}
			//评论指令
					@ResponseBody
					@RequestMapping(value="/insertr.do",produces="html/text;charset=utf-8")
					public String insertr(String commentcontent,String commentid,String queid,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
						System.out.println(commentcontent);
						System.out.println(commentid);
						Date date = new Date();
						//SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
						SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd ");
						System.out.println(dateFormat.format(date));
						String userid="111";
						Ranswercomment ranswerc=new Ranswercomment();
						ranswerc.setCommentid(Integer.decode(commentid));
						ranswerc.setCommentcontent(commentcontent);
						ranswerc.setCommentuserid(queid);
						ranswerc.setUserid(userid);
						ranswerc.setCreatetime(date);
						ranswercommentservice.insertRAnswercommentService(ranswerc);
						return "添加成功";
					}
}
