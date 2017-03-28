package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IPetInfoDao {
	
	public boolean insertPet();
	
	public boolean updatePet();
	
	public boolean deletePet();
	
	public HashMap<String, Object> selectPet();
	
	public List< HashMap<String, Object> > selectAll();
	
	public HashMap<String, Object> selectVaccine();
	

}
