package com.yxq.tools;

import java.security.MessageDigest;  
import java.security.NoSuchAlgorithmException;  
  
/** 
 * ʹ��Java�Դ���MessageDigest�� 
 * @author wangduo 
 */  
public class Encryption {  
  
    /** 
     * ����MD5 ��SHA-1���Ǵ�MD4 ��չ���������ǵĽṹ��ǿ�ȵ������кܶ�����֮�� 
     * SHA-1��MD5 ���������������ժҪ��MD5 ժҪ�� 32 ���أ�1byte=8bit���൱�ڳ�4byte��ת��16���ƺ��MD5��8���ַ�����  
     * ����ǿ�й�������MD5 ��2128 �������Ĳ�����SHA-1 ��2160�������Ĳ����� 
     * ������ͬժҪ���������ĵ��Ѷȣ�MD5�� 264 ���������Ĳ�����SHA-1 ��280 �������Ĳ����� 
     * �����SHA-1 ��ǿ�й�����ǿ�ȸ��� ������SHA-1 ��ѭ�������MD5 �ࣨ80:64����Ҫ����Ļ����160 ����:128 ���أ���SHA-1 �������ٶȱ�MD5 ���� 
     *  
     * @param source ��Ҫ���ܵ��ַ��� 
     * @param hashType �������� ��MD5 �� SHA�� 
     * @return 
     */  
    public static String getHash(String source, String hashType) {  
        // �������ֽ�ת���� 16 ���Ʊ�ʾ���ַ�  
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};  
  
        try {  
            MessageDigest md = MessageDigest.getInstance(hashType);  
            md.update(source.getBytes()); // ͨ��ʹ�� update ������������,ʹָ���� byte�������ժҪ  
            byte[] encryptStr = md.digest(); // ���������ɹ�ϣ����,����128 λ�ĳ�����  
            char str[] = new char[16 * 2]; // ÿ���ֽ��� 16 ���Ʊ�ʾ�Ļ���ʹ�������ַ�  
            int k = 0; // ��ʾת������ж�Ӧ���ַ�λ��  
            for (int i = 0; i < 16; i++) { // �ӵ�һ���ֽڿ�ʼ����ÿһ���ֽ�,ת���� 16 �����ַ���ת��  
                byte byte0 = encryptStr[i]; // ȡ�� i ���ֽ�  
                str[k++] = hexDigits[byte0 >>> 4 & 0xf]; // ȡ�ֽ��и� 4 λ������ת��, >>> Ϊ�߼����ƣ�������λһ������  
                str[k++] = hexDigits[byte0 & 0xf]; // ȡ�ֽ��е� 4 λ������ת��  
            }  
            return new String(str); // ����Ľ��ת��Ϊ�ַ���  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
        return null;  
    }  
  
    /** @param source ��Ҫ���ܵ��ַ��� 
     * @param hashType  �������� ��MD5 �� SHA�� 
     * @return 
     */  
    public static String getHash2(String source, String hashType) {  
        StringBuilder sb = new StringBuilder();  
        MessageDigest md5;  
        try {  
            md5 = MessageDigest.getInstance(hashType);  
            md5.update(source.getBytes());  
            for (byte b : md5.digest()) {  
                sb.append(String.format("%02X", b)); // 10����ת16���ƣ�X ��ʾ��ʮ��������ʽ�����02 ��ʾ������λǰ�油0���  
            }  
            return sb.toString();  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
        return null;  
    }  
  
    /** @param source ��Ҫ���ܵ��ַ��� 
     * @param hashType  �������� ��MD5 �� SHA�� 
     * @return 
     */  
    public static String getHash3(String source, String hashType) {  
        // �������ֽ�ת���� 16 ���Ʊ�ʾ���ַ�  
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};  
          
        StringBuilder sb = new StringBuilder();  
        MessageDigest md5;  
        try {  
            md5 = MessageDigest.getInstance(hashType);  
            md5.update(source.getBytes());  
            byte[] encryptStr = md5.digest();  
            for (int i = 0; i < encryptStr.length; i++) {  
                int iRet = encryptStr[i];  
                if (iRet < 0) {  
                    iRet += 256;  
                }  
                int iD1 = iRet / 16;  
                int iD2 = iRet % 16;  
                sb.append(hexDigits[iD1] + "" + hexDigits[iD2]);  
            }  
            return sb.toString();  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
        return null;  
    }  
}  