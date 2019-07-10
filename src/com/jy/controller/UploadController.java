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
import org.springframework.web.servlet.ModelAndView;

import com.jy.entity.Idea;
import com.jy.entity.UploadedImageFile;
import com.jy.service.IdeaService;

@Controller
public class UploadController {
	@Autowired
	IdeaService ideaService;
	
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
}
