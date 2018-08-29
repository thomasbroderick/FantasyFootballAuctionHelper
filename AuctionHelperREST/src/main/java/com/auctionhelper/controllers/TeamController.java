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

import com.auctionhelper.entities.Team;
import com.auctionhelper.services.TeamService;

@RestController
@RequestMapping(path = "api")
@CrossOrigin({ "*", "http://localhost:4200" })
public class TeamController {
	@Autowired
	private TeamService teamServ;
	

	@RequestMapping(path = "teams/ping", method = RequestMethod.GET)
	public String ping() {
		return "pong";
	}

	@RequestMapping(path = "teams", method = RequestMethod.GET)
	public List<Team> index(HttpServletRequest req, HttpServletResponse res, Principal principal) {
		return teamServ.index();
	}

	@RequestMapping(path = "team/{pid}")
	public Team show(HttpServletRequest req, HttpServletResponse res, @PathVariable int pid, Principal principal) {
		return teamServ.show(pid);
	}

	@RequestMapping(path = "teams", method = RequestMethod.POST)
	public Team create(@RequestBody Team team, HttpServletRequest request,
			HttpServletResponse response, Principal principal) {
		Team play = teamServ.create(team);

		if (play != null) {
			response.setStatus(200);
			return play;

		}
		response.setStatus(500);
		return play;
	}

	@RequestMapping(path = "teams/{pid}", method = RequestMethod.PATCH)
	public Team update(@PathVariable int pid, @RequestBody Team team, HttpServletRequest request,
			HttpServletResponse response, Principal principal) {
		Team play = teamServ.update(pid, team);

		if (play != null) {
			response.setStatus(200);
			return play;

		}
		response.setStatus(500);
		return play;
	}

	@RequestMapping(path = "teams/{pid}", method = RequestMethod.DELETE)
	public void destroy(@PathVariable int pid, HttpServletRequest request, HttpServletResponse response, Principal principal) {
		teamServ.destroy(pid);
		response.setStatus(500);
		try {
		teamServ.show(pid);
		}
		catch(Exception e) {
			response.setStatus(200);
		}
	}

}