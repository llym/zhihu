package com.jy.service;

import java.util.List;

import com.jy.entity.Careuser;

public interface CareUserService {

	public List<Careuser> getCUService(String userid);
	
	public List<Careuser> getallCUService(String userid);
}
