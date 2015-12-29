package com.qile.service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qile.dao.BaseDao;
import com.qile.entity.Article;

@Service
public class ArticleService {

	@Autowired
	private BaseDao<Article> dao;
	
	/**
	 * 新增文章
	 * @param article
	 * @return
	 */
	public Serializable add(Article article) {
		try {
			return dao.save(article);
		} catch (Exception e) {
			return 0;
		}
	}
	
	
	
	
	/**
	 * 根据ID获取文章
	 * @param id
	 * @return
	 */
	public Article getById(int id) {
		return dao.get(Article.class, id);
	}
	
	
	
	/**
	 * 获取所有文章
	 * @return
	 */
	public List<Article> getList() {
		return dao.findAll(Article.class);
	}
	
	/**
	 * 分页查询
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> qryPage(int pageNo,int pageSize) {
		String hql = "FROM Article ORDER BY id DESC";

		List<Article> list = dao.findByPage(hql, pageNo, pageSize);
		for (Article article : list) {
			article.setContent(null);
		}

		long amount = dao.findCount("SELECT COUNT(*) "+hql);
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		if (amount==0) {
			map.put("amount", 0);
		}else if (amount <= pageSize) {
			map.put("amount", 1);
		}else if (amount%pageSize==0) {
			map.put("amount", amount/pageSize);
		}else {
			map.put("amount", amount/pageSize+1);
		}
		return map;
	}
	
	/**
	 * 更新文章
	 * @param article
	 * @return
	 */
	public boolean update(Article article) {
		try {
			dao.update(article);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * 删除文章
	 * @param id
	 * @return
	 */
	public boolean delete(int id) {
		try {
			dao.delete(Article.class, id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	
	
}
