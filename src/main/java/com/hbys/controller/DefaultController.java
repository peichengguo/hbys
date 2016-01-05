package com.hbys.controller;

import com.hbys.common.Common;
import com.hbys.common.utils.EncryptUtil;
import com.hbys.common.vo.AdmPicVo;
import com.hbys.common.vo.ImgVo;
import com.hbys.common.vo.User;
import com.hbys.service.AdmPicService;
import com.hbys.service.ImgService;
import com.hbys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/")
public class DefaultController {

	@Autowired
	UserService userService;
	
	@Autowired
	ImgService imgService;
	
	@Autowired
	AdmPicService admPicService;
	
	@RequestMapping("to_login")
	public String toLogin(){
		
		return "login";
	}
	
	@RequestMapping("login")
	@ResponseBody
	public String login(User user,HttpServletRequest request){
		String flag = "0";
		User u = userService.selectUserByIphone(user.getIphone());
		String enPwd = EncryptUtil.encrypt(user.getPassword());
		if(u != null && u.getPassword().equals(enPwd)){
			//用户失效
			if(Common.USERTYPE.LOSE == u.getState()){
				return "-1";
			}
			request.getSession().setAttribute("user", u);
			flag = "1";
		}
		return flag;
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return "index";
	}
	
	@RequestMapping("index")
	public String index(HttpServletRequest request,Model model,AdmPicVo admPicVo){
		List<AdmPicVo> picList = admPicService.selectAllAdmPic(admPicVo);
		model.addAttribute("picList", picList);
		return "index";
	}
	
	@RequestMapping("to_register")
	public String toRegister(Model model){
		model.addAttribute("msg", "注册");
		return "register";
	}
	
	/**
	 * 注册或修改个人资料
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping("register")
	@ResponseBody
	public String register(HttpServletRequest request,User user){
		String page = "0";
		Integer userId = user.getId();
		if(StringUtils.isEmpty(userId)){
			userService.insertUser(user);
			userId = user.getId();
		}
		//更新用户信息
		userService.updateUser(user);
		//插入照片信息
		String imgLitiUrl = user.getImgUrl();
		if(!StringUtils.isEmpty(imgLitiUrl) && imgLitiUrl.length() > 1){
			if("/".equals(imgLitiUrl.substring(imgLitiUrl.length()-1))){
				imgLitiUrl = imgLitiUrl.substring(0,imgLitiUrl.length()-1);
			}
			ImgVo imgVo = imgService.selectImgByUserId(userId.toString());
			if(imgVo == null){	
				imgVo = new ImgVo();
				imgVo.setuId(user.getId());
				imgVo.setImgLitiUrl(imgLitiUrl);
				imgVo.setImgUrl(imgLitiUrl.replace("liti", "img"));
				imgService.insertImg(imgVo);
			}else{
				imgVo.setImgLitiUrl(imgLitiUrl);
				imgVo.setImgUrl(imgLitiUrl.replace("liti", "img"));
				imgService.updateImg(imgVo);
			}
		}
		//管理员修改
		User su = (User)request.getSession().getAttribute("user");
		//当前用户修改
		if(su != null && su.getIphone().equals(user.getIphone())){				
			su.setName(user.getName());
		}
		//注册 或者 普通用户修改个人资料
		if(su == null || su.getState() == 0){
			request.getSession().setAttribute("user", user);				
		}
		page = "1";
		
		return page;
	}
	
	@RequestMapping("valid_reg")
	@ResponseBody
	public String validReg(String iphone){
		String flag = "0";
		User user = userService.selectUserByIphone(iphone);
		if(user != null){
			flag = "1";
		}
		return flag;
	}
	
	/**
	 * 进入个人资料页面
	 * @param request
	 * @param model
	 * @param iphone
	 * @return
	 */
	@RequestMapping("to_user_info")
	public String toUserInfo(HttpServletRequest request,Model model,String iphone){
		User sU = (User)request.getSession().getAttribute("user");
		if(sU != null){
			String suIphnoe = sU.getIphone();
			if(!StringUtils.isEmpty(iphone) && sU.getState() > 0){
				suIphnoe = iphone;
			}
			User user = userService.selectUserByIphone(suIphnoe);
			ImgVo img = imgService.selectImgByUserId(String.valueOf(user.getId()));
			if(img != null){
				user.setImgUrl(img.getImgLitiUrl());
			}
			model.addAttribute("u", user);
			model.addAttribute("update_user","update_user");
			model.addAttribute("msg", "保存");
		}
		return "register";
	}


    @RequestMapping("to_update_pass{id}")
    public String toUpdatePass(@PathVariable Long id,Model model){

        model.addAttribute("id",id);

        return "updatePass";
    }

    /**
     * 用户自己修改密码
     * @param request
     * @return
     */
    @RequestMapping("update_pass")
    @ResponseBody
    public Object updatePass(HttpServletRequest request){
        String flag = Common.RESULT_TYPE.FAIL;
        String idStr = request.getParameter("id");
        if(StringUtils.isEmpty(idStr)){
            return flag;
        }
        Long id = Long.parseLong(idStr);
        String enPass = userService.selectUserById(id);
        String password = request.getParameter("password");
        if(enPass == null || !enPass.equals(EncryptUtil.encrypt(password))){
            return -1;
        }
        String newPassword = request.getParameter("newPassword");
        try{
            userService.updatePass(newPassword,id);
            flag = Common.RESULT_TYPE.OK;
        }catch (Exception e){
            flag = Common.RESULT_TYPE.FAIL;
        }
        return flag;
    }

}
