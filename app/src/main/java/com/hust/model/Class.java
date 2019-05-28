package com.hust.model;

import java.sql.Date;

public class Class {
	private int id;
	private int idCourse;
	private String name;
	private String lecturer;
	private Date date;
	private int count ;
	private int countMax ;
	
	public Class() {}
	
	public Class(int idCourse, String name, String lecturer, Date date, int count, int countMax) {
		super();
		this.idCourse = idCourse;
		this.name = name;
		this.lecturer = lecturer;
		this.date = date;
		this.count = count;
		this.countMax = countMax;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdCourse() {
		return idCourse;
	}
	public void setIdCourse(int idCourse) {
		this.idCourse = idCourse;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLecturer() {
		return lecturer;
	}
	public void setLecturer(String lecturer) {
		this.lecturer = lecturer;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCountMax() {
		return countMax;
	}
	public void setCountMax(int countMax) {
		this.countMax = countMax;
	}
	public String toString() {
		return "ID: "+id+",idCourse: "+idCourse+",Name: "+name+",Lecturer: "+lecturer+",Date: "+date+",count: "+count+",countMax: "+countMax;
	}
}
