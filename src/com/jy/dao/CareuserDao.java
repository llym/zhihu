package com.jy.dao;

import java.util.List;

import com.jy.entity.Careuser;

public interface CareuserDao {
	
	public List<Careuser> getCU(String userid);
	
}