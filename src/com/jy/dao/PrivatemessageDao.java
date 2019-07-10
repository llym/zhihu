package com.jy.dao;

import java.util.List;

import com.jy.entity.Privatemessage;

public interface PrivatemessageDao {
	
	public List<Privatemessage> getPM(String takeuserid);
	
}