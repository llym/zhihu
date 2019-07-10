package com.jy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.IdeaDao;
import com.jy.entity.Idea;
import com.jy.service.IdeaService;
@Service("IdeaService")
public class IdeaServiceImpl implements IdeaService {
	@Autowired
	IdeaDao ideaDao;
	@Override
	public String insert(Idea idea) {
		try {
			ideaDao.insert(idea);
			return "插入想法成功";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "插入想法fail";
			
		}

	}
	@Override
	public Idea getIdeaById(int id) {
		
		return ideaDao.getIdeaById(id);
	}
	@Override
	public List<Idea> getIdeasByUser(String user) {
		
		return ideaDao.getIdeasByUser(user);
	}
	@Override
	public String deleteIdea(int id) {
		try {
			ideaDao.deleteIdea(id);
			return "success";
		}catch(Exception e) {
			
			System.out.println(e.getMessage());
			return "fail";
		}
		
	}

}
