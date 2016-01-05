package com.hbys.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.hbys.common.vo.User;

public class SessionFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	public boolean isPass(HttpServletRequest request){
		boolean flag = false;
		String[] url = new String[]{"download","_user_info","admin","add_update_article"};
		for(String u : url){
			if(request.getRequestURL().indexOf(u) != -1){
				flag = true;
				break;
			}
		}
		return flag;
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filter)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
		
        if(this.isPass(request)){
        	User user = (User)session.getAttribute("user");
			
        	if(user != null && !StringUtils.isEmpty(user.getIphone())){			
//        		filter.doFilter(request, response);
        	}else{
        		request.getRequestDispatcher("/to_login.jspx").forward(request, response);
        	}
		}
        filter.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
