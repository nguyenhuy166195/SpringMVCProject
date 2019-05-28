package com.hust.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.hust.model.Course;
import com.hust.model.User;
import com.hust.model.Class;
import com.hust.service.ProjectService;
import com.hust.service.UserService;

@Controller
@Scope("session")
public class ViewController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProjectService courseService;
	
	@RequestMapping(value="/html", method=RequestMethod.GET)
	 public String html(Model model) {
		List<Map<String, Object>> list = courseService.listClassOrderByCourseName("HTML");
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
	    return "HTML";
	 }
	 
	 @RequestMapping(value="/css", method=RequestMethod.GET)
	 public String css(Model model) {
		List<Map<String, Object>> list = courseService.listClassOrderByCourseName("CSS");
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
	    return "CSS";
	 }
	 @RequestMapping(value="/javascript", method=RequestMethod.GET)
	 public String javascript(Model model) {
		List<Map<String, Object>> list = courseService.listClassOrderByCourseName("JavaScript");
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
	    return "JavaScript";
	 }
	 @RequestMapping(value="/java", method=RequestMethod.GET)
	 public String java(Model model) {
		List<Map<String, Object>> list = courseService.listClassOrderByCourseName("Java");
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
	    return "Java";
	 }
	 @RequestMapping(value="/php", method=RequestMethod.GET)
	 public String php(Model model) {
		List<Map<String, Object>> list = courseService.listClassOrderByCourseName("PHP");
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
	    return "PHP";
	 }
	 
	 @RequestMapping(value="/class/{id}", method=RequestMethod.GET)
	 public String classView(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		com.hust.model.Class c = (Class)courseService.findClassById(id);
		model.addAttribute("c", c);
		model.addAttribute("courseName", courseService.getCourseNameFromClass(id));
		model.addAttribute("listStudent", courseService.getListStudentFromClass(id));
		User user = (User)request.getSession().getAttribute("user");
		if(user != null) {
			if(user.getRole().equals("ROLE_ADMIN")) {
				model.addAttribute("isRegistered", -1);//admin
			}else {
				model.addAttribute("isRegistered", courseService.isUserRegisteredClass(id, user.getUsername()));
				//user
				//0: no, 1: yes
			}
		}else {
			model.addAttribute("isRegistered", -2);//no user	
		}			
	    return "classView";
	 }
	 
	 @RequestMapping(value="/classRemoveRegister/{id}", method=RequestMethod.POST)
	 public String classRemoveRegisterView(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		
		courseService.updateRegisterClass(id, "down");
		courseService.registerClass(id, user.getUsername(), "remove");
		
		List<Map<String, Object>> lists = courseService.listUserRegister(user.getUsername());
		model.addAttribute("lists", lists);
	    return "/userRegister";
	 }
	 
	 @RequestMapping(value="/classDoRegister/{id}", method=RequestMethod.POST)
	 public String classDoRegisterView(@PathVariable("id") int id, Model model, HttpServletRequest request) {
		User user = (User)request.getSession().getAttribute("user");
		if(user == null)
			return "login";
		courseService.updateRegisterClass(id, "up");
		courseService.registerClass(id, user.getUsername(), "insert");
		
		List<Map<String, Object>> lists = courseService.listUserRegister(user.getUsername());
		model.addAttribute("lists", lists);
					
	    return "/userRegister";
	 }
	
	 

}
