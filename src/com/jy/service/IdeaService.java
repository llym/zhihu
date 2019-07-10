package com.jy.service;

import java.util.List;

import com.jy.entity.Idea;

public interface IdeaService {
	public String insert(Idea idea);

	public Idea getIdeaById(int id);

	public List<Idea> getIdeasByUser(String user);

	public String deleteIdea(int id);
}
