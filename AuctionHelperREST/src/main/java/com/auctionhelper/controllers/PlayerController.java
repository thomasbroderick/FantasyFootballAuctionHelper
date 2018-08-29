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

import com.auctionhelper.entities.Player;
import com.auctionhelper.services.PlayerService;

@RestController
@RequestMapping(path = "api")
@CrossOrigin({ "*", "http://localhost:4200" })
public class PlayerController {
	@Autowired
	private PlayerService playerServ;
	

	@RequestMapping(path = "players/ping", method = RequestMethod.GET)
	public String ping() {
		return "pong";
	}

	@RequestMapping(path = "players", method = RequestMethod.GET)
	public List<Player> index(HttpServletRequest req, HttpServletResponse res, Principal principal) {
		return playerServ.index();
	}

	@RequestMapping(path = "player/{pid}")
	public Player show(HttpServletRequest req, HttpServletResponse res, @PathVariable int pid, Principal principal) {
		return playerServ.show(pid);
	}

	@RequestMapping(path = "players", method = RequestMethod.POST)
	public Player create(@RequestBody Player player, HttpServletRequest request,
			HttpServletResponse response, Principal principal) {
		Player play = playerServ.create(player);

		if (play != null) {
			response.setStatus(200);
			return play;

		}
		response.setStatus(500);
		return play;
	}

	@RequestMapping(path = "players/{pid}", method = RequestMethod.PATCH)
	public Player update(@PathVariable int pid, @RequestBody Player player, HttpServletRequest request,
			HttpServletResponse response, Principal principal) {
		Player play = playerServ.update(pid, player);

		if (play != null) {
			response.setStatus(200);
			return play;

		}
		response.setStatus(500);
		return play;
	}

	@RequestMapping(path = "players/{pid}", method = RequestMethod.DELETE)
	public void destroy(@PathVariable int pid, HttpServletRequest request, HttpServletResponse response, Principal principal) {
		playerServ.destroy(pid);
		response.setStatus(500);
		try {
		playerServ.show(pid);
		}
		catch(Exception e) {
			response.setStatus(200);
		}
	}

}