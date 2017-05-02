package interface_service;

import java.util.HashMap;

public interface IVaccineInfoService {

	public HashMap<String, Object> selectVaccineInfo(int vaccineCode);
	
}
