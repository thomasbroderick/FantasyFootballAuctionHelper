package com.auctionhelper.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auctionhelper.entities.Team;
import com.auctionhelper.repositories.TeamRepository;
@Service
public class TeamServiceImpl implements TeamService {
	

	@Autowired
	private TeamRepository teamRepo;


	public List<Team> index() {
		return teamRepo.findAll();
	}

	@Override
	public Team show(int uid) {
		return teamRepo.findById(uid).get();
	}

	@Override
	public Team create(Team team) {
		return teamRepo.saveAndFlush(team);
	}

	@Override
	public Team update(int uid, Team team) {
		team.setId(uid);
		return teamRepo.saveAndFlush(team);
	}

	@Override
	public void destroy(int uid) {
		teamRepo.deleteById(uid);
	}

}
