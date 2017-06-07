package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
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
import model.MedicalManagement;

@Service
public class MedicalService implements IMedicalService {

	@Autowired
	private IMedicalDao dao;
	@Autowired
	private IVaccineInfoDao vaccineDao;
	@Autowired
	private IPetInfoDao petinfoDao;

//	@Override
//	public boolean insertRealShotDate(HashMap<String, Object> params) {
//		// TODO Auto-generated method stub
//		HashMap<String, Object> realDate = new HashMap<>();
//
//		realDate.put(MedicalManage.IDX, params.get("idx"));
//		realDate.put(MedicalManage.VACCINECODE, params.get("vaccineCode"));
//		realDate.put(MedicalManage.REALSHOTDATE, params.get("realShotDate"));
//		int result = dao.insertRealShotDate(realDate);
//		if (result > 0)
//			return true;
//		else
//			return false;
//	}
//
//	@Override
//	public boolean updateRealShotDate(HashMap<String, Object> params) {
//		// TODO Auto-generated method stub
//		HashMap<String, Object> realDate = new HashMap<>();
//
//		realDate.put(MedicalManage.IDX, params.get("idx"));
//		realDate.put(MedicalManage.VACCINECODE, params.get("vaccineCode"));
//		realDate.put(MedicalManage.REALSHOTDATE, params.get("realShotDate"));
//		int result = dao.updateRealShotDate(realDate);
//		if (result > 0)
//			return true;
//		else
//			return false;
//	}
//
//	@Override
//	public boolean deleteRealShotDate(HashMap<String, Object> params) {
//		// TODO Auto-generated method stub
//		HashMap<String, Object> params2 = new HashMap<>();
//
//		params2.put(MedicalManage.IDX, params.get("idx"));
//		params2.put(MedicalManage.VACCINECODE, params.get("vaccineCode"));
//		int result = dao.deleteRealShotDate(params2);
//		if (result > 0)
//			return true;
//		else
//			return false;
//	}
//
//	@Override
//	public HashMap<String, Object> selectRealShotDate(HashMap<String, Object> params) {
//		// TODO Auto-generated method stub
//		HashMap<String, Object> params2 = new HashMap<>();
//
//		params2.put(MedicalManage.IDX, params.get("idx"));
//		params2.put(MedicalManage.VACCINECODE, params.get("vaccineCode"));
//		HashMap<String, Object> result = dao.selectRealShotDate(params2);
//
//		return result;
//	}
//
//	@Override
//	public HashMap<String, Object> selectDueShotDate(HashMap<String, Object> params) {
//		// TODO Auto-generated method stub
//		HashMap<String, Object> result = dao.selectRealShotDate(params);
//		Date realDate = (Date) result.get("realShotDate");
//		int vaccineCode = (int) result.get("vaccineCode");
//
//		HashMap<String, Object> result2 = vaccineDao.selectOne(vaccineCode);
//
//		int period = (int) result2.get("vaccinePeriod");
//
//		// System.out.println(period);
//		// realDate(실제접종일)을 기준으로 plusDate(추천접종일수)을 더함
//		Calendar cal = new GregorianCalendar(Locale.KOREA);
//		cal.setTime(realDate);
//		cal.add(Calendar.DAY_OF_YEAR, period); // 주기를 더한다.
//
//		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
//		String strDate = fm.format(cal.getTime());
//
//		HashMap<String, Object> date = new HashMap<>();
//		date.put("dueShotDate", strDate);
//
//		return date;
//	}
//
//	@Override
//	public List<HashMap<String, Object>> selectAllShotDate(int idx) {
//		// TODO Auto-generated method stub
//		return dao.selectAllShotDate(idx);
//	}
//
//	@Override
//	public HashMap<String, Object> selectDate(HashMap<String, Object> params) {
//		// TODO Auto-generated method stub
//		return dao.selectDate(params);
//	}
//
//	@Override
//	public HashMap<String, Object> selectVc(HashMap<String, Object> params) {
//		// TODO Auto-generated method stub
//		return dao.selectVc(params);
//	}
//
//	@Override
//	public HashMap<String, Object> calcDday(HashMap<String, Object> params) {
//		// TODO Auto-generated method stub
//
//		int idx = Integer.parseInt((String) params.get("idx"));
//		List<HashMap<String, Object>> list = dao.selectShotdayByDate(idx);
//
//		System.out.println("!!!인덱스는: " + idx);
//
//		HashMap<String, Object> recent = list.get(list.size() - 1);
//		Date realShotDate = (Date) recent.get("realShotDate"); // 실제날짜
//		int vaccineCode = (int) recent.get("vaccineCode"); // 백신코드
//
//		System.out.println("실제접종일은: " + realShotDate);
//		System.out.println("백신코드는: " + vaccineCode);
//
//		HashMap<String, Object> nextday = selectDueShotDate(recent); // 실제접종일과
//																		// period
//																		// 더한 날짜
//		String next = (String) nextday.get("dueShotDate");
//		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Date to = null;
//		try {
//			to = transFormat.parse(next);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		Date today = new Date(); // 오늘날짜
//
//		System.out.println("접종날짜는: " + to);
//		System.out.println("오늘날짜는: " + today);
//
//		long diff = to.getTime() - today.getTime();
//		long diffDays = diff / (24 * 60 * 60 * 1000);
//
//		System.out.println("디데이는" + diffDays);
//
//		HashMap<String, Object> info = new HashMap<>();
//		info.put("dDay", diffDays);
//		info.put("vaccineCode", vaccineCode);
//		return info;
//	}
//
//	@Override
//	public List<HashMap<String, Object>> selectShotdayByDate(int idx) {
//		// TODO Auto-generated method stub
//		return dao.selectShotdayByDate(idx);
//	}

