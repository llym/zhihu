package com.jy.dao;

import java.util.List;

import com.jy.entity.Idea;

public interface IdeaDao {
    int deleteByPrimaryKey(Integer ideaid);

    int insert(Idea idea);

    int insertSelective(Idea record);

    Idea selectByPrimaryKey(Integer ideaid);

    int updateByPrimaryKeySelective(Idea record);

    int updateByPrimaryKey(Idea record);

	Idea getIdeaById(int id);

	List<Idea> getIdeasByUser(String user);

	void deleteIdea(int id);
}