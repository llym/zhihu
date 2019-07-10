package com.jy.entity;

import java.util.Date;

public class Article {
	   private Integer articleid;

	    private String userid;

	    private String photo;

	    private Integer prisenumb;

	    private String articlename;
	    
	    private String articlecontent;

	    private Date createtime;

	    private String status;

		public Integer getArticleid() {
			return articleid;
		}

		public void setArticleid(Integer articleid) {
			this.articleid = articleid;
		}

		public String getUserid() {
			return userid;
		}

		public void setUserid(String userid) {
			this.userid = userid;
		}

		public String getPhoto() {
			return photo;
		}

		public void setPhoto(String photo) {
			this.photo = photo;
		}

		public Integer getPrisenumb() {
			return prisenumb;
		}

		public void setPrisenumb(Integer prisenumb) {
			this.prisenumb = prisenumb;
		}

		public String getArticlename() {
			return articlename;
		}

		public void setArticlename(String articlename) {
			this.articlename = articlename;
		}

		public String getArticlecontent() {
			return articlecontent;
		}

		public void setArticlecontent(String articlecontent) {
			this.articlecontent = articlecontent;
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
			this.status = status;
		}
	    
	    
}
