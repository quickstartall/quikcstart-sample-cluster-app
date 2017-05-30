package com.raquibul.quickstartall.clustering.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class ClusterController {
	@RequestMapping(value = "/ClusterTest", method = RequestMethod.GET)
	public String welcome(ModelMap model) {
		//log whatever you want to log here.
		
		return "index";
	}
}
