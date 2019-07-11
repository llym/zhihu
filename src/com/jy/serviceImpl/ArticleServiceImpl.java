package com.jy.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.ArticleDao;
import com.jy.entity.Article;
import com.jy.service.ArticleService;

@Service("ArticleService")
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	ArticleDao articleDao;
	
	@Override
	public String insert(Article article) {
		try {
			articleDao.insert(article);
			
			return "插入article成功！";
		}catch(Exception e) {
			return "插入article失败！";
		}
	}

}
