package com.hust.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hust.model.Course;
import com.hust.model.User;
import com.hust.service.ProjectService;
@Controller
@Scope("session")
public class UserControler {

	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value="/userInfo", method=RequestMethod.GET)
	 public String userInfoGet() {	
	    return "userInfo";
	 }
	
	@RequestMapping(value="/userInfo", method=RequestMethod.POST)
	 public String userInfoPost(@ModelAttribute("updateUser") User updateUser, HttpServletRequest request, Model m) {	
		projectService.update(updateUser);
		request.getSession().setAttribute("user", updateUser);
		m.addAttribute("message", "Update successed!");	
		return "userInfo";		
	 }
	@RequestMapping(value="/userRegister", method=RequestMethod.GET)
	 public String registerManageGet(HttpServletRequest request, Model model){	
		User user = (User)request.getSession().getAttribute("user");
		List<Map<String, Object>> lists = projectService.listUserRegister(user.getUsername());
		model.addAttribute("lists", lists);
		
	    return "userRegister";
	 }
	
	@RequestMapping(value="/userRegisterDelete/{id}", method=RequestMethod.POST)
	 public String registerManageDelete(@PathVariable("id") int id, Model model, HttpServletRequest request){	
		projectService.updateRemoveRegister(id);
		projectService.removeRegister(id);
		User user = (User)request.getSession().getAttribute("user");
		List<Map<String, Object>> lists = projectService.listUserRegister(user.getUsername());
		model.addAttribute("lists", lists);
		model.addAttribute("message", "Remove register successed!");
	    return "userRegister";
	 }	 
}
