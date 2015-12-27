package com.qile.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qile.dao.BaseDao;
import com.qile.entity.Activity;

@Service
public class ActivityService {

	@Autowired
	private BaseDao<Activity> dao;
	
	/**
	 * 新增活动
	 * @param activity
	 * @return
	 */
	public Serializable add(Activity activity) {
		try {
			return dao.save(activity);
		} catch (Exception e) {
			return 0;
		}
	}
	
	/**
	 * 跟新活动
	 * @param activity
	 * @return
	 */
	public int update(Activity activity) {
		try {
			dao.update(activity);
			return activity.getId();
		} catch (Exception e) {
			return 0;
		}
	}
	
	/**
	 * 根据Id获取
	 * @param id
	 * @return
	 */
	public Activity getById(int id) {
		return dao.get(Activity.class, id);
	}
	
	/**
	 * 获取指定社团的活动
	 * @param associationId
	 * @return
	 */
	public List<Activity> getByAssociation(int associationId) {
		List<String> keys = new ArrayList<>();
		keys.add("association");
		List<Activity> list =  dao.find(Activity.class,keys, associationId);
		for (Activity activity : list) {
			activity.setContent(null);
			activity.setTag(null);
			if (activity.getTitle().length()>20) {
				activity.getTitle().substring(0, 19);
			}
			
		}
		return list;
	}
	
}
