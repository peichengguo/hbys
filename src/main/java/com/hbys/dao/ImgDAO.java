package com.hbys.dao;

import com.hbys.common.vo.ImgVo;

public interface ImgDAO {
	
	public int insertImg(ImgVo imgVo);
	
	public ImgVo selectImgByUserId(String uid);

	public void updateImg(ImgVo imgVo);
}
