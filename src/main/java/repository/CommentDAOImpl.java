package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.Board;
import domain.Comment;
import orm.DatabaseBuilder;

public class CommentDAOImpl implements CommentDAO {
	
	private static final Logger log = LoggerFactory.getLogger(CommentDAOImpl.class);
	
	private SqlSession sql;
	
	public CommentDAOImpl() {
		new DatabaseBuilder();
		sql = DatabaseBuilder.getFactory().openSession();
	}

	@Override
	public int insert(Comment c) {
		// TODO Auto-generated method stub
		int isOk = sql.insert("commentMapper.add", c);
		// insert, update, delete DB 자체의 값이 변경되는 구문
		// 반드시 commit을 해주어야 반영이 됨. => transactionManager 자체 운영
		if(isOk>0) {
			sql.commit();
		}
		
		return isOk;
	}

	@Override
	public List<Comment> getList(int bno) {
		List<Comment> list = sql.selectList("commentMapper.list", bno);
		return list;
	}

	@Override
	public int delete(int cno) {
		// TODO Auto-generated method stub
		int isOk = sql.insert("commentMapper.delete", cno);
		// insert, update, delete DB 자체의 값이 변경되는 구문
		// 반드시 commit을 해주어야 반영이 됨. => transactionManager 자체 운영
		if(isOk>0) {
			sql.commit();
		}
		
		return isOk;
	}

	@Override
	public int update(Comment c) {
		// TODO Auto-generated method stub
		int isOk = sql.insert("commentMapper.update", c);
		// insert, update, delete DB 자체의 값이 변경되는 구문
		// 반드시 commit을 해주어야 반영이 됨. => transactionManager 자체 운영
		if(isOk>0) {
			sql.commit();
		}
		
		return isOk;
	}

}
