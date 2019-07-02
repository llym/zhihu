package com.jy.dao;

import com.jy.entity.Privatemessage;

public interface PrivatemessageDao {
    int deleteByPrimaryKey(Integer privmessid);

    int insert(Privatemessage record);

    int insertSelective(Privatemessage record);

    Privatemessage selectByPrimaryKey(Integer privmessid);

    int updateByPrimaryKeySelective(Privatemessage record);

    int updateByPrimaryKey(Privatemessage record);
}