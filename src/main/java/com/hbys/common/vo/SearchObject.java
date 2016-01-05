package com.hbys.common.vo;

public class SearchObject {
	
	private String name;
	
	private String iphone;
	
	private Integer state;
    //当前页数
    private Integer currPage;
    //显示条数
    private Integer showNum;
    //查询开始条数
    private Integer startNum;
    //当前页面显示条数
    private Integer currNum;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIphone() {
		return iphone;
	}

	public void setIphone(String iphone) {
		this.iphone = iphone;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

    public Integer getCurrPage() {
        return currPage;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public void setShowNum(Integer showNum) {
        this.showNum = showNum;
    }

    public Integer getShowNum() {
        return showNum;
    }

    public Integer getStartNum() {
        return startNum;
    }

    public void setStartNum(Integer startNum) {
        this.startNum = startNum;
    }

    public Integer getCurrNum() {
        return currNum;
    }

    public void setCurrNum(Integer currNum) {
        this.currNum = currNum;
    }
}
