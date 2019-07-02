package com.jy.entity;

import java.util.Date;

public class Question {
    private Integer questionid;

    private Integer topicid;

    private String userid;

    private String questionname;

    private String questiondescribe;

    private String photo;

    private Integer answernumb;

    private Integer attentionnumb;

    private Integer browsenumb;

    private String anonymity;

    private Date createtime;

    private String status;

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

    public String getQuestionname() {
        return questionname;
    }

    public void setQuestionname(String questionname) {
        this.questionname = questionname == null ? null : questionname.trim();
    }

    public String getQuestiondescribe() {
        return questiondescribe;
    }

    public void setQuestiondescribe(String questiondescribe) {
        this.questiondescribe = questiondescribe == null ? null : questiondescribe.trim();
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
    }

    public Integer getAnswernumb() {
        return answernumb;
    }

    public void setAnswernumb(Integer answernumb) {
        this.answernumb = answernumb;
    }

    public Integer getAttentionnumb() {
        return attentionnumb;
    }

    public void setAttentionnumb(Integer attentionnumb) {
        this.attentionnumb = attentionnumb;
    }

    public Integer getBrowsenumb() {
        return browsenumb;
    }

    public void setBrowsenumb(Integer browsenumb) {
        this.browsenumb = browsenumb;
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