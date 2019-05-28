package com.hust.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ClassMapper implements RowMapper<Class>{

	public Class mapRow(ResultSet rs, int rowNum) throws SQLException {
		Class c = new Class();
		c.setId(rs.getInt("id"));
		c.setIdCourse(rs.getInt("idCourse"));
		c.setName(rs.getString("name"));
		c.setLecturer(rs.getString("lecturer"));
		c.setDate(rs.getDate("date"));
		c.setCount(rs.getInt("count"));
		c.setCountMax(rs.getInt("countMax"));
		return c;
	}
}