	////////////////////////////////////////////////////////////

	@Override
	public boolean insertMedicalcare(HashMap<String, Object> params) {
		// TODO Auto-generated method stub

		HashMap<String, Object> temp = new HashMap<>();
		temp.put(Constant.MedicalManagement.PETIDX, params.get("petIdx"));
		temp.put(Constant.MedicalManagement.VACCINECODE, params.get("vaccineCode"));
		temp.put(Constant.MedicalManagement.VACCINETYPE, params.get("vaccineType"));
		temp.put(Constant.MedicalManagement.DEGREE, params.get("degree"));
		temp.put(Constant.MedicalManagement.REALSHOTDATE, params.get("realShotDate"));

		String vaccineType = (String) params.get("vaccineType");

		int degree = Integer.parseInt((String) params.get("degree"));
		int vaccineCode = Integer.parseInt((String) params.get("vaccineCode"));

		String realShotString = (String) params.get("realShotDate");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date realShotDate;
		try {
			realShotDate = transFormat.parse(realShotString);
			if (vaccineType.equals("추가") || degree == 5 || (vaccineCode == 2 && degree == 2)
					|| (vaccineCode == 3 && degree == 2) || vaccineCode == 4) {
				// SimpleDateFormat transFormat = new
				// SimpleDateFormat("yyyy-MM-dd");
				// 특정날짜에에 날짜(일수) 더하기
				Calendar cal = Calendar.getInstance();
				cal.setTime(realShotDate);
				cal.add(Calendar.DATE, 365);
				Date when = new Date(cal.getTimeInMillis());
				// String nextDate = transFormat.format(when);
				temp.put(Constant.MedicalManagement.NEXTSCHEDULES, when);
				temp.put(Constant.MedicalManagement.NEXTDATE, when);
			} else {

				temp.put(Constant.MedicalManagement.NEXTSCHEDULES, null);

				Calendar cal = Calendar.getInstance();
				cal.setTime(realShotDate);
				cal.add(Calendar.DATE, 14);
				Date when = new Date(cal.getTimeInMillis());
				temp.put(Constant.MedicalManagement.NEXTDATE, when);

			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int result = dao.insertMedicalcare(temp);

		if (result > 0)
			return true;
		else
			return false;
	}

	// @Override
	// public boolean updateMedicalcare(int petIdx, int vaccineCode, String
	// vaccineType, int degree, Date realShotDate) {
	// // TODO Auto-generated method stub
	//
	// HashMap<String, Object> params = new HashMap<>();
	// params.put(Constant.MedicalManagement.PETIDX, petIdx);
	// params.put(Constant.MedicalManagement.VACCINECODE, vaccineCode);
	// params.put(Constant.MedicalManagement.VACCINETYPE, vaccineType);
	// params.put(Constant.MedicalManagement.DEGREE, degree);
	// params.put(Constant.MedicalManagement.REALSHOTDATE, realShotDate);
	//
	// int result = dao.updateMedicalcare(params);
	//
	// if (result > 0)
	// return true;
	// else
	// return false;
	// }

	@Override
	public boolean deleteMedicalcare(int idx) {
		// TODO Auto-generated method stub
		int result = dao.deleteMedicalcare(idx);

		if (result > 0)
			return true;
		else
			return false;
	}

	// @Override
	// public HashMap<String, Object> selectOne(int idx) {
	// // TODO Auto-generated method stub
	// return null;
	// }

	@Override
	public List<HashMap<String, Object>> selectPetMedicalcare(int petIdx) {
		// TODO Auto-generated method stub

		return dao.selectPetMedicalcare(petIdx);
	}

	@Override
	public List<HashMap<String, Object>> selectAdditionalVaccine(int petIdx, int vaccineCode, int degree) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put("petIdx", petIdx);
		params.put("vaccineCode", vaccineCode);
		params.put("degree", degree);
		return dao.selectAdditionalVaccine(params);
	}

	@Override
	public List<HashMap<String, Object>> selectNextSchedules(int petIdx, int vaccineCode) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put("petIdx", petIdx);
		params.put("vaccineCode", vaccineCode);
		return dao.selectNextSchedules(params);
	}

