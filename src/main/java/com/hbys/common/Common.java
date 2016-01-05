package com.hbys.common;

public interface Common {
	
	public static interface BOOLEAN{
		public static final int YES = 0;
		public static final int NO = 1;
	}
	
	public static interface RESULT_TYPE{
		
		public static final String OK = "1";
		
		public static final String FAIL = "0";
	}

	public static interface USERTYPE{
		/** 失效用户*/
		public static final int LOSE = -1;
		/** 正常用户*/
		public static final int NORMAL = 0;
		/** 管理员用户*/
		public static final int ADMIN = 1;
		/** 超级管理员用户*/
		public static final int SUP_ADM = 2;
		
	}


	public static interface SQL_PARAMS{
        /** 分页参数 */
        public static final int SHOW_NUM = 15;
        /** 默认当前页为 0*/
        public static final int CURR_PAGE = 0;
    }
}
