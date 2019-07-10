package com.jy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.PrivatemessageDao;
import com.jy.dao.QuestioncommentDao;
import com.jy.entity.Privatemessage;
import com.jy.service.PrivateMessageService;

@Service("PrivateMessageService")
public class PrivateMessageServiceImpl implements PrivateMessageService{
	@Autowired
	PrivatemessageDao privatemessagedao;
	
	@Override
	public List<Privatemessage> getPMService(String takeuserid) {
		// TODO Auto-generated method stub
		return privatemessagedao.getPM(takeuserid);
	}

	@Override
	public List<Privatemessage> getuserPMService(Privatemessage privatemessage) {
		// TODO Auto-generated method stub
		return privatemessagedao.getuserPM(privatemessage);
	}

}
