package com.qile.action;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qile.entity.Company;
import com.qile.service.CompanyService;

@Controller
@RequestMapping("/company")
public class CompanyAction {
	
	@Autowired 
	private CompanyService cs;
	
	Logger logger = Logger.getLogger(CompanyAction.class);
	
	
	@RequestMapping("/register")
	@ResponseBody
	public Serializable register(HttpServletRequest request,int id,String username,String password,String phone){
		Company company = new Company();
		company.setId(id);
		company.setUsername(username);
		company.setPassword(password);
		company.setPhone(phone);
		
		request.getSession().setAttribute("company", company);
		
		return cs.register(company);
	}
	
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request,ModelAndView mv,String username,String password){
		
		
		Company company = cs.login(username, password);
		
		if (company!=null) {
			mv.addObject(company);
			request.getSession().setAttribute("company", company);
			mv.setViewName("mobile/company-center");
		}else {
			String tip = "用户名或密码错误";
			mv.addObject("tip",tip);
			mv.setViewName("mobile/login");
		}
		return mv;
	}
	
	
	@RequestMapping("/logout")
	public void logout(HttpServletRequest request){
		request.getSession().removeAttribute("company");
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public boolean update(HttpServletRequest request,Company company){
		request.getSession().setAttribute("company", company);
		return cs.update(company);
	}
	
	
	
	@RequestMapping("/get-list")
	@ResponseBody
	public List<Company> getList(HttpServletRequest request){
		return cs.getList();
	}
}
