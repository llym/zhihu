package com.jy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.dao.RanswercommentDao;
import com.jy.entity.Ranswercomment;
import com.jy.service.RAnswerCommentService;

@Service("RAnswerCommentService")
public class RAnswerCommentServiceImpl implements RAnswerCommentService{
	@Autowired
	RanswercommentDao ranswercommentdao; 
	
	@Override
	public List<Ranswercomment> getRanswercommentService(Integer commentid) {
		// TODO Auto-generated method stub
		
		try {
			return ranswercommentdao.getRanswercomment(commentid);
			}
			catch(Exception e){
				return null;	
		}
	}

	@Override
	public void insertRAnswercommentService(Ranswercomment ranswercomment) {
		// TODO Auto-generated method stub
		ranswercommentdao.insertRanswercomment(ranswercomment);
	}

	@Override
	public void priseracService(Integer rcommentid) {
		// TODO Auto-generated method stub
		ranswercommentdao.priserac(rcommentid);
	}

	@Override
	public void reduceracService(Integer rcommentid) {
		// TODO Auto-generated method stub
		ranswercommentdao.priserac(rcommentid);
	}
}
