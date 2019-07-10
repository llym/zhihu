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
}
