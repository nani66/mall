package com.augustars.mall.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.augustars.mall.dao.UserDao;
import com.augustars.mall.entity.User;
import com.augustars.mall.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	public User getUserByLoginName(String loginName) throws Exception {
		User user = userDao.findUserByLoginName(loginName);
		return user;
	}
	
	public Map<String, Object> getUserListByPage(Integer pageNum, Integer pageSize, String username) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// Direction.ASC升序排列
		Sort sort = new Sort(Direction.ASC, "userId");
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize, sort);
		Page<User> page = null;
		if (username == null) {
			page = userDao.findAll(pageable);
		} else {
			// Specifications分页查询
			page = userDao.findAll(new Specification<User>() {
				// CriteriaBuilder查询条件
				public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
					List<Predicate> queryList = new ArrayList<Predicate>();
					// 开始设定模糊查询
					queryList.add(criteriaBuilder.like(root.get("username"), "%" + username + "%"));
					Predicate[] predicates = new Predicate[queryList.size()];
					return query.where(queryList.toArray(predicates)).getRestriction();
				}
			}, pageable); 
		}
		resultMap.put("list", page.getContent());   // 所有查询结果
		resultMap.put("pageNum", pageNum);
		resultMap.put("pageSize", pageSize);
		resultMap.put("totalCount", page.getTotalElements());   // 总的元素数量
		resultMap.put("totalPage", page.getTotalPages());       // 总的分页数量
		return resultMap;
	}


	



	

}
