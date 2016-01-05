/**
 * Copyright 2009 SinoSoft. All Rights Reserved.
 */
package com.hbys.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;


/**
 * <B>系统名称：</B><BR>
 * <B>模块名称：</B>系统通用功能<BR>
 * <B>中文类名：</B>日期辅助处理<BR>
 * <B>概要说明：</B>日期辅助处理<BR>
 * 
 * @author pcg 
 * @since 2010-3-18
 */
public class DateUtils {

    /** 默认详细日期时间格式 */
    public static final String FORMAT_TIMESTAMP = "yyyyMMddHHmmssSSSSSS";

    /** 默认日期时间格式 */
    public static final String FORMAT_DATETIME = "yyyyMMddHHmmss";

    /** 默认日期格式 */
    public static final String FORMAT_DATE = "yyyyMMdd";

    /** 默认时间格式 */
    public static final String FORMAT_TIME = "HHmmss";

    /** 详细日期时间显示格式 */
    public static final String FORMAT_TIMESTAMP_DISPLAY = "yyyy-MM-dd HH:mm:ss.SSSSSS";

    /** 日期时间显示格式 */
    public static final String FORMAT_DATETIME_DISPLAY = "yyyy-MM-dd HH:mm:ss";

    /** 日期显示格式 */
    public static final String FORMAT_DATE_DISPLAY = "yyyy-MM-dd";

    /** 时间显示格式 */
    public static final String FORMAT_TIME_DISPLAY = "HH:mm:ss";

    /** 详细日期时间显示格式长度 */
    private static final int FORMAT_TIMESTAMP_DISPLAY_LENGTH = 26;

    /** 日期时间显示格式长度 20 */
    private static final int FORMAT_DATETIME_DISPLAY_LENGTH_20 = 20;

    /** 日期时间显示格式长度 19 */
    private static final int FORMAT_DATETIME_DISPLAY_LENGTH_19 = 19;

    /** 日期时间显示格式长度 14 */
    private static final int FORMAT_DATETIME_DISPLAY_LENGTH_14 = 14;

    /** 日期显示格式长度 10 */
    private static final int FORMAT_DATE_DISPLAY_LENGTH_10 = 10;

    /** 日期显示格式长度 8 */
    private static final int FORMAT_DATE_DISPLAY_LENGTH_8 = 8;

    /** 日期显示格式长度 6 */
    private static final int FORMAT_DATE_DISPLAY_LENGTH_6 = 6;

    /**
     * <B>方法名称：</B>获取当前详细日期时间（Timestamp）<BR>
     * <B>概要说明：</B>获取当前详细日期时间（Timestamp）<BR>
     * 
     * @param isDisplay 是否为显示格式
     * @return String 当前详细日期时间（Timestamp）
     */
    public static String getCurrentTimestamp(boolean... isDisplay) {
        String format = FORMAT_TIMESTAMP;
        if (isDisplay.length > 0 && isDisplay[0]) {
            format = FORMAT_TIMESTAMP_DISPLAY;
        }
        Date temp = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(temp);
    }

    /**
     * <B>方法名称：</B>获取当前日期时间（DateTime）<BR>
     * <B>概要说明：</B>获取当前日期时间（DateTime）<BR>
     * 
     * @param isDisplay 是否为显示格式
     * @return String 当前日期时间（DateTime）
     */
    public static String getCurrentDateTime(boolean... isDisplay) {
        String format = FORMAT_DATETIME;
        if (isDisplay.length > 0 && isDisplay[0]) {
            format = FORMAT_DATETIME_DISPLAY;
        }
        Date temp = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(temp);
    }

    /**
     * <B>方法名称：</B>获取当前日期（Date）<BR>
     * <B>概要说明：</B>获取当前日期（Date）<BR>
     * 
     * @param isDisplay 是否为显示格式
     * @return String 当前日期（Date）
     */
    public static String getCurrentDate(boolean... isDisplay) {
        String format = FORMAT_DATE;
        if (isDisplay.length > 0 && isDisplay[0]) {
            format = FORMAT_DATE_DISPLAY;
        }
        Date temp = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(temp);
    }

    /**
     * <B>方法名称：</B>获取当前时间（Time）<BR>
     * <B>概要说明：</B>获取当前时间（Time）<BR>
     * 
     * @param isDisplay 是否为显示格式
     * @return String 当前时间（Time）
     */
    public static String getCurrentTime(boolean... isDisplay) {
        String format = FORMAT_TIME;
        if (isDisplay.length > 0 && isDisplay[0]) {
            format = FORMAT_TIME_DISPLAY;
        }
        Date temp = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(temp);
    }

