package com.jy.entity;

import java.util.Date;

public class Collect {
    private Integer favoritesid;

    private String favoritesname;

    private String favoritesdescribe;

    private String userid;

    private Date createtime;

    private String status;

    public Integer getFavoritesid() {
        return favoritesid;
    }

    public void setFavoritesid(Integer favoritesid) {
        this.favoritesid = favoritesid;
    }

    public String getFavoritesname() {
        return favoritesname;
    }

    public void setFavoritesname(String favoritesname) {
        this.favoritesname = favoritesname == null ? null : favoritesname.trim();
    }

    public String getFavoritesdescribe() {
        return favoritesdescribe;
    }

    public void setFavoritesdescribe(String favoritesdescribe) {
        this.favoritesdescribe = favoritesdescribe == null ? null : favoritesdescribe.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
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