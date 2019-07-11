package com.jy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.TopicDao;
import com.jy.entity.Topic;
import com.jy.service.TopicService;
@Service("TopicService")
public class TopicServiceImpl implements TopicService {
	@Autowired
	TopicDao topicDao;

	@Override
	public List<Topic> getAllTopics() {
		
		return topicDao.getAllTopics();
	}

	@Override
	public List<Topic> getTopics() {
		return topicDao.getTopics();
	}

	@Override
	public String closeUser(int topicid) {
		try {
			topicDao.closeTopic(topicid);
			return "success";
		}catch(Exception e) {
			return "fail";
		}
	}

	@Override
	public String openUser(int topicid) {
		try {
			topicDao.openTopic(topicid);
			return "success";
		}catch(Exception e) {
			return "fail";
		}
	}

	@Override
	public Topic getTopicByid(int topicid) {
		return topicDao.getTopicByid(topicid);
	}

	@Override
	public void updateTopic(Topic topic) {
		topicDao.updateTopic(topic);
		
	}

	@Override
	public void addTopic(Topic topic) {
		topicDao.addTopic(topic);
		
	}
}
