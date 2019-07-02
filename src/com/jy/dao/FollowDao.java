package com.jy.dao;

import java.util.List;

import com.jy.entity.Follow;

public interface FollowDao {
	public List<Follow> getUserFollow(int id);

	public void addFollow(Follow follow);

	public void unfollow(Follow follow);

	public void delFollow(int id);
}
