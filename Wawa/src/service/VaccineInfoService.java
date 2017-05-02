package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import interface_dao.IVaccineInfoDao;
import interface_service.IVaccineInfoService;

@Service
public class VaccineInfoService implements IVaccineInfoService{

	@Autowired
	IVaccineInfoDao dao;
	
	@Override
	public HashMap<String, Object> selectVaccineInfo(int vaccineCode) {
		// TODO Auto-generated method stub
		return dao.selectOne(vaccineCode);
	}
	
}
