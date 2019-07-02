package com.jy.entity;

import java.util.Date;

public class Favorites {
    private Integer id;

    private Integer favoritesid;

    private Integer answerid;

    private Date createtime;

    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFavoritesid() {
        return favoritesid;
    }

    public void setFavoritesid(Integer favoritesid) {
        this.favoritesid = favoritesid;
    }

    public Integer getAnswerid() {
        return answerid;
    }

    public void setAnswerid(Integer answerid) {
        this.answerid = answerid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}