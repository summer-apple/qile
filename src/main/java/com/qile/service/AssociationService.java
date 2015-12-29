package com.qile.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qile.dao.BaseDao;
import com.qile.entity.Association;

@Service
public class AssociationService {
	
	@Autowired
	private BaseDao<Association> dao;
	
	/**
	 * 注册
	 * @param association
	 * @return
	 */
	public boolean register(Association association) {	
		try {
			dao.update(association);
			
			
			//在此删除无效用户
			
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}
	
	/**
	 * 登陆
	 * @param username
	 * @param password
	 * @return
	 */
	public Association login(String username,String password) {
		Association association = dao.get(Association.class, "username", username);
		
		if (association != null && association.getPassword().equals(password)) {
			return association;
		}else {
			return null;
		}
	}
	
	
	/**
	 * 更新社团信息
	 * @param association
	 * @return
	 */
	public boolean update(Association association) {
		try {
			dao.update(association);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * 获取列表
	 * @return
	 */
	public List<Association> getList(){
		String hql = "FROM Association AS a WHERE a.username IS NOT NULL";
		return dao.find(hql);
	}

}
