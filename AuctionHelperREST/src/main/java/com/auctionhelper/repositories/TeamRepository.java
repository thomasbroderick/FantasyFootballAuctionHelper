package com.auctionhelper.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.auctionhelper.entities.Team;

public interface TeamRepository extends JpaRepository<Team, Integer> {
	public Team findByName(String name);
}
