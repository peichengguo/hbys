package com.hbys.common.vo;

import java.util.Date;

public class ImgVo {
	
	private long id;
	
	private long uId;
	
	private String imgUrl;

	private String imgLitiUrl; 
	
	private String imgDesc;
	
	private Date imgTime;
	
	private Integer imgState;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getuId() {
		return uId;
	}

	public void setuId(long uId) {
		this.uId = uId;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getImgLitiUrl() {
		return imgLitiUrl;
	}

	public void setImgLitiUrl(String imgLitiUrl) {
		this.imgLitiUrl = imgLitiUrl;
	}

	public String getImgDesc() {
		return imgDesc;
	}

	public void setImgDesc(String imgDesc) {
		this.imgDesc = imgDesc;
	}

	public Date getImgTime() {
		return imgTime;
	}

	public void setImgTime(Date imgTime) {
		this.imgTime = imgTime;
	}

	public Integer getImgState() {
		return imgState;
	}

	public void setImgState(Integer imgState) {
		this.imgState = imgState;
	}
	
}
