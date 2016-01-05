package com.hbys.service;

import java.util.List;

import com.hbys.common.vo.FileVo;

public interface AdmFileService {

	public int insertAdmFile(FileVo fileVo);

	public FileVo selectFileVoById(String id);

	public List<FileVo> selectAllFileVo(FileVo fileVo);
	
	public void updateFileVo(FileVo fileVo);
	
}
