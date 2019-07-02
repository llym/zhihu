package com.jy.service;

import java.util.List;

import com.jy.entity.Follow;

public interface FollowService {
	public List<String> getUserFollow(String name);

	public String addFollow(int user1, int user2);

	public String unfollow(int user1, int user2);

	public void delFollow(int id);
}
