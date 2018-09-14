package com.auctionhelper.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.auctionhelper.entities.Player;

class PlayerTests {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Player p;
	
	
	@BeforeAll
	public static void setUpAll() throws Exception {
		emf = Persistence.createEntityManagerFactory("AuctionHelper");

	}

	@BeforeEach
	public void setUp() throws Exception {
		em = emf.createEntityManager();
		p = em.find(Player.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		p = null;
	}

	@AfterAll
	public static void tearDownAll() throws Exception {
		emf.close();

	}
	
	@Test
	void test_player_mapping() {
		assertEquals("Tom Brady", p.getPlayerName());
	}

	@Test
	void test_player_mapping_to_team() {
		assertEquals("Free Agents", p.getTeam().getName());
	}
	


	
	

}
