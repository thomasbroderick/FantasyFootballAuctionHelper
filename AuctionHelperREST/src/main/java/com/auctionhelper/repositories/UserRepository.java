package com.auctionhelper.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.auctionhelper.entities.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	
	public User findOneByUsername(String username);
		

}