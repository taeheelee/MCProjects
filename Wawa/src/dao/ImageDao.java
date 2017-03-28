package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class ImageDao {
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
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public int insertImage(HashMap<String, Object> params){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.ImageDao.class).insertImage(params);
		}finally{
			session.close();
		}
	}
	
	public int updateImage(HashMap<String, Object> params){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.ImageDao.class).updateImage(params);
		}finally{
			session.close();
		}
	}

	public int deleteImage(int img_idx){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.ImageDao.class).deleteImage(img_idx);
		}finally{
			session.close();
		}
	}
	
	public HashMap<String, Object> selectOneImage(int img_idx){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.ImageDao.class).selectOne(img_idx);
		}finally{
			session.close();
		}
	}
	
	public List<HashMap<String, Object>> selectAllImage(){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.ImageDao.class).selectAll();
		}finally{
			session.close();
		}
		
	}

}
