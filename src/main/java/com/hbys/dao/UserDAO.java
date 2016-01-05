package com.hbys.dao;

import java.util.List;
import java.util.Map;

import com.hbys.common.vo.SearchObject;
import com.hbys.common.vo.User;

public interface UserDAO {

	public int insertUser(User user);
	
	public User selectUserByIphone(String iphone);

    public String selectUserById(Long id);
	
	public List<User> selectAllUser(SearchObject searchObj);

    public Integer selectAllUserCount(SearchObject searchObject);
	
	public void updateUser(User user);
	
	public void updateRoleAdm(Map<String,Object> map);
	
	public void updatePass(Map<String,Object> map);
	
}
