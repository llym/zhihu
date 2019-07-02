package com.jy.entity;

public class Topic {
    private Integer topicid;

    private String topicname;

    private String topicdescribe;

    private String photo;

    private String createtime;

    public Integer getTopicid() {
        return topicid;
    }

    public void setTopicid(Integer topicid) {
        this.topicid = topicid;
    }

    public String getTopicname() {
        return topicname;
    }

    public void setTopicname(String topicname) {
        this.topicname = topicname == null ? null : topicname.trim();
    }

    public String getTopicdescribe() {
        return topicdescribe;
    }

    public void setTopicdescribe(String topicdescribe) {
        this.topicdescribe = topicdescribe == null ? null : topicdescribe.trim();
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }
}