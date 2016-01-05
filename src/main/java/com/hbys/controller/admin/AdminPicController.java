package com.hbys.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hbys.common.vo.AdmPicVo;
import com.hbys.service.AdmPicService;

@Controller
@RequestMapping("/adminPic")
public class AdminPicController {

	@Autowired
	private AdmPicService admPicService;
	
	@RequestMapping("to_upload_pic")
	public String toUploadPic(String id,Model model){
		if(!StringUtils.isEmpty(id)){			
			AdmPicVo picVo = admPicService.selectAdmPicById(id);
			model.addAttribute("picVo", picVo);
		}
		return "admin/picUploadManager";
	}
	
	@RequestMapping("upload_pic_data")
	@ResponseBody
	public Object uploadPic(HttpServletRequest request,AdmPicVo admPicVo){
		String page = "1";
		try {
			String litiUrl = admPicVo.getLitiUrl();
			if(!StringUtils.isEmpty(litiUrl)){
				if("/".equals(litiUrl.substring(litiUrl.length()-1))){
					litiUrl = litiUrl.substring(0, litiUrl.length()-1);
					admPicVo.setLitiUrl(litiUrl);
				}
				admPicVo.setSrcUrl(admPicVo.getLitiUrl().replace("thumb", "full"));
			}
			if(!StringUtils.isEmpty(admPicVo.getId())){//修改
				admPicService.updateAdmPic(admPicVo);
			}else{			
				admPicService.insertAdmPic(admPicVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			page = "0";
		}
		return page;
	}
	
	@RequestMapping("get_adm_pic")
	public String getAdmPic(HttpServletRequest request,AdmPicVo admPicVo,Model model){
		long id = admPicVo.getId();
		AdmPicVo picVo = admPicService.selectAdmPicById(String.valueOf(id));
		model.addAttribute("picVo", picVo);
		return "admin/picUploadManager";
	}
	
	@RequestMapping("get_adm_pic_list")
	public String getAdmPicList(HttpServletRequest request,AdmPicVo admPicVo,Model model){
		List<AdmPicVo> picVo = admPicService.selectAllAdmPic(admPicVo);
		model.addAttribute("picVoList", picVo);
		return "admin/picUploadList";
	}
	
}
