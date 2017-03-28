package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


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
	
	public int insertDog_kind(HashMap<String, Object> params){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.Dog_kindDao.class).insertDog_kind(params);
		}finally{
			session.close();
		}
	}
	
	public int updateDog_kind(HashMap<String, Object> params){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.Dog_kindDao.class).updateDog_kind(params);
		}finally{
			session.close();
		}
	}
	
	public int deleteDog_kind(String kind){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.Dog_kindDao.class).deleteDog_kind(kind);
		}finally{
			session.close();
		}
	}
	
	public HashMap<String, Object> selectOneDog_kind(String nickname){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.Dog_kindDao.class).selectOneDog_kind(nickname);
		}finally{
			session.close();
		}
	}
	
	public List<HashMap<String, Object>> selectAllDog_kind(){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.Dog_kindDao.class).selectAllDog_kind();
		}finally{
			session.close();
		}
		
	}
	
}
