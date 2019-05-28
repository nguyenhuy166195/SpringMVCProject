package com.hust.model;

import java.sql.Date;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.apache.naming.java.javaURLContextFactory;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

public class User {
	
	private String username;
	private String password;
	private String name;
	private String email;
	private Date birthDay;
	private String role;
	
	public User() {}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}
	/*
	 * public Date getFormatBirthDay() throws ParseException { DateFormat df = new
	 * SimpleDateFormat("yyyy-MM-dd"); java.util.Date date =
	 * df.parse(this.birthDay); return new java.sql.Date(date.getTime()); } public
	 * void setFormatBirthDay(Date date) throws ParseException { DateFormat df = new
	 * SimpleDateFormat("yyyy-MM-dd"); this.birthDay = df.format(date); }
	 */
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String toString() {
		String result="Username: "+username+", password: "+password+"\n name:"+name+", email: "+email
				+"\nrole: "+role+"\nbirthDay: "+this.birthDay;
		return(result);
	}
	  
}
