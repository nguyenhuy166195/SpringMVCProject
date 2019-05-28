package com.hust.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.jasypt.util.binary.StrongBinaryEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hust.model.User;
import com.hust.model.UserMapper;
import com.sun.org.apache.regexp.internal.recompile;


@Repository
@Transactional
public class UserDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	  public void save(User user) {
	    String sql = "INSERT INTO user(username, password, name, email, birthDay) VALUES (?, ?, ?, ?, ?)";
	    		
	    jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getName(), user.getEmail(), 
	    		user.getBirthDay());
	  }
	  public void delete(String username) {
	    String sql = "DELETE FROM user WHERE username = ?";
	    jdbcTemplate.update(sql, username);
	  }
	  public void update(User user) {
	    String sql = "UPDATE user SET password = ?, name = ?, email = ?, "
	    		+ " birthDay = ? WHERE username = ?";
	 
	    jdbcTemplate.update(sql, user.getPassword(), user.getName(), user.getEmail(), 
	    		user.getBirthDay(), user.getUsername());
	  }
	  public User findUserByUsername(String username) {
		  String sql = "SELECT * FROM user WHERE username = '"+username+"' ";
		  return jdbcTemplate.queryForObject(sql, new UserMapper());
	  }
	 public List<String> findByUsername(String username){
		 String sql = "SELECT username FROM user WHERE username = '" + username +"' ";
		 List<String> list = jdbcTemplate.queryForList(sql, String.class);
		 if(list.isEmpty()) {
			 //System.out.println("userdao: LIST is empty: "+username);
			 return null;
		 }
		 //System.out.println("userdao: LIST is not empty: "+username);
		 return list;
	 }
	  public User findByUsernameAndPassword(String username, String password) {
		  String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
		 
		  return jdbcTemplate.queryForObject(sql, new UserMapper(), username, password);
	  }
	  public List<User> findAll() {
	    String sql = "SELECT * FROM user WHERE username != 'admin'";
	    return jdbcTemplate.query(sql, new UserMapper());
	  }
	  
	  public List<User> test(){
		  String sql = "SELECT * FROM user WHERE name = 'cc' ";
		  return jdbcTemplate.query(sql, new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				System.out.println("TEST rowNum="+rowNum+",rs.getName(): "+rs.getString("name"));
				User user = new User();
				return user;
			}
			  
		  });
	  }
	 
}
