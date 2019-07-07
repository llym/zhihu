package com.jy.entity;

import java.util.Date;

public class Ranswercomment {
    private Integer rcommentid;

    private Integer commentid;
    
    private String commentuserid;

    private String userid;

    private Integer prisenumb;

    private String commentcontent;

    private Date createtime;

    private String status;

    
    
    public String getCommentuserid() {
		return commentuserid;
	}

	public void setCommentuserid(String commentuserid) {
		this.commentuserid = commentuserid;
	}

	public Integer getRcommentid() {
        return rcommentid;
    }

    public void setRcommentid(Integer rcommentid) {
        this.rcommentid = rcommentid;
    }

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
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