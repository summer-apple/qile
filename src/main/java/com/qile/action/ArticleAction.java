package com.qile.action;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qile.entity.Article;
import com.qile.service.ArticleService;

@Controller
@RequestMapping("/article")
public class ArticleAction {

	@Autowired
	private ArticleService as;
	
	@RequestMapping("/add")
	@ResponseBody
	public Serializable add(HttpServletRequest request,Article article){
		article.setReleasetime(new Date());
		return as.add(article);
	}
	
	@RequestMapping("/get-one")
	@ResponseBody
	public Article getOne(HttpServletRequest request,int id){
		return as.getById(id);
	}
	
	@RequestMapping("/get-list")
	@ResponseBody
	public List<Article> getList(HttpServletRequest request){
		return as.getList();
	}
	
	@RequestMapping("/qry-page")
	@ResponseBody
	public Map<String, Object> qryPage(HttpServletRequest request,int pageNo,int pageSize){
		return as.qryPage(pageNo, pageSize);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public boolean update(HttpServletRequest request,Article article){
		return as.update(article);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public boolean delete(HttpServletRequest request,int id){
		return as.delete(id);
	}
}
