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
import com.hust.service.ProjectService;
import com.hust.service.UserService;

@Controller
@Scope("session")
public class AdminController {

	@Autowired
	private ProjectService projectService;
	
	private String COURSE_LOCATION = "D:\\Project\\MVCPro\\app\\src\\main\\webapp\\resources\\images\\Course\\";

	@RequestMapping(value="/userManage", method=RequestMethod.GET)
	 public String userManage(Model model, HttpServletRequest request) {
		User u = (User)request.getSession().getAttribute("user");
		if(u == null)
			return "login";
		List<User> list = projectService.findAllUser();
		model.addAttribute("listUser", list);
	    return "userManage";
	 }
	
	@RequestMapping(value="/userManage-edit", method=RequestMethod.POST)
	 public String classManageEdit(@ModelAttribute("editUser") User editUser, Model model) {	
		model.addAttribute("message", "Update successfully!");
		List<User> list = projectService.findAllUser();
		model.addAttribute("listUser", list);
		projectService.update(editUser);
		return "userManage";
	 }
	
	@RequestMapping(value="/userManage-delete/{username}")
	 public String classManageDelete(@PathVariable String username, Model model) {	
		if(projectService.delete(username))
			model.addAttribute("message", "Delete successfully!");
		else
			model.addAttribute("message", "Delete error!");
		List<User> list = projectService.findAllUser();
		model.addAttribute("listUser", list);
	    return "userManage";
	 }
	
	@RequestMapping(value="/courseManage", method=RequestMethod.GET)
	 public String courseManageGet(Model model) {	
		List<Course> list = projectService.findAllCourse();
		model.addAttribute("lists", list);
	    return "courseManage";
	 }
	
	@RequestMapping(value="/courseManageEdit", method=RequestMethod.POST)
	 public String courseManageEdit(Model model, @RequestParam("id") int id, @RequestParam("name") String name, @RequestParam("content") String content,
			 @RequestParam("kind") String kind, @RequestParam("img") MultipartFile file, @RequestParam("image") String image) throws IOException {	
		Course c = new Course(name, content, kind);
		c.setId(id);
		c.setImg(image);
		if(!file.isEmpty()) {
			//update new image
			//if img existed in course folder
			File f = new File(COURSE_LOCATION+file.getOriginalFilename());
			if(!f.exists()) {
				//create new img by this img form form
				File del = new File(COURSE_LOCATION+image);
				del.delete();
				FileCopyUtils.copy(file.getBytes(), new File(COURSE_LOCATION + file.getOriginalFilename()));
				c.setImg(file.getOriginalFilename());						
			}
		}		
		projectService.update(c);
 		model.addAttribute("message", "Update course successed!");
		List<Course> list = projectService.findAllCourse();
		model.addAttribute("lists", list);
	    return "courseManage";
	 }
	@RequestMapping(value="/courseManageDelete/{id}", method=RequestMethod.POST)
	 public String courseManageDelete(@PathVariable("id") int id, Model model){	
		projectService.delete(id);
		model.addAttribute("message", "Delete course successed!");
		List<Course> list = projectService.findAllCourse();
		model.addAttribute("lists", list);
		return "/courseManage";
	 }
	@RequestMapping(value="/classManage", method=RequestMethod.GET)
	 public String classManage(Model model) {	
		List<Map<String, Object>> lists = projectService.listClass();
		List<Map<String, Object>> listCourse = projectService.listCourseWithNameAndID();
		model.addAttribute("lists", lists);
		model.addAttribute("listCourse", listCourse);
	    return "classManage";
	 }
	@RequestMapping(value="/classManageAdd", method=RequestMethod.POST)
	 public String classManageAdd(@ModelAttribute("addClass") com.hust.model.Class c, Model model) {	
		projectService.saveClass(c);
		List<Map<String, Object>> lists = projectService.listClass();
		List<Map<String, Object>> listCourse = projectService.listCourseWithNameAndID();
		model.addAttribute("lists", lists);
		model.addAttribute("listCourse", listCourse);
		model.addAttribute("message", "Add class successed!");
	    return "classManage";
	 }
	
	@RequestMapping(value="/classManageEdit", method=RequestMethod.POST)
	 public String classManageEdit(@ModelAttribute("editClass") com.hust.model.Class c, Model model) {		
		projectService.updateClass(c);
		List<Map<String, Object>> lists = projectService.listClass();
		List<Map<String, Object>> listCourse = projectService.listCourseWithNameAndID();
		model.addAttribute("lists", lists);
		model.addAttribute("listCourse", listCourse);
		model.addAttribute("message", "Edit class successed!");
	    return "classManage";
	 }
	
	@RequestMapping(value="/classManageDelete/{id}", method=RequestMethod.POST)
	 public String classManageDelete(@PathVariable("id") int id, Model model) {	
		projectService.deleteClass(id);
		List<Map<String, Object>> lists = projectService.listClass();
		List<Map<String, Object>> listCourse = projectService.listCourseWithNameAndID();
		model.addAttribute("lists", lists);
		model.addAttribute("listCourse", listCourse);
		model.addAttribute("message", "Delete class successed!");
	    return "/classManage";
	 }
	@RequestMapping(value="/registerManage", method=RequestMethod.GET)
	 public String registerManageGet( Model model) {			
		model.addAttribute("lists",projectService.listRegister() );
	    return "registerManage";
	 }
	@RequestMapping(value="/registerManageSearch", method=RequestMethod.POST)
	 public String registerManagePost(@RequestParam("values") String values, @RequestParam("type") String type, Model model) {	
		System.out.println("IN REGISTER MANAGE SEARCH: VALUES: "+values+", TYPE: "+type);
		List<Map<String, Object>> lists = projectService.valueInType(values, type);
		if(lists.isEmpty()) {
			model.addAttribute("error", "Search for "+type+": "+values+" with no result");			
		}else {
			model.addAttribute("message", "Found with "+lists.size()+" result");		
		}
		model.addAttribute("lists",lists );
	    return "registerManage";
	 }
	@RequestMapping(value="/registerManageDelete/{id}", method=RequestMethod.POST)
	 public String registerManageDelete(@PathVariable("id") int id, Model model) {	
		projectService.updateRemoveRegister(id);
		projectService.removeRegister(id);
	    return "redirect:/registerManage";
	 }
	
}
