package com.auctionhelper.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auctionhelper.entities.Player;
import com.auctionhelper.repositories.PlayerRepository;
@Service
public class PlayerServiceImpl implements PlayerService {
	
	@Autowired
	private PlayerRepository playerRepo;
	

	@Override
	public List<Player> index() {
		return playerRepo.findAll();
	}

	@Override
	public Player show(int pid) {
		return playerRepo.findById(pid).get();
	}

	@Override
	public Player create(Player player) {
		return playerRepo.saveAndFlush(player);
	}

	@Override
	public Player update(int pid, Player player) {
		player.setId(pid);
		return playerRepo.saveAndFlush(player);
	}

	@Override
	public void destroy(int pid) {
		playerRepo.deleteById(pid);
	}

	@Override
	public List<Player> showByTeam(int tid) {
		return playerRepo.findByTeam_Id(tid);
	}

	@Override
	public List<Player> showByPosition(String position) {
		return playerRepo.findByPosition(position);
	}

}
