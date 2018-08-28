package com.auctionhelper.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.auctionhelper.entities.User;
import com.auctionhelper.repositories.UserRepository;
@Service
public class UserServiceImpl implements UserService {
	

	@Autowired
	private UserRepository userRepo;


	public List<User> index() {
		return userRepo.findAll();
	}

	@Override
	public User show(int uid) {
		return userRepo.findById(uid).get();
	}

	@Override
	public User create(User user) {
		return userRepo.saveAndFlush(user);
	}

	@Override
	public User update(int uid, User user) {
		user.setId(uid);
		return userRepo.saveAndFlush(user);
	}

	@Override
	public void destroy(int uid) {
		userRepo.deleteById(uid);
	}

}
