package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Dog_kind;

public class Dog_kindDao {
	
	private SqlSessionFactory sqlSessionFactory;
	private static Dog_kindDao instance;
	public static Dog_kindDao getInstance() {
		// TODO Auto-generated constructor stub
		if(instance == null){
			instance = new Dog_kindDao();
		}
		return instance;
	}
	
	public Dog_kindDao() {
		// TODO Auto-generated constructor stub
		try{
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public boolean insertDog_kind(Dog_kind Dog_kind){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.insert("Dog_kind.insert", Dog_kind);
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
	
	public boolean updateDog_kind(Dog_kind Dog_kind){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.update("Dog_kind.update", Dog_kind);
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
	
	public boolean deleteDog_kind(String kind){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.delete("Dog_kind.delete", kind);
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
	
	public Dog_kind selectOneDog_kind(String nickname){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectOne("Dog_kind.selectOne", nickname);
		}finally{
			session.close();
		}
	}
	
	public List<Dog_kind> selectAllDog_kind(){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("Dog_kind.selectAll");
		}finally{
			session.close();
		}
		
	}
	
}
