package interface_dao;

import java.util.HashMap;
import java.util.List;

public interface IVaccineInfoDao {
	public int insertVaccine(HashMap<String, Object> params);
	public int updateVaccine(HashMap<String, Object> params);
	public int deleteVaccine(int vaccineCode);
	public HashMap<String, Object> selectOne(int vaccineCode);
	public List<HashMap<String, Object>> selectAll();
}
