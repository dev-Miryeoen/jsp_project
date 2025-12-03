package repository;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.User;
import orm.DatabaseBuilder;

public class UserDAOImpl implements UserDAO {

	private static final Logger log = LoggerFactory.getLogger(UserDAOImpl.class);
	
	private SqlSession sql;
	
	public UserDAOImpl() {
		new DatabaseBuilder();
		sql = DatabaseBuilder.getFactory().openSession();
	}

	@Override
	public int insert(User user) {
		// TODO Auto-generated method stub
		int isOk = sql.insert("userMapper.add", user);
		
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public User getUser(User user) {
		// TODO Auto-generated method stub
		return sql.selectOne("userMapper.login", user);
	}

	@Override
	public int lastLoginUpdate(String id) {
		// TODO Auto-generated method stub
		int isOk = sql.update("userMapper.lastLoginUpdate", id);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		int isOk = sql.update("userMapper.modifyUser", user);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int removeUser(User user) {
		// TODO Auto-generated method stub
		int isOk = sql.delete("userMapper.removeUser", user);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}
}
