package com.jy.dao;

import java.util.List;

import com.jy.entity.Careuser;

public interface CareuserDao {
	
	public List<Careuser> getCU(String userid);
	
	public List<Careuser> getallCU(String userid);
	
	public void cancelca(Integer id);
	
	public void insertca(Careuser careuser);
	
	public Careuser testCU(Careuser careuser);
}