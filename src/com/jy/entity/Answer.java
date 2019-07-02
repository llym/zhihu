package com.jy.entity;

import java.util.Date;

public class Answer {
    private Integer answerid;

    private Integer questionid;

    private Integer topicid;

    private String userid;

    private String photo;

    private String answercontent;

    private Integer prisenumb;

    private Integer commentnumb;

    private String anonymity;

    private Date createtime;

    private String status;

    public Integer getAnswerid() {
        return answerid;
    }

    public void setAnswerid(Integer answerid) {
        this.answerid = answerid;
    }

    public Integer getQuestionid() {
        return questionid;
    }

    public void setQuestionid(Integer questionid) {
        this.questionid = questionid;
    }

    public Integer getTopicid() {
        return topicid;
    }

    public void setTopicid(Integer topicid) {
        this.topicid = topicid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
    }

    public String getAnswercontent() {
        return answercontent;
    }

    public void setAnswercontent(String answercontent) {
        this.answercontent = answercontent == null ? null : answercontent.trim();
    }

    public Integer getPrisenumb() {
        return prisenumb;
    }

    public void setPrisenumb(Integer prisenumb) {
        this.prisenumb = prisenumb;
    }

    public Integer getCommentnumb() {
        return commentnumb;
    }

    public void setCommentnumb(Integer commentnumb) {
        this.commentnumb = commentnumb;
    }

    public String getAnonymity() {
        return anonymity;
    }

    public void setAnonymity(String anonymity) {
        this.anonymity = anonymity == null ? null : anonymity.trim();
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