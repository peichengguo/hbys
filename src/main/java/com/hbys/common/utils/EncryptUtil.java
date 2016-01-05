/**
 * Copyright 2011 SinoSoft. All Rights Reserved.
 */
package com.hbys.common.utils;

import java.io.UnsupportedEncodingException;


/**
 * <B>系统名称：</B><BR>
 * <B>模块名称：</B>公共模块<BR>
 * <B>中文类名：</B>加密解密工具类<BR>
 * <B>概要说明：</B>加密解密工具类<BR>
 * 
 * @author cg.pei
 * @since 2011-04-02
 */
public class EncryptUtil {

    /* 密钥 */
    private static byte KEY = 0X63;

    /***
     * <B>方法名称：</B>异或加密<BR>
     * <B>概要说明：</B>异或加密<BR>
     * 
     * @param oldStr 待加密字符串
     * @return 加密后的十六进制字符串
     * @throws UnsupportedEncodingException
     */
    public static String encrypt(String oldStr) {
        if (oldStr != null && oldStr.trim().length() > 0) {
            byte[] bytes = null;
            try {
                bytes = oldStr.getBytes("UTF-8");
            }
            catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            StringBuffer buffer = new StringBuffer();
            String tmpStr;
            if (bytes != null) {
                for (int i = 0; i < bytes.length; i++) {
                    //加密
                    tmpStr = Integer.toString(bytes[i] & 0XFF ^ KEY, 16);
                    if (tmpStr.length() == 1) {
                        buffer.append("0").append(tmpStr);
                    }
                    else {
                        buffer.append(tmpStr);
                    }
                }
            }
            return buffer.toString().toUpperCase();
        }
        return oldStr;
    }

    public static String[] encrypt(String[] oldStr) {
        if (oldStr != null)
            for (int i = 0; i < oldStr.length; i++) {
                oldStr[i] = encrypt(oldStr[i]);
            }
        return oldStr;
    }

    /***
     * <B>方法名称：</B>异或解密<BR>
     * <B>概要说明：</B>异或解密<BR>
     * 
     * @param hexStr 待解密字符串
     * @return 解密后字符串
     * @throws UnsupportedEncodingException
     */
    public static String decrypt(String hexStr) {
        // 判断待解密字符串是否合法，长度非偶不处理
        if (hexStr != null && hexStr.trim().length() > 0 && hexStr.length() % 2 == 0) {
            byte[] bytes = new byte[hexStr.length() / 2];
            for (int i = 0; i < hexStr.length(); i += 2) {
                bytes[i / 2] = (byte) ((byte) Integer.parseInt(hexStr.substring(i, i + 2), 16) & 0XFF ^ KEY);
            }
            try {
                return new String(bytes, "UTF-8");
            }
            catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return hexStr;
    }
    
    public static String[] decrypt(String[] hexStr) {
        if (hexStr != null)
            for (int i = 0; i < hexStr.length; i++) {
                hexStr[i] = decrypt(hexStr[i]);
            }
        return hexStr;
    }

    public static void main(String args[]){
        
        System.out.println(EncryptUtil.encrypt("123"));
    }
}