	@Override
	public HashMap<String, Object> selectLastSchedules(int petIdx, int vaccineCode) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put("petIdx", petIdx);
		params.put("vaccineCode", vaccineCode);
		return dao.selectLastSchedules(params);
	}

	@Override
	public HashMap<String, Object> selectVaccine(int petIdx) {
		List<HashMap<String, Object>> petVaccineRecord = dao.selectVaccine(petIdx);

		HashMap<String, Object> vRecord = new HashMap<>();

		for (int i = 0; i < petVaccineRecord.size(); i++) {

			if (petVaccineRecord.get(i).get("vaccineType").equals("기초")) {

				int degree = (int) petVaccineRecord.get(i).get("degree");
				Date realShotDate = (Date) petVaccineRecord.get(i).get("realShotDate");
				int vaccineCode = (int) petVaccineRecord.get(i).get("vaccineCode");
				int idx = (int) petVaccineRecord.get(i).get("idx");
				String key = "v" + vaccineCode + "0" + degree;
				String key2 = "v" + vaccineCode + "0" + degree + "idx";
				// System.out.println("KEY : "+key);
				vRecord.put(key, realShotDate);
				vRecord.put(key2, idx);

			}
		}

		return vRecord;
	}

	@Override
	public HashMap<String, Object> calculateNextSchedules(int petIdx) {// 기초접종
																		// 예정일
																		// 계산하기
		HashMap<String, Object> petinfo = petinfoDao.selectOne(petIdx);
		Date birthday = (Date) petinfo.get("birthday");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		HashMap<String, Object> nextSchedules = new HashMap<>();

		int[] firstVaccineAge = { 42, 42, 70, 98 };// 종합백신 42 코로나 42 켄넬코프 70 광견병
													// 98

		for (int i = 1; i < 5; i++) {
			// 특정날짜에에 날짜(일수) 더하기
			Calendar cal = Calendar.getInstance();
			cal.setTime(birthday);
			cal.add(Calendar.DATE, firstVaccineAge[i - 1]);
			Date when = new Date(cal.getTimeInMillis());
			String nextDate = transFormat.format(when);
			String key = "d" + i + "01";
			nextSchedules.put(key, nextDate);
		}

		HashMap<String, Object> temp = selectVaccine(petIdx);

		for (int i = 1; i < 5; i++) {
			for (int j = 1; j < 5; j++) {
				String code = "v" + i + "0" + j;
				Date realshotDate = (Date) temp.get(code);
				if (realshotDate != null) {
					// 특정날짜에에 날짜(일수) 더하기
					Calendar cal = Calendar.getInstance();
					cal.setTime(realshotDate);
					cal.add(Calendar.DATE, 14);
					Date when = new Date(cal.getTimeInMillis());
					String nextDate = transFormat.format(when);
					String key = "d" + i + "0" + (j + 1);
					nextSchedules.put(key, nextDate);

				} else {
					String key = "d" + i + "0" + (j + 1);
					nextSchedules.put(key, "");
				}
			}
		}

		return nextSchedules;
	}

	@Override
	public HashMap<String, Object> calculateNextSchedulesAdditional(int petIdx) {
		HashMap<String, Object> petinfo = petinfoDao.selectOne(petIdx);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		HashMap<String, Object> nextSchedulesAdditional = new HashMap<>();

		return null;
	}

	@Override
	public HashMap<String, Object> DDay(int petIdx) {

		HashMap<String, Object> DDay = new HashMap<>();

		for (int i = 1; i < 5; i++) {
			HashMap<String, Object> params = new HashMap<>();
			params.put("petIdx", petIdx);
			params.put("vaccineCode", i);
			HashMap<String, Object> eachOfDDay = dao.selectLastSchedulesOfAll(params);

			String d_dayString = "";
			if (eachOfDDay != null) {

				Date lastPang = (Date) eachOfDDay.get("lastPang");

				Date today = new Date();

				long d_day = (lastPang.getTime() - today.getTime()) / (24 * 60 * 60 * 1000);
				int d_dayInt = (int) d_day;

				d_dayString = "다음 접종 : D-" + String.valueOf(d_day);

				if (d_dayInt == 0) {
					d_dayString = "D-DAY";
				} else if (d_dayInt < 0) {
					d_dayString = "D-DAY가 지났습니다";
				}

			} else {
				d_dayString = "";
			}

			DDay.put("abc" + i, d_dayString);
		}

//		System.out.println("d-day 얍 : " + DDay);

		return DDay;

	}

	@Override
	public HashMap<String, Object> DDayForHeader(int petIdx) {

		HashMap<String, Integer> DDay = new HashMap<>();

		for (int i = 1; i < 5; i++) {
			HashMap<String, Object> params = new HashMap<>();
			params.put("petIdx", petIdx);
			params.put("vaccineCode", i);
			HashMap<String, Object> eachOfDDay = dao.selectLastSchedulesOfAll(params);

			// String d_dayString ="";
			if (eachOfDDay != null) {

				Date lastPang = (Date) eachOfDDay.get("lastPang");

				Date today = new Date();

				long d_day = (lastPang.getTime() - today.getTime()) / (24 * 60 * 60 * 1000);
				int d_dayInt = (int) d_day;

				// d_dayString = "다음 접종 : D-" + String.valueOf(d_day);

				String vaccineName = "";
				if (i == 1) {
					vaccineName = "종합백신";
				} else if (i == 2) {
					vaccineName = "코로나";
				} else if (i == 3) {
					vaccineName = "켄넬코프";
				} else if (i == 4) {
					vaccineName = "광견병";
				}

				DDay.put(vaccineName, d_dayInt);

			} // end if

		}
		Collection<Integer> values = DDay.values();// value값들 넣기

//		System.out.println("d-day for header 얍 : " + DDay);
		int minDDay = Collections.min(values);// 최소값
		
		
		String vName = "";
		int count = 0;
		for (String s : DDay.keySet()) {
			if (DDay.get(s).equals(minDDay)) {
				vName = "["+s+"] ";
				count ++;
			}
		}
		if(count ==2){
			vName = vName+" 외1 ";
		}else if( count ==3){
			vName = vName+" 외2 ";
		}else if( count ==4){
			vName = vName+" 외3 ";
		}
		
		
		
		String minDDayString ="";
		
		if(minDDay<0){
			minDDay = minDDay*-1;
			minDDayString = "D +"+minDDay;
		}else if(minDDay==0){
			minDDayString = "D-day!";
		}else if (minDDay>0) {
			minDDayString = "D -"+minDDay;
		}else {
			System.out.println("NULL일수 있지");
		}
//		
//		System.out.println("minDDay : "+minDDay);
//
//		System.out.println("vName : "+vName);


		HashMap<String, Object> temp = new HashMap<>();

		temp.put("vName", vName);
		temp.put("minDDayString", minDDayString);

		return temp;
	}
}
