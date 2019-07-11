package com.jy.service;

import java.util.List;

import com.jy.entity.Topic;

public interface TopicService {

	List<Topic> getAllTopics();

	List<Topic> getTopics();

	String closeUser(int topicid);

	String openUser(int topicid);

	Topic getTopicByid(int topicid);

	void updateTopic(Topic topic);

	void addTopic(Topic topic);

}
