package com.hbys.service;

import com.hbys.common.vo.ImgVo;

public interface ImgService {
	
	public int insertImg(ImgVo imgVo);
	
	public ImgVo selectImgByUserId(String uid);
	
	public void updateImg(ImgVo imgVo);
}
