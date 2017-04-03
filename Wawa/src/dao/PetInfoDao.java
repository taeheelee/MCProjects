package dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import interface_dao.IPetInfoDao;

public class PetInfoDao implements IPetInfoDao{
	
	private SqlSessionFactory sqlsessionfactory;
	public PetInfoDao() {
		// TODO Auto-generated constructor stub
		InputStream is = null;
		try{
			is = Resources.getResourceAsStream("configuration.xml");
			sqlsessionfactory = new SqlSessionFactoryBuilder().build(is);			
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	@Override
	public int insertPetInfo(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updatePetInfo(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deletePetInfo(int img_idx) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public HashMap<String, Object> selectOne(int idx) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<HashMap<String, Object>> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public HashMap<String, Object> selectVaccine() {
		// TODO Auto-generated method stub
		return null;
	}



	

}
