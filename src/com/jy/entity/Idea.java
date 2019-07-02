package com.jy.entity;

import java.util.Date;

public class Idea {
    private Integer ideaid;

    private String userid;

    private String ideacontent;

    private String photo;

    private Integer prisenumb;

    private Date createtime;

    private String status;

    public Integer getIdeaid() {
        return ideaid;
    }

    public void setIdeaid(Integer ideaid) {
        this.ideaid = ideaid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getIdeacontent() {
        return ideacontent;
    }

    public void setIdeacontent(String ideacontent) {
        this.ideacontent = ideacontent == null ? null : ideacontent.trim();
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
    }

    public Integer getPrisenumb() {
        return prisenumb;
    }

    public void setPrisenumb(Integer prisenumb) {
        this.prisenumb = prisenumb;
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