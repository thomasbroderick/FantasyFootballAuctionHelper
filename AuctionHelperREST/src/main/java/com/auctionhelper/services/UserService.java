package com.auctionhelper.services;

import java.util.List;

import com.auctionhelper.entities.User;

public interface UserService {
	  public List<User> index();

	  public User show(int uid);

	  public User create(User user);

	  public User update(int uid, User user);

	  public void destroy(int uid);

}
