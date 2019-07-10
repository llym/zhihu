package com.jy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.service.IdeaService;

@Controller
public class IdeaController {
	@Autowired
	IdeaService ideaService;
	
	@ResponseBody
	@RequestMapping(value="deleteIdea.do",produces="html/text;charset=utf-8")
	public String deleteIdea(int id) {
		return ideaService.deleteIdea(id);
	}
}
