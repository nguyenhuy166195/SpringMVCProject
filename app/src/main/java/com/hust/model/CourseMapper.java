package com.hust.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CourseMapper implements RowMapper<Course>{

	public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
		Course course = new Course();
		course.setId(rs.getInt("id"));
		course.setName(rs.getString("name"));
		course.setContent(rs.getString("content"));
		if(rs.getString("img") == null) course.setImg("");
		else course.setImg(rs.getString("img"));
		course.setKind(rs.getString("kind"));
		return course;
	}

}
