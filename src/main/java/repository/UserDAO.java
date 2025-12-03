package repository;

import domain.User;

public interface UserDAO {

	int insert(User user);

	User getUser(User user);

	int lastLoginUpdate(String id);

	int updateUser(User user);

	int removeUser(User user);

}
