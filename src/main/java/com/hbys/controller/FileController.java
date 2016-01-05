package com.hbys.controller;

import com.hbys.common.Common;
import com.hbys.common.ImageUtils;
import com.hbys.common.vo.FileVo;
import com.hbys.service.AdmFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/file")
public class FileController {
	
	@Autowired
	private AdmFileService admFileService;

	@RequestMapping("to_file_down")
	public String toFileUpload(HttpServletRequest request,Model model){
		FileVo fileVo = new FileVo();
		List<FileVo> fileVoList = admFileService.selectAllFileVo(fileVo);
		model.addAttribute("fileVoList", fileVoList);
		return "fileDownload";
	}
	
	@RequestMapping("download")
	public void downFile(HttpServletRequest request,HttpServletResponse response,String id) {
		if(StringUtils.isEmpty(id)){
			return;
		}
		FileVo fileVo = admFileService.selectFileVoById(id);
		String fileName = fileVo.getFileName();
		fileName = processFileName(request, fileName);
		String fileUrl = fileVo.getFileUrl();
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//		headers.setContentDispositionFormData("attachment", fileName);
		String realPath = request.getSession().getServletContext().getRealPath("/");
		String filePath = realPath + File.separator + fileUrl;
		response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
        InputStream inputStream = null;
		OutputStream os = null;
		try {
			inputStream = new FileInputStream(new File(filePath));
			os = response.getOutputStream();
			byte[] b = new byte[2048];
			int length;
			while ((length = inputStream.read(b)) > 0) {
			    os.write(b, 0, length);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
	        try {
	        	if(os != null){
	        		os.close();	        		
	        	}
	        	if(inputStream != null){	        		
	        		inputStream.close();
	        	}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
        
	}
	
	@RequestMapping("upload_file")
	public String uploadFile(@RequestParam MultipartFile file,HttpServletRequest request){
		String realPath = request.getSession().getServletContext().getRealPath("/");
		String proJectPath = File.separator + "upload" + File.separator + "file";
		String filePath = realPath + proJectPath;
		String fileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		String fileType = file.getContentType();
		String suffix = fileName.substring(fileName.lastIndexOf(".")+1);
		String uploadName = System.currentTimeMillis() + new Random(50000).nextInt() + "." + suffix;
		
		File targetFile = new File(filePath,uploadName);
		if(!targetFile.exists()){
			targetFile.mkdirs();
		}
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		FileVo fileVo = new FileVo();
		fileVo.setFileUrl(proJectPath + File.separator + uploadName);
		fileVo.setFileName(fileName);
		fileVo.setFileSize(fileSize);
		fileVo.setTime(new Date());
		fileVo.setState(Common.BOOLEAN.YES);
		admFileService.insertAdmFile(fileVo);
		return "admin/fileUploadManager";
	}
	
	
	@RequestMapping(value="upload_img")
	@ResponseBody
	public String uploadImg(HttpServletRequest request,HttpServletResponse response,
			String x,String y,String w,String h,String compressWid,@RequestParam MultipartFile imgFile){
		if(StringUtils.isEmpty(w)){
			return "";
		}
		//判断图片后缀
		String name = imgFile.getOriginalFilename();
		String suffix = name.substring(name.lastIndexOf(".")+1);
		if(suffix != null && !"jpg".equals(suffix.toLowerCase())){
			return "-1";
		}
		
		String realPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(realPath);
        String projectPath = "upload" + File.separator;
		String srcUploadPath = realPath + projectPath + "img";
		
		if(!new File(srcUploadPath).isDirectory()){
			new File(srcUploadPath).mkdirs();
		}
		String litiPath = null;
		try {
			
			String uploadName = System.currentTimeMillis() + new Random(50000).nextInt() + "." + suffix;
			File file = new File(srcUploadPath,uploadName);
			imgFile.transferTo(file);
			
			String srcPath = srcUploadPath + File.separator + uploadName;
			litiPath = projectPath + "liti" + File.separator + uploadName;
			String cutPath = realPath + litiPath;
			if(!new File(cutPath).isDirectory()){
				new File(cutPath).mkdirs();
			}
			Integer intX = Integer.parseInt(x);
			Integer intY = Integer.parseInt(y);
			if(w.indexOf(".") != -1){
				w = w.substring(0,w.indexOf("."));
			}
			if(h.indexOf(".")!=-1){
				h = h.substring(0,h.indexOf("."));
			}
			Integer intW = Integer.parseInt(w);
			Integer intH = Integer.parseInt(h);
			Integer intCompressWid = Integer.parseInt(compressWid);
			ImageUtils.imgCut(srcPath, cutPath, intX, intY, intW, intH, intCompressWid);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return litiPath;
	}
	
	
	@RequestMapping(value="upload_adm_img")
	@ResponseBody
	public String uploadAdmImg(HttpServletRequest request,HttpServletResponse response,
			String x,String y,String w,String h,String compressWid,@RequestParam MultipartFile imgFile){
		if(StringUtils.isEmpty(w)){
			return "";
		}
		//判断图片后缀
		String name = imgFile.getOriginalFilename();
		String suffix = name.substring(name.lastIndexOf(".")+1);
		if(suffix != null && !"jpg".equals(suffix.toLowerCase())){
			return "-1";
		}
		
		String realPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(realPath);
        String projectPath = "upload/admPic" + File.separator;
		String srcUploadPath = realPath + projectPath + "full";
		
		if(!new File(srcUploadPath).isDirectory()){
			new File(srcUploadPath).mkdirs();
		}
		String litiPath = null;
		try {
			
			String uploadName = System.currentTimeMillis() + new Random(50000).nextInt() + "." + suffix;
			File file = new File(srcUploadPath,uploadName);
			imgFile.transferTo(file);
			
			String srcPath = srcUploadPath + File.separator + uploadName;
			litiPath = projectPath + "thumb" + File.separator + uploadName;
			String cutPath = realPath + litiPath;
			if(!new File(cutPath).isDirectory()){
				new File(cutPath).mkdirs();
			}
			Integer intX = Integer.parseInt(x);
			Integer intY = Integer.parseInt(y);
			if(w.indexOf(".") != -1){
				w = w.substring(0,w.indexOf("."));
			}
			if(h.indexOf(".")!=-1){
				h = h.substring(0,h.indexOf("."));
			}
			Integer intW = Integer.parseInt(w);
			Integer intH = Integer.parseInt(h);
			Integer intCompressWid = Integer.parseInt(compressWid);
			ImageUtils.imgCut(srcPath, cutPath, intX, intY, intW, intH, intCompressWid);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return litiPath;
	}
	
	public static String processFileName(HttpServletRequest request, String fileNames) {  
	       String codedfilename = null;  
	       try {  
	           String agent = request.getHeader("USER-AGENT");  
	           if (null != agent && -1 != agent.indexOf("MSIE") || null != agent  
	                   && -1 != agent.indexOf("Trident")) {// ie  
	  
	               codedfilename = java.net.URLEncoder.encode(fileNames, "UTF8"); 
	           } else if (null != agent && -1 != agent.indexOf("Mozilla")) {// 火狐,chrome等  
	  
	               codedfilename = new String(fileNames.getBytes("UTF-8"), "iso-8859-1");  
	           }  
	       } catch (Exception e) {  
	           e.printStackTrace();  
	       }  
	       return codedfilename;  
	}
}
