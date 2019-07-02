package com.jy.entity;

import java.util.Date;

public class Privatemessage {
    private Integer privmessid;

    private String takeuserid;

    private String senduserid;

    private String privmesscontent;

    private Date createtime;

    private String status;

    public Integer getPrivmessid() {
        return privmessid;
    }

    public void setPrivmessid(Integer privmessid) {
        this.privmessid = privmessid;
    }

    public String getTakeuserid() {
        return takeuserid;
    }

    public void setTakeuserid(String takeuserid) {
        this.takeuserid = takeuserid == null ? null : takeuserid.trim();
    }

    public String getSenduserid() {
        return senduserid;
    }

    public void setSenduserid(String senduserid) {
        this.senduserid = senduserid == null ? null : senduserid.trim();
    }

    public String getPrivmesscontent() {
        return privmesscontent;
    }

    public void setPrivmesscontent(String privmesscontent) {
        this.privmesscontent = privmesscontent == null ? null : privmesscontent.trim();
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