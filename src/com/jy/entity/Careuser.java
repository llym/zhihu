package com.jy.entity;

import java.util.Date;

public class Careuser {
    private Integer id;

    private String quserid;

    private String userid;

    private Date createtime;

    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuserid() {
        return quserid;
    }

    public void setQuserid(String quserid) {
        this.quserid = quserid == null ? null : quserid.trim();
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