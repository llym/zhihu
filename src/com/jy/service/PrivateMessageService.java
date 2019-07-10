package com.jy.service;

import java.util.List;

import com.jy.entity.Privatemessage;

public interface PrivateMessageService {

	public List<Privatemessage> getPMService(String takeuserid);
	
	public List<Privatemessage> getuserPMService(Privatemessage privatemessage);
	
	public void insertPMService(Privatemessage privatemessage);
}
