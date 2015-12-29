package com.qile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qile.dao.BaseDao;
import com.qile.entity.Company;

@Service
public class CompanyService {
	
	@Autowired
	private BaseDao<Company> dao;
	
	/**
	 * 注册
	 * @param company
	 * @return
	 */
	public boolean register(Company company) {	
		try {
			dao.update(company);
			
			
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
	public Company login(String username,String password) {
		Company company = dao.get(Company.class, "username", username);
		
		if (company != null && company.getPassword().equals(password)) {
			return company;
		}else {
			return null;
		}
	}
	
	
	/**
	 * 更新社团信息
	 * @param company
	 * @return
	 */
	public boolean update(Company company) {
		try {
			dao.update(company);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * 获取列表
	 * @return
	 */
	public List<Company> getList(){
		String hql = "FROM Company AS a WHERE a.username IS NOT NULL";
		return dao.find(hql);
	}

}
