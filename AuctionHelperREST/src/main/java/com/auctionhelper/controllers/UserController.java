package com.auctionhelper.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.auctionhelper.entities.User;
import com.auctionhelper.services.UserService;

@RestController
@RequestMapping(path = "api")
@CrossOrigin({ "*", "http://localhost:4200" })
public class UserController {
	@Autowired
	private UserService userServ;
	

	@RequestMapping(path = "users/ping", method = RequestMethod.GET)
	public String ping() {
		return "pong";
	}

	@RequestMapping(path = "users/all", method = RequestMethod.GET)
	public List<User> index(HttpServletRequest req, HttpServletResponse res, Principal principal) {
		return userServ.index();
	}

	@RequestMapping(path = "users/{uid}")
	public User show(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid, Principal principal) {
		return userServ.show(uid);
	}

	@RequestMapping(path = "users", method = RequestMethod.POST)
	public User create(@RequestBody User user, HttpServletRequest request,
			HttpServletResponse response, Principal principal) {
		User us = userServ.create(user);

		if (us != null) {
			response.setStatus(200);
			return us;

		}
		response.setStatus(500);
		return us;
	}

	@RequestMapping(path = "users/{uid}", method = RequestMethod.PATCH)
	public User update(@PathVariable int uid, @RequestBody User user, HttpServletRequest request,
			HttpServletResponse response, Principal principal) {
		User us = userServ.update(uid, user);

		if (us != null) {
			response.setStatus(200);
			return us;

		}
		response.setStatus(500);
		return us;
	}

	@RequestMapping(path = "users/{uid}", method = RequestMethod.DELETE)
	public void destroy(@PathVariable int uid, HttpServletRequest request, HttpServletResponse response, Principal principal) {
		userServ.destroy(uid);
		response.setStatus(500);
		try {
		userServ.show(uid);
		}
		catch(Exception e) {
			response.setStatus(200);
		}
	
	}

}