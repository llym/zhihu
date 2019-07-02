package com.jy.dao;

import com.jy.entity.Favorites;

public interface FavoritesDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Favorites record);

    int insertSelective(Favorites record);

    Favorites selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Favorites record);

    int updateByPrimaryKey(Favorites record);
}