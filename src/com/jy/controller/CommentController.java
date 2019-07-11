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
import com.jy.entity.Questioncomment;
import com.jy.entity.Ranswercomment;
import com.jy.entity.Rquestioncomment;
import com.jy.entity.User;
import com.jy.service.AnswerCommentService;
import com.jy.service.AnswerService;
import com.jy.service.QuestionCommentService;
import com.jy.service.QuestionService;
import com.jy.service.RAnswerCommentService;
import com.jy.service.RQuestionCommentService;
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
	@Autowired
	private QuestionCommentService questioncommentservice ;
	@Autowired
	private RQuestionCommentService rquestioncommentservice;
	
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
			String name=(String) request.getSession().getAttribute("username");
			String userid="111";
			Answercomment answerc=new Answercomment();
			//Integer an=Integer.decode(answerid);
			answerc.setAnswerid(Integer.decode(answerid));
			answerc.setCommentcontent(commentcontent);
			answerc.setUserid(name);
			answerc.setCreatetime(date);
			answerservice.addcommentService(Integer.decode(answerid));	//评论次数++
			answercommentservice.insertAnswercommentService(answerc);
			return "添加成功";
		}
	//回复评论指令
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
				String name=(String) request.getSession().getAttribute("username");
				Ranswercomment ranswerc=new Ranswercomment();
				ranswerc.setCommentid(Integer.decode(commentid));
				ranswerc.setCommentcontent(commentcontent);
				ranswerc.setCommentuserid(queid);
				ranswerc.setUserid(name);
				ranswerc.setCreatetime(date);
				answercommentservice.addacommentService(Integer.decode(commentid));
				ranswercommentservice.insertRAnswercommentService(ranswerc);
				return "添加成功";
			}

		
		//评论点赞
		@ResponseBody
		@RequestMapping(value="/priseac.do",produces="html/text;charset=utf-8")
		public String priseac(String commentid) {
			System.out.println(commentid);
			answercommentservice.priseacService(Integer.decode(commentid));			
			return "赞成功";
		}
		//评论取消点赞
		@ResponseBody
		@RequestMapping(value="/reduceac.do",produces="html/text;charset=utf-8")
		public String reduceac(String commentid) {
			System.out.println(commentid);
			answercommentservice.reduceacService(Integer.decode(commentid));
			return "取消成功";
		}
		//评论点赞
		@ResponseBody
		@RequestMapping(value="/priserac.do",produces="html/text;charset=utf-8")
		public String priserac(String rcommentid) {
			System.out.println(rcommentid);
			ranswercommentservice.priseracService(Integer.decode(rcommentid));
			return "赞成功";
		}
		//评论取消点赞
		@ResponseBody
		@RequestMapping(value="/reducerac.do",produces="html/text;charset=utf-8")
		public String reducerac(String rcommentid) {
			System.out.println(rcommentid);
			ranswercommentservice.reduceracService(Integer.decode(rcommentid));
			return "取消成功";
		}

		//下面是问题
		
		//评论指令
				@ResponseBody
				@RequestMapping(value="/qinsert.do",produces="html/text;charset=utf-8")
				public String qinsert(String commentcontent,String answerid,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
					System.out.println(commentcontent);
					System.out.println(answerid);
					Date date = new Date();
					//SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
					SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd ");
					System.out.println(dateFormat.format(date));
					String name=(String) request.getSession().getAttribute("username");
					String userid="111";
					Questioncomment answerc=new Questioncomment();
					//Integer an=Integer.decode(answerid);
					answerc.setQuestionid(Integer.decode(answerid));
					answerc.setCommentcontent(commentcontent);
					answerc.setUserid(name);
					answerc.setCreatetime(date);
					questionservice.addqcommentService(Integer.decode(answerid));
					questioncommentservice.insertQuestioncommentService(answerc);
					return "添加成功";
				}
		
		
	//回复评论指令
		@ResponseBody
		@RequestMapping(value="/qinsertr.do",produces="html/text;charset=utf-8")
		public String qinsertr(String commentcontent,String commentid,String queid,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
				System.out.println(commentcontent);
				System.out.println(commentid);
				Date date = new Date();
				//SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
				SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd ");
				System.out.println(dateFormat.format(date));
				String name=(String) request.getSession().getAttribute("username");
				Rquestioncomment ranswerc=new Rquestioncomment();
				ranswerc.setCommentid(Integer.decode(commentid));
				ranswerc.setCommentcontent(commentcontent);
				ranswerc.setCommentuserid(queid);
				ranswerc.setUserid(name);
				ranswerc.setCreatetime(date);
				questioncommentservice.insertqcommentService(Integer.decode(commentid));
				rquestioncommentservice.insertRquestioncommentService(ranswerc);
				return "添加成功";
			}
		
		
		//评论点赞
				@ResponseBody
				@RequestMapping(value="/qpriseac.do",produces="html/text;charset=utf-8")
				public String qpriseac(String commentid) {
					System.out.println(commentid);
//					answercommentservice.priseacService(Integer.decode(commentid));
					questioncommentservice.priseqcService(Integer.decode(commentid));
					return "赞成功";
				}
				//评论取消点赞
				@ResponseBody
				@RequestMapping(value="/qreduceac.do",produces="html/text;charset=utf-8")
				public String qreduceac(String commentid) {
					System.out.println(commentid);
//					answercommentservice.reduceacService(Integer.decode(commentid));
					questioncommentservice.reduceqcService(Integer.decode(commentid));
					return "取消成功";
				}
				//评论点赞
				@ResponseBody
				@RequestMapping(value="/qpriserac.do",produces="html/text;charset=utf-8")
				public String qpriserac(String rcommentid) {
					System.out.println(rcommentid);
//					ranswercommentservice.priseracService(Integer.decode(rcommentid));
					rquestioncommentservice.priserqcService(Integer.decode(rcommentid));
					return "赞成功";
				}
				//评论取消点赞
				@ResponseBody
				@RequestMapping(value="/qreducerac.do",produces="html/text;charset=utf-8")
				public String qreducerac(String rcommentid) {
					System.out.println(rcommentid);
//					ranswercommentservice.reduceracService(Integer.decode(rcommentid));
					rquestioncommentservice.reducerqcService(Integer.decode(rcommentid));
					return "取消成功";
				}
		
				
				
				
				//回答点赞
				@ResponseBody
				@RequestMapping(value="/addprise.do",produces="html/text;charset=utf-8")
				public String addprise(String answerid) {
					System.out.println(answerid);
					answerservice.addpriseService(Integer.decode(answerid));
					return "赞成功";
				}
				//评论取消点赞
				@ResponseBody
				@RequestMapping(value="/cancelprise.do",produces="html/text;charset=utf-8")
				public String canceprise(String answerid) {
					System.out.println(answerid);
					answerservice.cancelpriseService(Integer.decode(answerid));
					return "取消成功";
				}
				
				
				
				
				

}
