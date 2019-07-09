package com.jy.dao;

import com.jy.entity.Carequestion;

public interface CarequestionDao {

	public void insertCarequestion(Carequestion carequestion);
	
	public void reduceCarequestion(Carequestion carequestion);
	
	public Carequestion getCarequestion(Carequestion carequestion);
}