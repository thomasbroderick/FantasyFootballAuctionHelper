package com.auctionhelper.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.auctionhelper.entities.Player;

public interface PlayerRepository extends JpaRepository<Player, Integer> {
	public List<Player> findByTeam_Id(int id);
	public List<Player> findByPosition(String position);
}
