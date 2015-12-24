package com.qile.service.util;

import java.io.Serializable;
import java.security.MessageDigest;
import java.util.List;
import java.util.Random;

import org.hibernate.annotations.Check;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qile.dao.BaseDao;
import com.qile.entity.Association;
import com.qile.entity.Company;
import com.zjlh.villa.service.util.message.config.AppConfig;
import com.zjlh.villa.service.util.message.lib.MESSAGEXsend;
import com.zjlh.villa.service.util.message.utils.ConfigLoader;

@Service
public class UtilService {

	@Autowired
	private BaseDao<Association> adao;
	@Autowired
	private BaseDao<Company> cdao;
	
	
	
	/**
	 * 验证用户名是否已注册
	 * @param phone
	 * @return
	 */
	public boolean checkUsername(String username) {
		if (cdao.exist(Company.class,"username", username)) {
			return false;
		}
		if (adao.exist(Association.class,"username", username)) {
			return false;
		}
		return true;
	}
	
	
	
	/**
	 * 验证手机号是否已注册
	 * @param phone
	 * @return
	 */
	public boolean checkPhone(String phone) {
		if (cdao.exist(Company.class,"phone", phone)) {
			return false;
		}
		if (adao.exist(Association.class,"phone", phone)) {
			return false;
		}
		return true;
	}
	
	
	
	

	/**
	 * 验证码验证
	 * @param phone
	 * @param code
	 * @param type
	 * @return
	 */
	public boolean checkSecurity(int id, String code, String type) {
		if (type.equals("company")) {

			Company company = cdao.get(Company.class, id);
			if (company.getSecurityCode().equals(code)) {
				return true;
			} else {
				return false;
			}

		} else {

			Association association = adao.get(Association.class,id);
			if (association.getSecurityCode().equals(code)) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	
	
	/**
	 * 发送验证码
	 * @param phone
	 * @param type
	 */
	public Serializable sendMessage(String phone,String type){
			Serializable id = 0;
			String code = this.getRandomNumber(6);
			
			if (type.equals("company")) {
				
				Company company = cdao.get(Company.class, "phone", phone);
				if(company == null){
					company = new Company();
					company.setSecurityCode(code);
					id = cdao.save(company);
				}else {
					company.setSecurityCode(code);
					cdao.update(company);
					id = company.getId();
				}
				
				
			}else {
				
				Association association = adao.get(Association.class, "phone", phone);
				if(association == null){
					association = new Association();
					association.setSecurityCode(code);
					adao.save(association);
					id = adao.save(association);
				}else {
					association.setSecurityCode(code);
					adao.update(association);
					id = association.getId();
				}
				
			}
			
			AppConfig config = ConfigLoader.load(ConfigLoader.ConfigType.Message);
			MESSAGEXsend submail = new MESSAGEXsend(config);
			submail.addTo(phone);
			submail.setProject("xM9lT2");
			submail.addVar("code", code);
			submail.xsend();
			
			
			
			return id;
	}
	
	
	
	
	/**
     * 生成md5
     * @param message
     * @return
     */
    public  String getMD5(String message) {
        String md5str = "";
        try {
            //1 创建一个提供信息摘要算法的对象，初始化为md5算法对象
            MessageDigest md = MessageDigest.getInstance("MD5");
 
            //2 将消息变成byte数组
            byte[] input = message.getBytes();
 
            //3 计算后获得字节数组,这就是那128位了
            byte[] buff = md.digest(input);
 
            //4 把数组每一字节（一个字节占八位）换成16进制连成md5字符串
            md5str = bytesToHex(buff);
            //5 转换成16位
            //md5str = md5str.substring(8,24);
        } catch (Exception e) {
            e.printStackTrace();
        }
       
        return md5str;
    }
    
    
    /**
     * 二进制转十六进制
     * @param bytes
     * @return
     */
    public String bytesToHex(byte[] bytes) {
        StringBuffer md5str = new StringBuffer();
        //把数组每一字节换成16进制连成md5字符串
        int digital;
        for (int i = 0; i < bytes.length; i++) {
             digital = bytes[i];
 
            if(digital < 0) {
                digital += 256;
            }
            if(digital < 16){
                md5str.append("0");
            }
            md5str.append(Integer.toHexString(digital));
        }
        return md5str.toString().toUpperCase();
    }		
	
	
    
    
	/*
	 * 生成随机字符串
	 */
	public String getRandomString(int length) { //length表示生成字符串的长度  
	    String base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";     
	    Random random = new Random();     
	    StringBuffer sb = new StringBuffer();     
	    for (int i = 0; i < length; i++) {     
	        int number = random.nextInt(base.length());     
	        sb.append(base.charAt(number));     
	    }     
	    return sb.toString();     
	 }
	
	/*
	 * 生成随机数字
	 */
	public String getRandomNumber(int length) { //length表示生成字符串的长度  
	    String base = "0123456789";     
	    Random random = new Random();     
	    StringBuffer sb = new StringBuffer();     
	    for (int i = 0; i < length; i++) {     
	        int number = random.nextInt(base.length());     
	        sb.append(base.charAt(number));     
	    }     
	    return sb.toString();     
	 }

}
