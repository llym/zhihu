package com.jy.service;

import java.util.List;

import com.jy.entity.Article;

public interface ArticleService {

	String insert(Article article);

	List<Article> getArticleByUser(String user);

	String deleteArticle(int id);

}
