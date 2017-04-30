package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import commons.Constant.MedicalManage;
import interface_dao.IMedicalDao;
import interface_dao.IPetInfoDao;
import interface_dao.IVaccineInfoDao;
import interface_service.IMedicalService;

@Service
public class MedicalService implements IMedicalService {

	@Autowired
	private IMedicalDao dao;
	@Autowired
	private IVaccineInfoDao vaccineDao;

	@Override
	public boolean insertRealShotDate(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		HashMap<String, Object> realDate = new HashMap<>();

		realDate.put(MedicalManage.IDX, params.get("idx"));
		realDate.put(MedicalManage.VACCINECODE, params.get("vaccineCode"));
		realDate.put(MedicalManage.REALSHOTDATE, params.get("realShotDate"));
		int result = dao.insertRealShotDate(realDate);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateRealShotDate(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		HashMap<String, Object> realDate = new HashMap<>();
		
		realDate.put(MedicalManage.IDX, params.get("idx"));
		realDate.put(MedicalManage.VACCINECODE, params.get("vaccineCode"));
		realDate.put(MedicalManage.REALSHOTDATE, params.get("realShotDate"));
		int result = dao.updateRealShotDate(realDate);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteRealShotDate(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params2 = new HashMap<>();
	
		params2.put(MedicalManage.IDX, params.get("idx"));
		params2.put(MedicalManage.VACCINECODE, params.get("vaccineCode"));
		int result = dao.deleteRealShotDate(params2);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public HashMap<String, Object> selectRealShotDate(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params2 = new HashMap<>();
		
		params2.put(MedicalManage.IDX, params.get("idx"));
		params2.put(MedicalManage.VACCINECODE, params.get("vaccineCode"));
		HashMap<String, Object> result = dao.selectRealShotDate(params2);
		
		return result;
	}
	@Override
	public HashMap<String, Object> selectDueShotDate(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		HashMap<String, Object> result = dao.selectRealShotDate(params);
		Date realDate = (Date) result.get("realShotDate");
		int vaccineCode =  (int)result.get("vaccineCode");
		
		HashMap<String, Object> result2 = vaccineDao.selectOne(vaccineCode);
		
		int period = (int) result2.get("vaccinePeriod");
		
//		System.out.println(period);
		// realDate(실제접종일)을 기준으로 plusDate(추천접종일수)을 더함
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(realDate);
		cal.add(Calendar.DAY_OF_YEAR, period); // 주기를 더한다.
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = fm.format(cal.getTime());
		
		HashMap<String, Object> date = new HashMap<>(); 
		date.put("dueShotDate", strDate);
		
		return date;
	}

}
