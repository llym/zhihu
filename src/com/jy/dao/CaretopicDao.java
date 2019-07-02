package com.jy.dao;

import com.jy.entity.Caretopic;

public interface CaretopicDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Caretopic record);

    int insertSelective(Caretopic record);

    Caretopic selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Caretopic record);

    int updateByPrimaryKey(Caretopic record);
}