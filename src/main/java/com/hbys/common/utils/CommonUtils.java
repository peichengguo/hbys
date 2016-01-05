package com.hbys.common.utils;

import com.hbys.common.Common;
import com.hbys.common.vo.SearchObject;

import java.util.Random;

/**
 * Created by pcg on 15/11/30.
 */
public class CommonUtils {

    private static Random r = new Random(10);

    public static String getRandom(int length){

        StringBuffer randomStr = new StringBuffer();
        for(int i=0;i<length;i++){
            randomStr.append(r.nextInt(10));
        }
        return randomStr.toString();
    }

    /**
     * 设置分页条件
     * @param searchObject
     */
    public static void setPage(SearchObject searchObject){
        if(searchObject.getShowNum() == null){
            searchObject.setShowNum(Common.SQL_PARAMS.SHOW_NUM);
        }
        if(searchObject.getCurrPage() == null || searchObject.getCurrPage() < 0){
            searchObject.setCurrPage(Common.SQL_PARAMS.CURR_PAGE);
        }
        searchObject.setStartNum(searchObject.getCurrPage()*searchObject.getShowNum());
    }

}
