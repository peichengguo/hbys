package com.hbys.controller.admin;

import com.hbys.common.Common;
import com.hbys.common.utils.CommonUtils;
import com.hbys.common.vo.FileVo;
import com.hbys.common.vo.SearchObject;
import com.hbys.common.vo.User;
import com.hbys.service.AdmFileService;
import com.hbys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/adminUser")
public class AdminUserController {
	
	@Autowired
	private AdmFileService admFileService;
	
	@Autowired
	private UserService userService;

	@RequestMapping("index")
	public String index(){
		System.out.println("***admin/index***");
		return "admin/defaultAdmin";
	}
	
	/**
	 * 上传文件页面
	 * @return
	 */
	@RequestMapping("upload_file")
	public String uploadFile(){
		
		return "admin/fileUploadManager";
	}
	
	/**
	 * 文件列表
	 * @param model
	 * @param fileVo
	 * @return
	 */
	@RequestMapping("to_file_list")
	public String fileList(Model model,FileVo fileVo){
		List<FileVo> fileVoList = admFileService.selectAllFileVo(fileVo);
		model.addAttribute("fileVoList", fileVoList);
		model.addAttribute("fileVo", fileVo);
		return "admin/fileUploadList";
	}
	
	/**
	 * 用户列表
	 * @param model
	 * @param searchObj
	 * @return
	 */
	@RequestMapping("to_user_list")
	public String toUserList(HttpServletRequest request,Model model,SearchObject searchObj){
		//管理员修改
		User su = (User)request.getSession().getAttribute("user");
		searchObj.setState(su.getState());//只能向下查看用户
        //设置分页条件
        CommonUtils.setPage(searchObj);
		List<User> userList = userService.selectAllUser(searchObj);
        Integer userCount = userService.selectAllUserCount(searchObj);
        //设置当前页面条数
        searchObj.setCurrNum(userList == null? 0:userList.size());
		model.addAttribute("userList", userList);
		model.addAttribute("searchObj",searchObj);
        model.addAttribute("count",userCount);
		return "admin/userList";
	}
	
	/**
	 * 设置  管理员权限
	 * @param request
	 * @param ids
	 * @param state
	 * @return
	 */
	@RequestMapping("set_role_adm")
	@ResponseBody
	public Object setAdm(HttpServletRequest request,String ids,String state){
		String flag = Common.RESULT_TYPE.FAIL;
		if(StringUtils.isEmpty(ids)){
			return flag;
		}
		String[] idStr = ids.split(",");
		int[] intId = new int[idStr.length];
		for(int i=0;i<idStr.length;i++){
			intId[i] = Integer.parseInt(idStr[i]);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("ids", intId);
		map.put("state", state);
		userService.updateRoleAdm(map);
		flag = Common.RESULT_TYPE.OK;
		return flag;
	}

    /**
     * 管理员重置密码
     * @param id
     * @return
     */
    @RequestMapping("to_reset_pass{id}")
    @ResponseBody
    public Object toResetPass(@PathVariable Long id){
        String flag = Common.RESULT_TYPE.FAIL;
        if(id == null || id <= 0){
            return flag;
        }
        try{
            String rePass = CommonUtils.getRandom(6);
            userService.updatePass(rePass,id);
            flag = rePass;
        }catch (Exception e){
            flag = Common.RESULT_TYPE.FAIL;
            e.printStackTrace();
        }
        return flag;
    }

}
