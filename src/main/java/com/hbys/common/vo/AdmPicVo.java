package com.hbys.common.vo;

import java.util.Date;

public class AdmPicVo {

	private Long id;
	
	private String picType;
	
	private String srcUrl;

	private String litiUrl; 
	
	private String picDesc;
	
	private Date uploadTime;
	
	private Integer state;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPicType() {
		return picType;
	}

	public void setPicType(String picType) {
		this.picType = picType;
	}

	public String getSrcUrl() {
		return srcUrl;
	}

	public void setSrcUrl(String srcUrl) {
		this.srcUrl = srcUrl;
	}

	public String getLitiUrl() {
		return litiUrl;
	}

	public void setLitiUrl(String litiUrl) {
		this.litiUrl = litiUrl;
	}

	public String getPicDesc() {
		return picDesc;
	}

	public void setPicDesc(String picDesc) {
		this.picDesc = picDesc;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}
	
	
	
}
