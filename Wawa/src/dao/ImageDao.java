package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Image;

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
	
	public boolean insertImage(Image Image){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.insert("Image.insert", Image);
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
	
	public boolean updateImage(Image Image){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.update("Image.update", Image);
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

	public boolean deleteImage(int img_idx){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.delete("Image.delete", img_idx);
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
	
	public Image selectOneImage(int img_idx){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectOne("Image.selectOne", img_idx);
		}finally{
			session.close();
		}
	}
	
	public List<Image> selectAllImage(){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("Image.selectAll");
		}finally{
			session.close();
		}
		
	}

}
