package com.auctionhelper.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Team {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String owner;
	private int budget;
	@JsonIgnore
	@OneToMany(mappedBy = "team")
	private List<Player> players;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public int getBudget() {
		return budget;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

	public List<Player> getPlayers() {
		return players;
	}

	public void setPlayers(List<Player> players) {
		this.players = players;
	}

	public void addplayer(Player player) {
		if (players == null)
			players = new ArrayList<>();

		if (!players.contains(player)) {
			players.add(player);
			if (player.getTeam() != null) {
				player.getTeam().getPlayers().remove(player);

			}
			player.setTeam(this);
		}
	}

	public void removeplayer(Player player) {
		player.setTeam(null);
		if (players != null) {
			players.remove(player);
		}
	}
}
