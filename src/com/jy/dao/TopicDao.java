package com.jy.dao;

import java.util.List;

import com.jy.entity.Topic;

public interface TopicDao {
    int deleteByPrimaryKey(Integer topicid);

    int insert(Topic record);

    int insertSelective(Topic record);

    Topic selectByPrimaryKey(Integer topicid);

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKey(Topic record);

	List<Topic> getAllTopics();
}