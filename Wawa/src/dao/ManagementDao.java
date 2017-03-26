package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Management;

public class ManagementDao {
	private SqlSessionFactory sqlSessionFactory;
	private static ManagementDao instance;
	
	public static ManagementDao getInstance() {
		if(instance == null)
			instance = new ManagementDao();
		return instance;
	}

	private ManagementDao(){
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean insertManagement(Management management){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.insert("management.insert", management);
			if(result > 0){
				session.commit();
				return true;
			}
			else{
				session.rollback();
				return false;
			}
		}
		finally {
			session.close();
		}
	}
	
	public boolean updateManagement(Management management){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.update("management.update", management);
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
	
	public boolean deleteManagement(int management_idx){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.delete("management.delete", management_idx);
			if(result > 0){
				session.commit();
				return true;
			}else {
				session.rollback();
				return false;
			}
		}finally {
			session.close();
		}
	}
	
	public Management selectOneManagement(int management_idx){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectOne("management.selectOne", management_idx);
		}
		finally {
			session.close();
		}
	}
	
	public List<Management> selectListManagement(int code){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("management.selectList", code);
		}
		finally {
			session.close();
		}
	}
	
	
}
