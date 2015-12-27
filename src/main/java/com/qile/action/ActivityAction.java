package com.qile.action;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qile.entity.Activity;
import com.qile.entity.Association;
import com.qile.service.ActivityService;

@Controller
@RequestMapping("/activity")
public class ActivityAction {

	@Autowired 
	private ActivityService as;
	
	@RequestMapping("/add")
	@ResponseBody
	public Serializable add(HttpServletRequest request,Activity activity){
		activity.setId(null);
		return as.add(activity);
	}
	
	@RequestMapping("/get-one")
	@ResponseBody
	public Activity getOne(HttpServletRequest request,int id){
		return as.getById(id);
	}
	
	@RequestMapping("/get-list")
	@ResponseBody
	public List<Activity> getList(HttpServletRequest request){
		Association association = (Association) request.getSession().getAttribute("association");
		return as.getByAssociation(association.getId());
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int update(HttpServletRequest request,ModelAndView mv,Activity activity){
		return as.update(activity); 
	}
	
}
