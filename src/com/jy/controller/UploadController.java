package com.jy.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Article;
import com.jy.entity.Idea;
import com.jy.entity.Question;
import com.jy.entity.UploadedImageFile;
import com.jy.service.ArticleService;
import com.jy.service.IdeaService;
import com.jy.service.QuestionService;

@Controller
public class UploadController {
	@Autowired
	IdeaService ideaService;
	@Autowired
	ArticleService articleService;
	@Autowired
	QuestionService questionService;
	
	@RequestMapping("/uploadIdea.do")
	public ModelAndView upload(HttpServletRequest request, UploadedImageFile file,String ideacontent)
			throws IllegalStateException, IOException {
		System.out.println(ideacontent);
		Idea idea = new Idea();
		idea.setIdeacontent(ideacontent);
		String userid = (String) request.getSession().getAttribute("username");
		idea.setUserid(userid);
		
		//保存上传的图片
		String name = RandomStringUtils.randomAlphanumeric(10);
		String newFileName = name + ".jpg";
		System.out.println(newFileName);//输出保存图片的随机名称，避免重复覆盖
		File newFile = new File("D:\\update", newFileName);//前一字符串设置图片文件的存放位置
		newFile.getParentFile().mkdirs();
		file.getImage().transferTo(newFile);//存放图片
		
		idea.setPhoto("/pic/"+newFileName);
		idea.setCreatetime(new Date());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(df.format(new Date()));// 
		System.out.println(ideaService.insert(idea));
		
		ModelAndView mav = new ModelAndView("redirect:/myPage.do");
		return mav;
	}
	
	@RequestMapping("/publishArticle.do")
	public ModelAndView publishArticle(HttpServletRequest request,
			UploadedImageFile file)
			throws IllegalStateException, IOException {
		System.out.println("pa");
		String articleTitle = request.getParameter("articleTitle");
		System.out.println("title:"+articleTitle);
		String articleContent = request.getParameter("articleContent");
		System.out.println("content"+articleContent);
		//保存上传的图片
		String name = RandomStringUtils.randomAlphanumeric(10);
		String newFileName = name + ".jpg";
		System.out.println(newFileName);//输出保存图片的随机名称，避免重复覆盖
		File newFile = new File("D:\\update", newFileName);//前一字符串设置图片文件的存放位置
		newFile.getParentFile().mkdirs();
		file.getImage().transferTo(newFile);//存放图片
		
		String userid = (String) request.getSession().getAttribute("username");
		Article article = new Article();
		article.setUserid(userid);
		article.setCreatetime(new Date());
		article.setArticlename(articleTitle);
		article.setArticlecontent(articleContent);
		article.setPhoto("/pic/"+newFileName);
		System.out.println(articleService.insert(article));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(df.format(new Date()));// 
		
		ModelAndView mav = new ModelAndView("redirect:/myPage.do");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="publishQuestion.do",produces="html/text;charset=utf-8")
	public String deleteIdea(String userid,int topic,String questionName,String description) {
		Question question = new Question();
		System.out.println("userid+"+userid);
		System.out.println(topic);
		System.out.println(questionName);
		question.setUserid(userid);
		question.setQuestiondescribe(description);
		question.setQuestionname(questionName);
		question.setTopicid(topic);
		question.setCreatetime(new Date());
		return questionService.addQuestion(question);
	}
	
}
