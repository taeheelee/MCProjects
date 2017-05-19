package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import commons.Constant;
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

	@Override
	public List<HashMap<String, Object>> selectAllShotDate(int idx) {
		// TODO Auto-generated method stub
		return dao.selectAllShotDate(idx);
	}

	@Override
	public HashMap<String, Object> selectDate(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.selectDate(params);
	}

	@Override
	public HashMap<String, Object> selectVc(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.selectVc(params);
	}

	@Override
	public HashMap<String, Object> calcDday(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int idx = Integer.parseInt((String) params.get("idx"));
		int vGubun = Integer.parseInt((String) params.get("vGubun"));
		List<HashMap<String, Object>> list = selectAllShotDate(idx);
		
		System.out.println("인덱스는: " + idx);
		System.out.println("구분자는: " + vGubun);
		
		HashMap<String, Object> recent = list.get(list.size()-1);
		Date realShotDate = (Date) recent.get("realShotDate"); //실제날짜
		int vaccineCode = (int) recent.get("vaccineCode"); // 백신코드
		
		System.out.println("실제접종일은: " + realShotDate);
		System.out.println("백신코드는: " + vaccineCode);
		
		HashMap<String, Object> nextday = selectDueShotDate(recent); // 실제접종일과 period 더한 날짜
		String next = (String) nextday.get("dueShotDate");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = null;
		try {
			to = transFormat.parse(next);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Date today = new Date(); // 오늘날짜
		
		System.out.println("접종날짜는: " + to);
		System.out.println("오늘날짜는: " + today);
		
		long diff = to.getTime() - today.getTime();
		long diffDays = diff / (24 * 60 * 60 * 1000);
		
		System.out.println("디데이는" + diffDays); 
		
		HashMap<String, Object> day = new HashMap<>();
		day.put("dDay", diffDays);
		return day;
	}

	@Override
	public List<HashMap<String, Object>> selectShotdayByDate(int idx) {
		// TODO Auto-generated method stub
		return dao.selectShotdayByDate(idx);
	}

}
