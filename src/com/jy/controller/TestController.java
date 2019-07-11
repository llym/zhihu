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
import com.jy.entity.Article;
import com.jy.entity.Carequestion;
import com.jy.entity.Careuser;
import com.jy.entity.Idea;
import com.jy.entity.Privatemessage;
import com.jy.entity.Question;
import com.jy.entity.Questioncomment;
import com.jy.entity.Ranswercomment;
import com.jy.entity.Rquestioncomment;
import com.jy.entity.User;
import com.jy.entity.hot;
import com.jy.service.AnswerCommentService;
import com.jy.service.AnswerService;
import com.jy.service.ArticleService;
import com.jy.service.CareQuestionService;
import com.jy.service.CareUserService;
import com.jy.service.PrivateMessageService;
import com.jy.service.QuestionCommentService;
import com.jy.service.QuestionService;
import com.jy.service.RAnswerCommentService;
import com.jy.service.RQuestionCommentService;
import com.jy.service.UserService;

@Controller
public class TestController {
	@Autowired
	private QuestionService questionservice ;
	@Autowired
	private UserService userservice;
	@Autowired
	private QuestionCommentService questioncommentservice ;
	@Autowired
	private RQuestionCommentService rquestioncommentservice;
	@Autowired
	private CareUserService  careuserservice;
	@Autowired
	private ArticleService  articleservice;

	
	
	@RequestMapping("searcharticle.do")
	public ModelAndView test3(HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		String name=(String) request.getSession().getAttribute("sear");
		List<Article> arlist =articleservice.searcharticleService(name);
		System.out.println(arlist);
		ModelAndView mav =new ModelAndView("searchArticle");
		mav.addObject("arlist",arlist);
		
		
		return mav;
	}
	
	
	@RequestMapping("/care.do")
	 public ModelAndView  care(HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
		String name=(String) request.getSession().getAttribute("username");		
		List<User> uclist=new ArrayList<User>();	
		List<Careuser> list=careuserservice.getallCUService(name);
		for(int i=0;i<list.size();i++) {
			 System.out.println(list.get(i).getQuserid());  
			 User user=userservice.getUserById(list.get(i).getQuserid());
			 uclist.add(user);
		}
		System.out.println(uclist);
		
		ModelAndView mav =new ModelAndView("care");
		mav.addObject("culist",list);
		mav.addObject("uclist",uclist);
		
		return mav;
	}
	
	
	//取消用户关注
			@ResponseBody
			@RequestMapping(value="/cancelcau.do",produces="html/text;charset=utf-8")
			public String testcare(String queid,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
				System.out.println(queid+"+++++++");
				careuserservice.cancelcaService(Integer.decode(queid));
				return "1";
			}
			//用户关注
			@ResponseBody
			@RequestMapping(value="/careuser.do",produces="html/text;charset=utf-8")
			 public String  careu(String queid,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
				String name=(String) request.getSession().getAttribute("username");	
				Careuser careuser=new Careuser();
				Date data=new Date();
				careuser.setQuserid(queid);
				careuser.setUserid(name);
				careuser.setCreatetime(data);
				System.out.println(queid+"+++++++++++++++++++"+name);
				Careuser testcareuser=careuserservice.testCU(careuser);
				if(testcareuser!=null) {
					return "不能重复关注";
				}
				else if(queid.equals(name)) {
					return "不能关注自己";
				}
				else {
				careuserservice.insertcaService(careuser);
					return "关注成功";
				}
				
			}	
			
				@ResponseBody
				@RequestMapping(value="/upduser.do",produces="html/text;charset=utf-8")
				 public String  careu(String name,String school,String email,String word,String introduce,String sex,HttpServletRequest request,HttpServletResponse reponse,HttpSession session) {
					String userid=(String) request.getSession().getAttribute("username");	
					User user = new User();
					user.setName(name);
					user.setSchool(school);
					user.setAdress(email);
					user.setAutograph(word);
					user.setIntroduce(introduce);
					user.setSex(sex);
					user.setUserid(userid);
					userservice.updateuser(user);
					
					return "修改成功";
					
				}
			
	
}
