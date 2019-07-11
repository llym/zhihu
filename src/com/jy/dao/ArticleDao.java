package com.jy.dao;

import java.util.List;

import com.jy.entity.Article;

public interface ArticleDao {

	void insert(Article article);

	List<Article> getArticleByUser(String user);

	void deleteArticle(int id);

	List<Article> searcharticle(String name);
}
