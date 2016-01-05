package com.hbys.service.impl;

import com.hbys.common.Common;
import com.hbys.common.utils.EncryptUtil;
import com.hbys.common.vo.SearchObject;
import com.hbys.common.vo.User;
import com.hbys.dao.UserDAO;
import com.hbys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public int insertUser(User user) {
        if(user.getState() == null){
            user.setState(Common.USERTYPE.NORMAL);
        }
		user.setPassword(EncryptUtil.encrypt(user.getPassword()));
		return userDAO.insertUser(user);
	}

	@Override
	public User selectUserByIphone(String iphone) {
		return userDAO.selectUserByIphone(iphone);
	}

    @Override
    public String selectUserById(Long id) {
        return userDAO.selectUserById(id);
    }

    @Override
	public void updateUser(User user) {
		userDAO.updateUser(user);
	}

	@Override
	public List<User> selectAllUser(SearchObject searchObj) {
		return userDAO.selectAllUser(searchObj);
	}

    @Override
    public Integer selectAllUserCount(SearchObject searchObject) {
        return userDAO.selectAllUserCount(searchObject);
    }

    @Override
	public void updateRoleAdm(Map<String,Object> map) {
		userDAO.updateRoleAdm(map);
	}

	@Override
	public void updatePass(String password,Long id) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("password", EncryptUtil.encrypt(password));
		userDAO.updatePass(map);
	}
	
}
