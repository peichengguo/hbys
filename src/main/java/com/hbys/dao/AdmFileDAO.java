package com.hbys.dao;

import java.util.List;

import com.hbys.common.vo.AdmPicVo;
import com.hbys.common.vo.FileVo;

public interface AdmFileDAO {
	
	public int insertAdmFile(FileVo fileVo);

	public FileVo selectFileVoById(String id);

	public List<FileVo> selectAllFileVo(FileVo fileVo);
	
	public void updateFileVo(FileVo fileVo);
	
}
