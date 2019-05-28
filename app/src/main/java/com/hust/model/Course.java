package com.hust.model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

public class Course {
	
	private int id;
	private String name;
	private String content;
	private String img;
	private String kind;
	
	public Course() {}
    
	public Course(String name, String content, String kind) {
		super();
		this.name = name;
		this.content = content;
		this.kind = kind;
	}
	
	public Course(String name, String content, String img, String kind) {
		super();
		this.name = name;
		this.content = content;
		this.img = img;
		this.kind = kind;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}
	
	public String toString() {
		return "ID: "+id+",Name: "+name+",Content: "+content+",Kind: "+kind+",IMG: "+img;
	}

	
	
}
