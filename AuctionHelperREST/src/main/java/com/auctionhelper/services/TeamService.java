package com.auctionhelper.services;

import java.util.List;

import com.auctionhelper.entities.Team;

public interface TeamService {
	  public List<Team> index();

	  public Team show(int tid);

	  public Team create(Team Team);

	  public Team update(int tid, Team Team);

	  public void destroy(int tid);

}
