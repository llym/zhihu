package com.jy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.CareuserDao;
import com.jy.entity.Careuser;
import com.jy.service.CareUserService;

@Service("CareUserService")
public class CareUserServiceImpl implements CareUserService{
	@Autowired
	CareuserDao careuserdao;
	
	@Override
	public List<Careuser> getCUService(String userid) {
		// TODO Auto-generated method stub
		return careuserdao.getCU(userid);
	}

}
