package com.hbys.service;

import java.util.List;

import com.hbys.common.vo.AdmPicVo;

public interface AdmPicService {

	public int insertAdmPic(AdmPicVo admPicVo);

	public AdmPicVo selectAdmPicById(String id);
	
	public List<AdmPicVo> selectAllAdmPic(AdmPicVo admPicVo);

	public void updateAdmPic(AdmPicVo imgVo);
	
}
