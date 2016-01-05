package com.hbys.dao;

import java.util.List;

import com.hbys.common.vo.AdmPicVo;

public interface AdmPicDAO {
	
	public int insertAdmPic(AdmPicVo admPicVo);

	public AdmPicVo selectAdmPicById(String id);

	public List<AdmPicVo> selectAllAdmPic(AdmPicVo admPicVo);
	
	public void updateAdmPic(AdmPicVo imgVo);
	
}
