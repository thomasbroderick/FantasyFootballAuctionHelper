package com.auctionhelper.services;

import java.util.List;

import com.auctionhelper.entities.Player;

public interface PlayerService {
	  public List<Player> index();

	  public Player show(int pid);
	  
	  public List<Player> showByTeam(int tid);
	  
	  public List<Player> showByPosition(String position);

	  public Player create(Player player);

	  public Player update(int pid, Player player);

	  public void destroy(int pid);
}
