package com.hust.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import java.security.Principal;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hust.dao.ProjectDAO;
import com.hust.model.Course;
import com.hust.model.User;
import com.hust.service.ProjectService;

@Controller
@Scope("session")
public class MyController {

	@Autowired
	private ProjectService projectService;

	@RequestMapping("/home")
	public String homepage(HttpServletRequest r) {
		User sessionUser = (User) r.getSession().getAttribute("user");
		 if(sessionUser == null) {
			 Principal u = r.getUserPrincipal();
			 if(u != null) {
				 User user = projectService.findUserByUsername(u.getName());
				 r.getSession().setAttribute("user", user); 
			 }
		} 
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet(@RequestParam(value = "error", required = false) String error, Model m,
			HttpServletRequest r) {
		if (error != null) {
			m.addAttribute("error", "Account incorrect! Try again");
		}
		Principal u = r.getUserPrincipal();
		if (u != null) {
			System.out.println(u.getName());
			User user = projectService.findUserByUsername(u.getName());
			r.getSession().setAttribute("user", user);
		}
		return "login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGet(Model model) {
		model.addAttribute("registerUser", new User());
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(@ModelAttribute("registerUser") User registerUser, Model model, HttpServletRequest r) {
		System.out.println("In register POST: " + registerUser.toString());
		if (projectService.usernameExist(registerUser.getUsername())) {
			model.addAttribute("message", "Username existed! Please try other name");
			return "register";
		}
		// Save user
		projectService.save(registerUser);
		User user = (User) r.getSession().getAttribute("user");
		if (user == null)
			return "redirect:login";
		if (user.getRole().equals("ROLE_ADMIN"))
			return "redirect:userManage";

		return "redirect:login";
	}

	@RequestMapping(value = "/register/userExist", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody String userExistAjax(HttpServletRequest request) {
		String username = request.getParameter("name");
		String response = "";
		System.out.println("AJAX USERNAME: " + username);
		if (projectService.usernameExist(username))
			response = "exist";
		else
			response = "fine";
		// System.out.println("AJAX RESPONSE: "+response);
		return response;
	}

	@RequestMapping("/403")
	public String denied(HttpServletRequest r) {		 
		return "403";
	}
}
