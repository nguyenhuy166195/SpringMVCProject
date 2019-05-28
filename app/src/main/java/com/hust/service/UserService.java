package com.hust.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hust.dao.UserDAO;
import com.hust.model.User;
import com.mysql.fabric.xmlrpc.base.Data;

@Service
@Transactional
public class UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	public List<User> findAll() {
	    return userDAO.findAll();
	  }
	public User findUserByUsername(String username) {
		return userDAO.findUserByUsername(username);
	}
	 public boolean usernameExist(String username) {
		List<String> list = new ArrayList<String>();
		list = userDAO.findByUsername(username);
		 
		if(list == null) {
			//System.out.println("NO EXIST: username: "+username);
			return false;
		}
		//System.out.println("EXIST: username: "+username+", list: "+list.get(0));
		return true;
		
	 }
	  public User findByUsernameAndPassword(String username, String password){
		    return userDAO.findByUsernameAndPassword(username, password);
		  }
	
	  public void save(User user){
	    // validate business
		  userDAO.save(user);
	  }
	  public void update(User user){
	    // validate business
		  userDAO.update(user);
	  }
	  
	  public boolean delete(String username){
		  
	    // validate business
		  if(!usernameExist(username)) {
			  return false;
		  }	  
		  userDAO.delete(username);
		  return true;
	  }
	
}
