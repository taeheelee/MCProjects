package dao;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import interface_dao.IImageDao;


public class ImageDao implements IImageDao{
	private SqlSessionFactory sqlSessionFactory;
	private static ImageDao instance;
	public static ImageDao getInstance() {
		// TODO Auto-generated constructor stub
		if(instance == null){
			instance = new ImageDao();
		}
		return instance;
	}
	
	public ImageDao() {
		// TODO Auto-generated constructor stub
		try{
			InputStream is = Resources.getResourceAsStream("configuration.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public int insertImage(HashMap<String, Object> params){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.IImageDao.class).insertImage(params);
		}finally{
			session.close();
		}
	}
	
	public int updateImage(HashMap<String, Object> params){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.IImageDao.class).updateImage(params);
		}finally{
			session.close();
		}
	}

	public int deleteImage(int imgIdx){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.IImageDao.class).deleteImage(imgIdx);
		}finally{
			session.close();
		}
	}
	
	public HashMap<String, Object> selectOneImage(int imgIdx){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.IImageDao.class).selectOneImage(imgIdx);
		}finally{
			session.close();
		}
	}
	
	public List<HashMap<String, Object>> selectAllImage(){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.IImageDao.class).selectAllImage();
		}finally{
			session.close();
		}
		
	}

}
