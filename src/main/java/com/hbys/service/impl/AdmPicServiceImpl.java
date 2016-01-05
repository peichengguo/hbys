package com.hbys.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hbys.common.Common;
import com.hbys.common.vo.AdmPicVo;
import com.hbys.dao.AdmPicDAO;
import com.hbys.service.AdmPicService;

@Service
public class AdmPicServiceImpl implements AdmPicService{

	@Autowired
	private AdmPicDAO admPicDAO;
	
	@Override
	public int insertAdmPic(AdmPicVo admPicVo) {
		admPicVo.setState(Common.BOOLEAN.YES);
		admPicVo.setUploadTime(new Date());
		return admPicDAO.insertAdmPic(admPicVo);
	}

	@Override
	public AdmPicVo selectAdmPicById(String id) {
		AdmPicVo vo = admPicDAO.selectAdmPicById(id);
		return vo;
	}

	@Override
	public void updateAdmPic(AdmPicVo imgVo) {
		imgVo.setUploadTime(new Date());
		admPicDAO.updateAdmPic(imgVo);
	}

	@Override
	public List<AdmPicVo> selectAllAdmPic(AdmPicVo admPicVo) {
		List<AdmPicVo> result = admPicDAO.selectAllAdmPic(admPicVo);
		return result;
	}

}
