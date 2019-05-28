package com.hust.dao;

import java.nio.channels.SelectableChannel;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.naming.java.javaURLContextFactory;
import org.jasypt.util.binary.StrongBinaryEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.hust.model.ClassMapper;
import com.hust.model.Course;
import com.hust.model.CourseMapper;
import com.hust.model.User;
import com.hust.model.UserMapper;

@Repository
@Transactional
public class ProjectDAO {

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
			return null;
		}
		return list;
	}
	public User findByUsernameAndPassword(String username, String password) {
		String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
			 
		return jdbcTemplate.queryForObject(sql, new UserMapper(), username, password);
	}
	public List<User> findAllUser() {
		String sql = "SELECT * FROM user WHERE username != 'admin'";
	    return jdbcTemplate.query(sql, new UserMapper());
	}
	
	public List<Course> findAllCourse(){
		String sql = "SELECT * FROM course";
		return jdbcTemplate.query(sql, new CourseMapper());
	}
	public void save(Course c) {
		String sql = "INSERT INTO course(name, content, img, kind) values(?, ?, ?, ?)";
		jdbcTemplate.update(sql, c.getName(), c.getContent(), c.getImg(), c.getKind());
	}
	public void update(Course c) {
		String sql = "UPDATE course SET name = ?, content = ?, img = ?, kind = ? WHERE id = ?";
	 
	    jdbcTemplate.update(sql,  c.getName(), c.getContent(), c.getImg(), c.getKind(), c.getId() );
	}
	public List<Integer> listCourseID(){
		String sql = "SELECT id FROM course";
		return jdbcTemplate.queryForList(sql, Integer.class);
	}
	public void delete(int id) {
	    String sql = "DELETE FROM course WHERE id = ?";
	    jdbcTemplate.update(sql, id);
	}
	public List<Map<String, Object>> listClass(){
		String sql = "SELECT co.id as 'courseID', co.name as 'courseName', c.id as 'classID', c.name as 'className', c.lecturer as 'classLecturer'," + 
				"c.date as 'classDate', c.count as 'classCount', c.countMax as 'classCountMax'" + 
				"FROM class c, course co WHERE c.idCourse = co.id";
		return jdbcTemplate.queryForList(sql);
	}
	public List<Map<String, Object>> listCourseWithNameAndID() {
		 String sql = "SELECT id as 'courseID', name as 'courseName' FROM course";
		 return jdbcTemplate.queryForList(sql);
	}
	public void saveClass(com.hust.model.Class c) {
		String sql = "INSERT INTO class(idCourse, name, lecturer, date, count, countMax) values(?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, c.getIdCourse(), c.getName(), c.getLecturer(), c.getDate(), c.getCount(), c.getCountMax());
	}
	public void deleteClass(int id) {
		  String sql = "DELETE FROM class WHERE id = ?";
		   jdbcTemplate.update(sql, id);
	}
	public void updateClass(com.hust.model.Class c) {
		String sql = "UPDATE class SET idCourse = ?, name = ?, lecturer = ?, date = ?, count = ?, countMax = ? WHERE id = ?";		 
	    jdbcTemplate.update(sql,  c.getIdCourse(), c.getName(), c.getLecturer(), c.getDate(), c.getCount(), c.getCountMax(), c.getId() );
	}
	public List<Map<String, Object>> listUserRegister(String username) {
		String sql = "SELECT c.name as 'className', c.lecturer as 'classLecturer', c.date as 'classDate'," + 
				"r.id as 'id', r.username as 'username', r.idClass as 'idClass', r.dateRegister as 'dateRegister', r.status as 'status' " + 
				"FROM class c, register r WHERE c.id = r.idClass AND r.username = ? ";
		return jdbcTemplate.queryForList(sql, username);
	}
	public void registerClass(int idClass, String username,String control) {
		if(control.equals("insert")) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date = new java.util.Date();
			
			String sql = "INSERT INTO register(username, idClass, dateRegister) values('"+username+"', '"+idClass+"', '"+dateFormat.format(date)+"')";
			jdbcTemplate.update(sql);
		}else {
			String sql = "SELECT id FROM register WHERE username='"+username+"' AND idClass='"+idClass+"' ";
			String idRegister = jdbcTemplate.queryForObject(sql, String.class);
			sql = "DELETE FROM register WHERE id = ?";
			jdbcTemplate.update(sql, idRegister);
		}		
	}
	public void updateRegisterClass(int idClass, String control) {	
		String sql = "SELECT count FROM class WHERE id = '"+idClass+"' ";
		int count = (Integer) jdbcTemplate.queryForObject(sql, Integer.class);

		if(control.equals("down")) {
			if(count <= 0 )
				return;
			--count;
			sql = "UPDATE class SET count = ? WHERE id = ?";
			jdbcTemplate.update(sql, count, idClass);
		}else {
			sql = "SELECT countMax FROM class WHERE id = '"+idClass+"' ";
			int countMax = (Integer) jdbcTemplate.queryForObject(sql, Integer.class);
			if(count >= countMax)
				return;
			++count;
			sql = "UPDATE class SET count = ? WHERE id = ?";
			jdbcTemplate.update(sql, count, idClass);
		}
	}
	public void removeRegister(int id) {
		String sql = "DELETE FROM register WHERE id = ?";
		jdbcTemplate.update(sql, id);
	}
	public void updateRemoveRegister(int id) {
		String sql = "SELECT c.id FROM class c, register r WHERE c.id=r.idClass AND r.id='"+id+"' ";
		int classId = jdbcTemplate.queryForObject(sql, Integer.class);
		sql = "SELECT count FROM class WHERE id = '"+classId+"' ";
		int count = (Integer) jdbcTemplate.queryForObject(sql, Integer.class);
		if(count <= 0)
			return;
		--count;
		sql = "UPDATE class SET count = ? WHERE id = ?";
		jdbcTemplate.update(sql, count, classId);
	}
	public List<Map<String, Object>> listRegister() {
		String sql = "SELECT c.name as 'className', c.lecturer as 'classLecturer', c.date as 'classDate', c.count as 'classCount', c.countMax as 'classCountMax', " + 
				"r.id as 'id', r.username as 'username', r.idClass as 'idClass', r.dateRegister as 'dateRegister', r.status as 'status' " + 
				"FROM class c, register r WHERE c.id = r.idClass";
		return jdbcTemplate.queryForList(sql);
	}
	public List<Map<String, Object>> listValueByType(String value, String type) {
		String sql = "";
		if(type.equals("username")) {
			sql = "SELECT c.name as 'className', c.lecturer as 'classLecturer', c.date as 'classDate', c.count as 'classCount', c.countMax as 'classCountMax', " + 
					"r.id as 'id', r.username as 'username', r.dateRegister as 'dateRegister', r.status as 'status' " + 
					"FROM class c, register r WHERE c.id = r.idClass AND r.username LIKE '%"+value+"%' ";
		}else if(type.equals("className")) {
			sql = "SELECT c.name as 'className', c.lecturer as 'classLecturer', c.date as 'classDate', c.count as 'classCount', c.countMax as 'classCountMax', " + 
					"r.id as 'id', r.username as 'username', r.dateRegister as 'dateRegister', r.status as 'status' " + 
					"FROM class c, register r WHERE c.id = r.idClass AND c.name like '%"+value+"%' ";
		}else if(type.equals("dateRegister")) {
			sql = "SELECT c.name as 'className', c.lecturer as 'classLecturer', c.date as 'classDate', c.count as 'classCount', c.countMax as 'classCountMax', " + 
					"r.id as 'id', r.username as 'username', r.dateRegister as 'dateRegister', r.status as 'status' " + 
					"FROM class c, register r WHERE c.id = r.idClass AND r.dateRegister = '"+value+"' ";
		}else {
			return this.listRegister();
		}		
		return jdbcTemplate.queryForList(sql);
	}
	public List<Map<String, Object>> listClassOrderByCourseName(String courseName){
		String sql = "SELECT co.name as 'courseName', c.id as 'id', c.name as 'name', c.lecturer as 'lecturer'"
				+ ", c.date as 'date', c.count as 'count', c.countMax as 'countMax' " 
				+ "FROM class c, course co WHERE c.idCourse=co.id AND co.name = ?";
		return jdbcTemplate.queryForList(sql, courseName);		
	}
	public com.hust.model.Class findClassById(int id){
		String sql = "SELECT * FROM class WHERE id="+id+" ";
		return (com.hust.model.Class)jdbcTemplate.queryForObject(sql, new ClassMapper());			
	}
	public List<Map<String, Object>> getListStudentOfClass(int id) {
		//String sql ="SELECT co.name as 'name', co.content as 'content', co.img as 'img', co.kind as 'kind' "
				//+ "FROM class c, course co WHERE c.idCourse=co.id AND c.id="+id+" ";
		String sql = "SELECT u.name as 'name', u.email as 'email', u.birthDay as 'birthday', r.username as 'username', r.dateRegister as 'dateRegister', r.status as 'status' "
				+ " FROM class c, register r, user u WHERE c.id=r.idClass AND u.username = r.username AND c.id='"+id+"' ";
		return jdbcTemplate.queryForList(sql);
	}
	public String getCourseNameFromClass(int id) {
		String sql = "SELECT co.name as 'courseName' FROM class c, course co WHERE c.idCourse=co.id AND c.id="+id+"";
		return jdbcTemplate.queryForObject(sql, String.class);
	}

}
