package com.hbys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hbys.common.vo.FileVo;
import com.hbys.dao.AdmFileDAO;
import com.hbys.service.AdmFileService;

@Service
public class AdmFileServiceImpl implements AdmFileService{

	@Autowired
	private AdmFileDAO admFileDAO;
	
	
	@Override
	public int insertAdmFile(FileVo fileVo) {
		return admFileDAO.insertAdmFile(fileVo);
	}

	@Override
	public FileVo selectFileVoById(String id) {
		
		return admFileDAO.selectFileVoById(id);
	}

	@Override
	public List<FileVo> selectAllFileVo(FileVo fileVo) {
		
		return admFileDAO.selectAllFileVo(fileVo);
	}

	@Override
	public void updateFileVo(FileVo fileVo) {
		admFileDAO.updateFileVo(fileVo);
	}

}
