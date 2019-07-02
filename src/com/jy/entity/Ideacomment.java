package com.jy.entity;

import java.util.Date;

public class Ideacomment {
    private Integer commentid;

    private String ideaid;

    private String userid;

    private Integer prisenumb;

    private String commentcontent;

    private Date createtime;

    private String status;

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    public String getIdeaid() {
        return ideaid;
    }

    public void setIdeaid(String ideaid) {
        this.ideaid = ideaid == null ? null : ideaid.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public Integer getPrisenumb() {
        return prisenumb;
    }

    public void setPrisenumb(Integer prisenumb) {
        this.prisenumb = prisenumb;
    }

    public String getCommentcontent() {
        return commentcontent;
    }

    public void setCommentcontent(String commentcontent) {
        this.commentcontent = commentcontent == null ? null : commentcontent.trim();
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