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

	@Override
	public List<Careuser> getallCUService(String userid) {
		// TODO Auto-generated method stub
		return careuserdao.getallCU(userid);
	}

	@Override
	public void cancelcaService(Integer id) {
		// TODO Auto-generated method stub
		careuserdao.cancelca(id);
	}

	@Override
	public void insertcaService(Careuser careuser) {
		// TODO Auto-generated method stub
		careuserdao.insertca(careuser);
	}

	@Override
	public Careuser testCU(Careuser careuser) {
		// TODO Auto-generated method stub
		return careuserdao.testCU(careuser);
	}

}
