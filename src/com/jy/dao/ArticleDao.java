package com.jy.dao;

import java.util.List;

import com.jy.entity.Article;

public interface ArticleDao {

	void insert(Article article);

	List<Article> getArticleByUser(String user);

}
