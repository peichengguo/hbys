package com.hbys.common.vo;

public class User {

	private Integer id;
	private String name;
	private String iphone;
	/**籍贯*/
	private String address;
	/**专业方向*/
	private String specialty;
	
	private Integer state;
	
	private String password;
	
	private Integer sex;
	
	private String brith;
	/**当前工作地点*/
	private String workAddress;
	/**曾工作医院*/
	private String beforeWork;
	/**当前待遇*/
	private String currPay;
	/**期望待遇*/
	private String hopePay;
	
	private String hopeWork;
	/**身份证号*/
	private String carNo;
	/**期望工作地点*/
	private String hopeCity;
	/**工作经历*/
	private String workHistory;
	/**执业范围*/
	private String workLimit;
	/** 个人照片路径*/
	private String imgUrl;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getIphone() {
		return iphone;
	}
	public void setIphone(String iphone) {
		this.iphone = iphone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getBrith() {
		return brith;
	}
	public void setBrith(String brith) {
		this.brith = brith;
	}
	public String getWorkAddress() {
		return workAddress;
	}
	public void setWorkAddress(String workAddress) {
		this.workAddress = workAddress;
	}
	public String getBeforeWork() {
		return beforeWork;
	}
	public void setBeforeWork(String beforeWork) {
		this.beforeWork = beforeWork;
	}
	public String getCurrPay() {
		return currPay;
	}
	public void setCurrPay(String currPay) {
		this.currPay = currPay;
	}
	public String getHopePay() {
		return hopePay;
	}
	public void setHopePay(String hopePay) {
		this.hopePay = hopePay;
	}
	public String getHopeWork() {
		return hopeWork;
	}
	public void setHopeWork(String hopeWork) {
		this.hopeWork = hopeWork;
	}
	public String getCarNo() {
		return carNo;
	}
	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}
	public String getHopeCity() {
		return hopeCity;
	}
	public void setHopeCity(String hopeCity) {
		this.hopeCity = hopeCity;
	}
	public String getWorkHistory() {
		return workHistory;
	}
	public void setWorkHistory(String workHistory) {
		this.workHistory = workHistory;
	}
	public String getWorkLimit() {
		return workLimit;
	}
	public void setWorkLimit(String workLimit) {
		this.workLimit = workLimit;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
}
