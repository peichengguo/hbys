package com.hbys.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hbys.common.Common;
import com.hbys.common.vo.ImgVo;
import com.hbys.dao.ImgDAO;
import com.hbys.service.ImgService;

@Service
public class ImgServiceImpl implements ImgService{

	@Autowired
	private ImgDAO imgDAO;
	
	@Override
	public int insertImg(ImgVo imgVo) {
		imgVo.setImgState(Common.BOOLEAN.YES);
		imgVo.setImgTime(new Date());
		
		return imgDAO.insertImg(imgVo);
	}

	@Override
	public ImgVo selectImgByUserId(String uid) {
		return imgDAO.selectImgByUserId(uid);
	}

	@Override
	public void updateImg(ImgVo imgVo) {
		imgVo.setImgTime(new Date());
		imgDAO.updateImg(imgVo);
	}

}
