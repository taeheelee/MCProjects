package dao;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import interface_dao.IDogKindDao;


public class DogKindDao implements IDogKindDao{
	
	private SqlSessionFactory sqlSessionFactory;
	private static DogKindDao instance;
	public static DogKindDao getInstance() {
		// TODO Auto-generated constructor stub
		if(instance == null){
			instance = new DogKindDao();
		}
		return instance;
	}
	
	public DogKindDao() {
		// TODO Auto-generated constructor stub
		try{
			InputStream is = Resources.getResourceAsStream("configuration.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public int insertDog_kind(HashMap<String, Object> params){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.IDogKindDao.class).insertDog_kind(params);
		}finally{
			session.close();
		}
	}
	
	public int updateDog_kind(HashMap<String, Object> params){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.IDogKindDao.class).updateDog_kind(params);
		}finally{
			session.close();
		}
	}
	
	public int deleteDog_kind(String kind){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.IDogKindDao.class).deleteDog_kind(kind);
		}finally{
			session.close();
		}
	}
	
	public HashMap<String, Object> selectOneDog_kind(String kind){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.IDogKindDao.class).selectOneDog_kind(kind);
		}finally{
			session.close();
		}
	}
	
	public List<HashMap<String, Object>> selectAllDog_kind(){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.IDogKindDao.class).selectAllDog_kind();
		}finally{
			session.close();
		}
		
	}
	
}
