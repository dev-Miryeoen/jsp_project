package service;

import domain.User;

public interface UserService {

	int insert(User user);

	User getUser(User user);

	int lastLoginUpdate(String id);

	int updateUser(User user);

	int removeUser(User user);

}
