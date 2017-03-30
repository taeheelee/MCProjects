package dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import interface_dao.IUserInfoDao;

public class UserInfoDao implements IUserInfoDao{
	private SqlSessionFactory sqlSessionFactory;
	private static UserInfoDao instance;
	
	public static UserInfoDao getInstance() {
		if(instance == null)
			instance = new UserInfoDao();
		return instance;
	}
	
	public UserInfoDao(){
		InputStream is = null;
		try {
			is = Resources.getResourceAsStream("configuration.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public int insertUserInfo(HashMap<String, Object> params){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.insert("interface_dao.IUserInfoDao.insertUserInfo", params);
		}
		finally {
			session.close();
		}
	}
	
	public int updateUserInfo(HashMap<String, Object> params){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.update("interface_dao.IUserInfoDao.updateUserInfo", params);
		}
		finally {
			session.close();
		}
	}
	
	public int deleteUserInfo(String id){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.delete("interface_dao.IUserInfoDao.deleteUserInfo", id);
		}
		finally {
			session.close();
		}
	}
	
	//사용자 ID로 해당 사용자 정보 받아오기
	public HashMap<String, Object> selectOneUserInfo(String id){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectOne("interface_dao.IUserInfoDao.selectOneUserInfo", id);
		}
		finally {
			session.close();
		}
	}
	
	public List<HashMap<String, Object>> selectAllUserInfo() {
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("interface_dao.IUserInfoDao.selectAllUserInfo");
		}
		finally {
			session.close();
		}
	}
}
