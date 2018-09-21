package com.augustars.mall.dao;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.augustars.mall.entity.User;

public interface UserDao extends PagingAndSortingRepository<User, Long>, JpaSpecificationExecutor<User> {
	
	@Query(value="from User u where u.loginName=:loginName")
	public User findUserByLoginName(@Param("loginName")String loginName) throws Exception;


}
