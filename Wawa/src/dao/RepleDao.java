package dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Reple;

public class RepleDao {
	
	private SqlSessionFactory sqlSessionFactory;
	private static RepleDao instance;
	public static RepleDao getInstance() {
		// TODO Auto-generated constructor stub
		if(instance == null){
			instance = new RepleDao();
		}
		return instance;
	}
	
	public RepleDao() {
		// TODO Auto-generated constructor stub
		try{
			InputStream is = Resources.getResourceAsStream("configuration.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public boolean insertReple(Reple reple){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.insert("reple.insert", reple);
			if(result > 0){
				session.commit();
				return true;
			}else{
				session.rollback();
				return false;
			}
		}finally{
			session.close();
		}
	}
	
	public boolean updateReple(Reple reple){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.update("reple.update", reple);
			if(result > 0){
				session.commit();
				return true;
			}else {
				session.rollback();
				return false;
			}
		}finally{
			session.close();
		}
	}
	
	public boolean deleteReple(int board_code){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.delete("reple.delete", board_code);
			if(result > 0){
				session.commit();
				return true;
			}else {
				session.rollback();
				return false;
			}
		}finally{
			session.close();
		}
	}
	
	public Reple selectOneReple(String nickname){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectOne("reple.selectOne", nickname);
		}finally{
			session.close();
		}
	}
	
	public List<Reple> selectAllReple(){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("reple.selectAll");
		}finally{
			session.close();
		}
		
	}
	
	public List<Reple> select_by_nickname(){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("reple.select_by_nickname");
		}finally{
			session.close();
		}
	}

}
