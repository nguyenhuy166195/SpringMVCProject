package com.hust.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.jdbc.core.RowMapper;

public class UserMapper implements RowMapper<User>{
	public User mapRow( ResultSet rs, int rowNum) throws SQLException {
		User user = new User();
		
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setName(rs.getString("name"));
		user.setEmail(rs.getString("email"));
		user.setBirthDay(rs.getDate("birthDay"));
		user.setRole(rs.getString("role"));
		return user;
	}
}