    /**
     * <B>方法名称：</B>按照指定格式转换成日期时间类型<BR>
     * <B>概要说明：</B>按照指定格式转换成日期时间类型<BR>
     * 
     * @param strDate 日期时间文本
     * @param format 日期时间文本格式
     * @return Date 日期时间类型对象
     * @throws ParseException 文本分析异常
     */
    public static Date convertToDate(String strDate, String format) {

        if (strDate == null || format == null) {
            return null;
        }

        Date date = null;
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        try {
            date = sdf.parse(strDate.trim());
        }
        catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * <B>方法名称：</B>自动转换成日期时间类型<BR>
     * <B>概要说明：</B>根据字符串的长度和构成字符，自动选用8种日期时间格式常量，转换成日期时间类型<BR>
     * 
     * @param strDate 日期时间文本
     * @return Date 日期时间类型对象
     * @throws ParseException 文本分析异常
     */
    public static Date autoParseToDate(String strDate) throws ParseException {
        String format = getDateStringFormat(strDate);
        return convertToDate(strDate, format);
    }

    /**
     * <B>方法名称：</B>自动转换日期时间为显示格式文本<BR>
     * <B>概要说明：</B>根据字符串的长度和构成字符，自动选用8种日期时间格式常量，转换成显示格式文本<BR>
     * 
     * @param strDate 日期时间的默认格式文本
     * @return String 日期时间的显示格式文本
     * @throws ParseException 文本分析异常
     */
    public static String autoParseToDisplayFormat(String strDate) throws ParseException {

        if (strDate == null) {
            return null;
        }

        String temp = strDate.trim();
        int length = temp.length();

        String format = null;
        String displayFormat = null;
        if (length == FORMAT_TIMESTAMP_DISPLAY_LENGTH) {
            //长度为FORMAT_TIMESTAMP_DISPLAY_LENGTH时，显示格式为FORMAT_TIMESTAMP_DISPLAY，则直接返回当前文本
            return temp;
        }
        else if (length == FORMAT_DATETIME_DISPLAY_LENGTH_20) {
            format = FORMAT_TIMESTAMP;
            displayFormat = FORMAT_TIMESTAMP_DISPLAY;
        }
        else if (length == FORMAT_DATETIME_DISPLAY_LENGTH_19) {
            //长度为19时，显示格式为FORMAT_DATETIME_DISPLAY，则直接返回当前文本
            return temp;
        }
        else if (length == FORMAT_DATETIME_DISPLAY_LENGTH_14) {
            format = FORMAT_DATETIME;
            displayFormat = FORMAT_DATETIME_DISPLAY;
        }
        else if (length == FORMAT_DATE_DISPLAY_LENGTH_10) {
            //长度为10时，显示格式为FORMAT_DATE_DISPLAY，则直接返回当前文本
            return temp;
        }
        else if (length == FORMAT_DATE_DISPLAY_LENGTH_8) {
            //长度为8时，显示格式可能为FORMAT_DATE_DISPLAY或FORMAT_TIME_DISPLAY
            //如果传入值中包含:时，为FORMAT_TIME_DISPLAY，则直接返回
            if (temp.indexOf(":") > 0) {
                return temp;
            }
            else {
                format = FORMAT_DATE;
                displayFormat = FORMAT_DATE_DISPLAY;
            }
        }
        else if (length == FORMAT_DATE_DISPLAY_LENGTH_6) {
            format = FORMAT_TIME;
            displayFormat = FORMAT_TIME_DISPLAY;
        }
        else {
            return null;
        }

        Date date = convertToDate(temp, format);
        SimpleDateFormat sdf = new SimpleDateFormat(displayFormat);

        return sdf.format(date);
    }

    /**
     * <B>方法名称：</B>自动转换日期时间为默认格式文本<BR>
     * <B>概要说明：</B>根据字符串的长度和构成字符，自动选用8种日期时间格式常量，转换成默认格式文本<BR>
     * 
     * @param strDate 日期时间的显示格式文本
     * @return String 日期时间的默认格式文本
     * @throws ParseException 文本分析异常
     */
    public static String autoParseToDefaultFormat(String strDate) throws ParseException {

        if (strDate == null) {
            return null;
        }

        String temp = strDate.trim();
        int length = temp.length();

        String format = null;
        String displayFormat = null;
        if (length == FORMAT_TIMESTAMP_DISPLAY_LENGTH) {
            format = FORMAT_TIMESTAMP;
            displayFormat = FORMAT_TIMESTAMP_DISPLAY;
        }
        else if (length == FORMAT_DATETIME_DISPLAY_LENGTH_20) {
            return temp;
        }
        else if (length == FORMAT_DATETIME_DISPLAY_LENGTH_19) {
            format = FORMAT_DATETIME;
            displayFormat = FORMAT_DATETIME_DISPLAY;
        }
        else if (length == FORMAT_DATETIME_DISPLAY_LENGTH_14) {
            return temp;
        }
        else if (length == FORMAT_DATE_DISPLAY_LENGTH_10) {
            format = FORMAT_DATE;
            displayFormat = FORMAT_DATE_DISPLAY;
        }
        else if (length == FORMAT_DATE_DISPLAY_LENGTH_8) {
            if (temp.indexOf(":") > 0) {
                format = FORMAT_DATE;
                displayFormat = FORMAT_DATE_DISPLAY;
            }
            else {
                return temp;
            }
        }
        else if (length == FORMAT_DATE_DISPLAY_LENGTH_6) {
            return temp;
        }
        else {
            return null;
        }

        Date date = convertToDate(temp, displayFormat);
        SimpleDateFormat sdf = new SimpleDateFormat(format);

        return sdf.format(date);
    }

    /**
     * <B>方法名称：</B>获取日期时间文本的格式<BR>
     * <B>概要说明：</B>获取日期时间文本的格式<BR>
     * 
     * @param strDate 日期时间文本
     * @return String 日期时间文本的格式
     */
    private static String getDateStringFormat(String strDate) {

        if (strDate == null) {
            return null;
        }

        String temp = strDate.trim();
        int length = temp.length();

        String format = null;
        if (length == FORMAT_TIMESTAMP_DISPLAY_LENGTH) {
            format = FORMAT_TIMESTAMP_DISPLAY;
        }
        else if (length == FORMAT_DATETIME_DISPLAY_LENGTH_20) {
            format = FORMAT_TIMESTAMP;
        }
        else if (length == FORMAT_DATETIME_DISPLAY_LENGTH_19) {
            format = FORMAT_DATETIME_DISPLAY;
        }
        else if (length == FORMAT_DATETIME_DISPLAY_LENGTH_14) {
            format = FORMAT_DATETIME;
        }
        else if (length == FORMAT_DATE_DISPLAY_LENGTH_10) {
            format = FORMAT_DATE_DISPLAY;
        }
        else if (length == FORMAT_DATE_DISPLAY_LENGTH_8) {
            if (temp.indexOf(":") > 0) {
                format = FORMAT_TIME_DISPLAY;
            }
            else {
                format = FORMAT_DATE;
            }
        }
        else if (length == FORMAT_DATE_DISPLAY_LENGTH_6) {
            format = FORMAT_TIME;
        }

        return format;
    }

    /***
     * 
     * <B>方法名称：</B>将Date转化为指定格式的字符串<BR>
     * <B>概要说明：</B>将Date转化为指定格式的字符串<BR>
     * 
     * @param aDate 日期
     * @param aMask 日期格式
     * @return 字符型日期
     * @since 2010-05-27
     */
    public static String convertDateToString(Date aDate, String aMask) {
        SimpleDateFormat df = null;

        String format = null;
        String returnValue = null;

        if (aDate == null) {
            return null;
        }
        else {
            if (null == aMask || "".equals(aMask.trim())) {
                format = FORMAT_DATE_DISPLAY;
            }
            else {
                format = aMask;
            }
            df = new SimpleDateFormat(format);
            returnValue = df.format(aDate);
        }

        return returnValue;
    }
    
    /**
     * 
     * <B>方法名称：</B>查询当前年<BR>
     * <B>概要说明：</B><BR>
     * @return
     */
    public static int getCurrentYear(){
    	Calendar cal = Calendar.getInstance();
    	return cal.get(Calendar.YEAR);
    }
    
    /**
     * 
     * <B>方法名称：</B>查询周一到今天的日期<BR>
     * <B>概要说明：</B>mapping:映射关系；date:日期数组<BR>
     * 
     * @return
     */
    public static Map<String,Object> getCurrWeek(){
    	Calendar cal = Calendar.getInstance();
		int weekDay = cal.get(Calendar.DAY_OF_WEEK);
		int countDate = weekDay == 1 ? 7 : weekDay - 1;
		String[] date = new String[countDate];
		for(int i=countDate;i>0;i--){
			if(i != countDate){
				cal.add(GregorianCalendar.DATE, -1);				
			}
			date[i-1] = convertDateToString(cal.getTime(), FORMAT_DATE_DISPLAY);
		}
    	//对应日期与星期
		String[] week = new String[]{"星期一","星期二","星期三","星期四","星期五","星期六","星期日"};
    	Map<String,String> cwMap = new HashMap<String,String>();
    	for(int i=0;i<date.length;i++){
    		cwMap.put(date[i], week[i]);
    	}
		Map<String,Object> mapAndDate = new HashMap<String,Object>();
		mapAndDate.put("mapping", cwMap);
		mapAndDate.put("date", date);
		return mapAndDate;
    }
    
    /**
     * 
     * <B>方法名称：</B>查询今年一月到当前月的日期<BR>
     * <B>概要说明：</B>返回YYYY-MM格式的日期数组，以及映射汉字月份的map<BR>
     * @return
     */
    public static Map<String,Object> getCurrMonth(){
    	String[] monthStr = new String[]{"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH);
		//存放月份
		String[] monthArr = new String[month+1];
		//存放月份与汉字映射
		Map<String,String> dateMapMonth = new HashMap<String,String>();
		//当前月
		String yearMonth = convertDateToString(cal.getTime(), FORMAT_DATE_DISPLAY).substring(0,7);
		dateMapMonth.put(yearMonth, monthStr[month]);
		monthArr[month] = yearMonth;
		//今年一月到当前月
		for(int i=month-1;i>=0;i--){
			cal.add(GregorianCalendar.MONTH, -1);
			yearMonth = convertDateToString(cal.getTime(), FORMAT_DATE_DISPLAY).substring(0, 7);
			dateMapMonth.put(yearMonth,monthStr[cal.get(Calendar.MONTH)]);
			monthArr[i] = yearMonth;
		}
		//返回map
		Map<String,Object> monthAndMapping = new HashMap<String,Object>();
		monthAndMapping.put("mapping", dateMapMonth);
		monthAndMapping.put("month", monthArr);
		return monthAndMapping;
    }
    
    /**
     * 
     * <B>方法名称：</B>根据传入的年月返回去年的年月<BR>
     * <B>概要说明：</B><BR>
     * @param currYear 年月的数组
     * @return
     */
    public static String[] getLastYearByCurrYear(String[] currYear){
    	String[] lastYear = new String[currYear.length];
    	for(int i=0;i<currYear.length;i++){
    		lastYear[i] = getLastYearByCurrYear(currYear[i],"-");
    	}
    	return lastYear;
    }
    
    /**
     * 
     * <B>方法名称：</B>根据传入的年月返回去年的年月<BR>
     * <B>概要说明：</B><BR>
     * @param currYear 年月的字符
     * @param sprStr 分隔符
     * @return
     */
    public static String getLastYearByCurrYear(String currYear,String sprStr){
    	String[] yearMonth = currYear.split(sprStr);
    	String year = yearMonth[0];
    	String month = yearMonth[1];
    	return (Integer.valueOf(year)-1)+sprStr+month;
    }
    
    /**
     * 
     * <B>方法名称：</B>查询当前年的前后多少年的时间<BR>
     * <B>概要说明：</B><BR>
     * @param agoYear 正数表示今年之后多少年，负数表示今年之前多少年
     * @return
     */
    public static Date getDateByCurrDate(int agoYear){
    	Calendar cal = Calendar.getInstance();
    	cal.add(GregorianCalendar.YEAR, agoYear);
    	cal.get(Calendar.DATE);
    	return cal.getTime();
    }
    
    /**
     * 
     * <B>方法名称：</B>将日期转成年月日字符串<BR>
     * <B>概要说明：</B><BR>
     * @param 
     * @return
     */
    public static String getStringByDate(Date date){
    	String year = "";
    	String month = "";
    	String day = "";
    	if(date!=null&&!"".equals(date))
    	{
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
    		Calendar ca = Calendar.getInstance();
    		ca.setTime(date);
    		return sdf.format(ca.getTime());
    	}
    	return "";
    }
    public static String getStringByShortDate(Date date){
    	String year = "";
    	String month = "";
    	if(date!=null&&!"".equals(date))
    	{
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月");
    		Calendar ca = Calendar.getInstance();
    		ca.setTime(date);
    		return sdf.format(ca.getTime());
    	}
    	return "";
    }
    /**
     * 
     * <B>方法名称：</B>将日期字符串(用 - 分割)转成年月日字符串<BR>
     * <B>概要说明：</B><BR>
     * @param 
     * @return
     */
    public static String getStringByDateString(String dateStr){
    	if(dateStr!=null&&!"".equals(dateStr))
    	{
    		if(dateStr.length()>=10)
    		dateStr = dateStr.substring(0,10);
    		String[] temp = dateStr.split("-");
    		if(temp.length==3)
    			return temp[0]+"年"+temp[1]+"月"+temp[2]+"日";
    		else 
    			return temp[0]+"年"+temp[1]+"月";
    	}
    	return null;    	
    }
    /**
     * 
     * <B>方法名称：</B>查询本月最后一天<BR>
     * <B>概要说明：</B><BR>
     * @return
     */
    public static String getLastDateString() {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.MONTH, 1);
        calendar.set(Calendar.DATE, 1);
        calendar.add(Calendar.DATE, -1);
        return convertDateToString(calendar.getTime(), FORMAT_DATE_DISPLAY);
    }
    
}
