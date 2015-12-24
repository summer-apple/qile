package com.qile.action;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qile.service.util.UtilService;

@Controller
@RequestMapping("/util")
public class UtilAction {
	@Autowired 
	private UtilService us;
	
	
	@RequestMapping("/check-username")
	@ResponseBody
	public boolean checkUsername(HttpServletRequest request,String username){
		return us.checkUsername(username);
	}
	
	@RequestMapping("/check-phone")
	@ResponseBody
	public boolean checkPhone(HttpServletRequest request,String phone){
		return us.checkPhone(phone);
	}
	
	@RequestMapping("/check-security")
	@ResponseBody
	public boolean checkScurity(HttpServletRequest request,int id,String code,String type){
		return us.checkSecurity(id, code, type);
	}
	
	@RequestMapping("/get-security")
	@ResponseBody
	public Serializable sendMessage(HttpServletRequest request,String phone,String type){
		return us.sendMessage(phone, type);
	}
	
	
	
	
}
