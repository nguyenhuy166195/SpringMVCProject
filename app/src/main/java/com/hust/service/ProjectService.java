package com.hust.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hust.dao.ProjectDAO;
import com.hust.dao.UserDAO;
import com.hust.model.Class;
import com.hust.model.Course;
import com.hust.model.User;

@Service
@Transactional
public class ProjectService {
	@Autowired
	private ProjectDAO projectDao;
	
	public List<User> findAllUser() {
	    return projectDao.findAllUser();
	  }
	public User findUserByUsername(String username) {
		return projectDao.findUserByUsername(username);
	}
	public boolean usernameExist(String username) {
		List<String> list = new ArrayList<String>();
		list = projectDao.findByUsername(username); 
		if(list == null) {
			return false;
		}
		return true;
	}
	public User findByUsernameAndPassword(String username, String password){
		return projectDao.findByUsernameAndPassword(username, password);
	}
	
	public void save(User user){
		projectDao.save(user);
	}
	public void update(User user){
		projectDao.update(user);
	}
	  
	public boolean delete(String username){
		if(!usernameExist(username)) {
			 return false;
		}	  
		projectDao.delete(username);
		return true;
	}
	public List<Course> findAllCourse(){
		return projectDao.findAllCourse();
	}
	public void save(Course c) {
		projectDao.save(c);
	}
	public void update(Course c) {
		projectDao.update(c);
	}
	public boolean delete(int id) {
		if(courseExist(id)) {
			projectDao.delete(id);
			return true;
		}
		return false;
	}
	public boolean courseExist(int id) {
		List<Integer> ids = projectDao.listCourseID();
		for (Integer i : ids) {
			if(id == i) {
				return true;
			}				
		}
		return false;
	}	
	public List<Map<String, Object>> listClass(){
		return projectDao.listClass();
	}
	public List<Map<String, Object>> listCourseWithNameAndID(){
		return projectDao.listCourseWithNameAndID();
	}
	public void saveClass(com.hust.model.Class c) {
		projectDao.saveClass(c);
	}
	public void deleteClass(int id) {
		projectDao.deleteClass(id);
	}
	public void updateClass(com.hust.model.Class c) {
		projectDao.updateClass(c);
	}
	public List<Map<String, Object>> listUserRegister(String username) {
		return projectDao.listUserRegister(username);
	}
	
	public void registerClass(int id, String username, String control) {
		projectDao.registerClass(id, username, control);
	}
	public void updateRegisterClass(int idClass, String control) {
		projectDao.updateRegisterClass(idClass, control);
	}
	public void removeRegister(int id) {
		projectDao.removeRegister(id);
	}
	public void updateRemoveRegister(int id) {
		projectDao.updateRemoveRegister(id);
	}
	public List<Map<String, Object>> listRegister() {		
		return projectDao.listRegister();
	}
	public List<Map<String, Object>> valueInType(String value, String type) {
		List<Map<String, Object>> lists = projectDao.listValueByType(value, type);
		return lists;
	}
	public List<Map<String, Object>> listClassOrderByCourseName(String courseName){
		return projectDao.listClassOrderByCourseName(courseName);	
	}
	public com.hust.model.Class findClassById(int id){
		
		return projectDao.findClassById(id);		
		
	}
	public List<Map<String, Object>> getListStudentFromClass(int id) {
		return projectDao.getListStudentOfClass(id);
	}
	public String getCourseNameFromClass(int id) {
		return projectDao.getCourseNameFromClass(id);
	}
	public int isUserRegisteredClass(int id, String username) {
		List<Map<String, Object>> list = projectDao.getListStudentOfClass(id);
		for (Map<String, Object> map : list) {
			if(map.get("username").equals(username))
				return 1;
		}
		return 0;
	}

	
}
