package com.qile.action;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qile.entity.Association;
import com.qile.service.AssociationService;

@Controller
@RequestMapping("/association")
public class AssociationAction {
	
	@Autowired 
	private AssociationService as;
	
	Logger logger = Logger.getLogger(AssociationAction.class);
	
	
	@RequestMapping("/register")
	@ResponseBody
	public Serializable register(HttpServletRequest request,int id,String username,String password,String phone){
		Association association = new Association();
		association.setId(id);
		association.setUsername(username);
		association.setPassword(password);
		association.setPhone(phone);
		
		request.getSession().setAttribute("association", association);
		
		return as.register(association);
	}
	
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request,ModelAndView mv,String username,String password){
		
		
		Association association = as.login(username, password);
		
		if (association!=null) {
			mv.addObject(association);
			request.getSession().setAttribute("association", association);
			mv.setViewName("mobile/association-center");
		}else {
			String tip = "用户名或密码错误";
			mv.addObject("tip",tip);
			mv.setViewName("mobile/login");
		}
		return mv;
	}
	
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request,ModelAndView mv){
		request.getSession().removeAttribute("association");
		mv.setViewName("index/login");
		return mv;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public boolean update(HttpServletRequest request,Association association){
		return as.update(association);
	}
	
	
}
