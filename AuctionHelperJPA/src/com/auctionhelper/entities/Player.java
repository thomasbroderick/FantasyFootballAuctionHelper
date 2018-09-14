package com.auctionhelper.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Player {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "player_name")
	private String playerName;
	@ManyToOne
	@JoinColumn(name = "team_id")
	private Team team;
	private String position;
	@Column(name = "expected_points")
	private double expectedPoints;
	private int salary;
	@Column(name = "dollar_value")
	private int dollarValue;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	public Team getTeam() {
		return team;
	}

	public void setTeam(Team team) {
		this.team = team;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public double getExpectedPoints() {
		return expectedPoints;
	}

	public void setExpectedPoints(double expectedPoints) {
		this.expectedPoints = expectedPoints;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getDollarValue() {
		return dollarValue;
	}

	public void setDollarValue(int dollarValue) {
		this.dollarValue = dollarValue;
	}

}