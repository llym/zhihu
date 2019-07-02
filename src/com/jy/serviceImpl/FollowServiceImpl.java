package com.jy.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.FollowDao;
import com.jy.dao.UserDao;
import com.jy.entity.Follow;
import com.jy.service.FollowService;
@Service("FollowService")
public class FollowServiceImpl implements FollowService {

	@Autowired
	FollowDao followDao;
	@Autowired
	UserDao userDao;
	@Override
	public List<String> getUserFollow(String name) {
		//获取指定用户的关注列表
		int id = userDao.findUserByName(name).getId();
		List<Follow> followList =followDao.getUserFollow(id);
		List<String> nameList = new ArrayList<String>();
		for(Follow f : followList) {
			nameList.add(userDao.getUserById(f.getUser2()).getName());
			
		}
		return nameList;
	}
	@Override
	public String addFollow(int user1, int user2) {
		Follow follow = new Follow();
		follow.setUser1(user1);
		follow.setUser2(user2);
		try {
			followDao.addFollow(follow);
			return "关注成功";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "关注失败";
		}
		
	}
	@Override
	public String unfollow(int user1, int user2) {
		Follow follow = new Follow();
		follow.setUser1(user1);
		follow.setUser2(user2);
		try {
			followDao.unfollow(follow);
			return "取消关注成功";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "取消关注失败";
		}
	}
	@Override
	public void delFollow(int id) {
		try {
			System.out.println("开始解绑关注关系");
			followDao.delFollow(id);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			
		}
		
	}

}
