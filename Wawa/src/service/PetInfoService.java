package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import commons.Constant;
import interface_dao.IDogKindDao;
import interface_dao.IMedicalDao;
import interface_dao.IPetInfoDao;
import interface_service.IPetinfoService;

@Component
public class PetInfoService implements IPetinfoService {
	
	@Autowired
	IPetInfoDao dao;
	
	@Autowired
	IMedicalDao mDao;
	
	@Autowired
	IDogKindDao kDao;
	
	@Override
	public boolean insertPetInfo(int idx, String resist, String id, String name, String kind, Date birthday, String neutral,
			double weight, String sex, Date groomingStart, String groomingPeriod) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.PetInfo.RESIST, resist);
		params.put(Constant.PetInfo.ID, id);
		params.put(Constant.PetInfo.NAME, name);
		params.put(Constant.PetInfo.KIND, kind);
		params.put(Constant.PetInfo.BIRTHDAY, birthday);
		params.put(Constant.PetInfo.NEUTRAL, neutral);
		params.put(Constant.PetInfo.WEIGHT, weight);
		params.put(Constant.PetInfo.SEX, sex);
		params.put(Constant.PetInfo.GROOMINGSTART, groomingStart);
		int gp = Integer.parseInt(groomingPeriod);
		params.put(Constant.PetInfo.GROOMINGPERIOD, gp);
		
		int result = dao.insertPetInfo(params);
		HashMap<String, Object> pet = dao.selectByName(params);
		int petIdx = (int)pet.get("idx");
		int arr[] = {101, 102, 103, 104, 105, 201, 202, 203, 204, 205, 301, 302, 303, 304, 305, 401, 402, 403, 404, 405};
		String defaultDate = "0000-00-00";
		for(int i = 0; i < arr.length; i ++){
			HashMap<String, Object> tmp = new HashMap<>();
			tmp.put("idx", petIdx);
			tmp.put("vaccineCode", arr[i]);
			tmp.put("realShotDate", defaultDate);
			mDao.insertRealShotDate(tmp);
		}
	
		if(result > 0)
			return true;
		else
			return false;
	}

	
	
	@Override
	public boolean updatePetInfo(int idx, String resist, String id, String name, String kind, Date birthday, String neutral,
			double weight, String sex, Date groomingStart, int groomingPeriod) {
		// TODO Auto-generated method stub
		//수정할 강아지 목록을 받아와서 출력해주고
		HashMap<String, Object> tmp = dao.selectOne(idx);
		//변경사항은 변경되면 새로운 params에 받고  변경되지 않은 내용들은 SelectOne의 내용 그대로
		HashMap<String, Object> params = new HashMap<>();
		
		params.put(Constant.PetInfo.RESIST, resist);
		params.put(Constant.PetInfo.ID, id);
		params.put(Constant.PetInfo.NAME, name);
		params.put(Constant.PetInfo.KIND, kind);
		params.put(Constant.PetInfo.BIRTHDAY, birthday);
		params.put(Constant.PetInfo.NEUTRAL, neutral);
		params.put(Constant.PetInfo.WEIGHT, weight);
		params.put(Constant.PetInfo.SEX, sex);
		params.put(Constant.PetInfo.GROOMINGSTART, groomingStart);
		params.put(Constant.PetInfo.GROOMINGPERIOD, groomingPeriod);
		
		int result = dao.updatePetInfo(params);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deletePetInfo(int idx) {
		// TODO Auto-generated method stub
		int result = dao.deletePetInfo(idx);
		if(result > 0)
			return true;
		else
			return false;
	}
	@Override
	public List<HashMap<String, Object>> selectPetList(String id) {
		// TODO Auto-generated method stub
		return dao.selectPetList(id);
	}

	@Override
	public HashMap<String, Object> selectOne(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.selectByName(params);
	}

	@Override
	public HashMap<String, Object> selectByname(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return dao.selectByName(params);
	}

	// 나이 계산하는 함수
	@Override
	public HashMap<String, Object> getAge(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		// 아이디, 펫 이름 받아서 일단 펫정보받기
		
		String birthday = (String) params.get("birthday");

		String from = birthday;
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = null;
		try {
			to = transFormat.parse(from);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Date today = new Date();
		
		long diff = Math.abs(to.getTime() - today.getTime());
		long diffDays = diff / (24 * 60 * 60 * 1000);
		
		int year = (int) diffDays/365;
//		long month = (int) diffDays%365/30;
		int month = (int)(diffDays- year*365) /12;
		
		HashMap<String, Object> date = new HashMap<>();
		date.put("year", year);
		date.put("month", month);
		
		System.out.println("TESTTESTTESTTESTTEST");
		
	    //품종도 여기서 못하나?
	      //일단 해당 강아지의 견종을 받아와

		
		String petIdxString = (String) params.get("petIdx");
		int petIdx = Integer.parseInt(petIdxString);
		
		HashMap<String, Object> temp = dao.selectOne(petIdx);
		String petKind = (String) temp.get("kind");
//	    System.out.println("TEST KIND : " + temp.get("kind"));
		System.out.println("222222222TESTTESTTESTTESTTEST");
	      
	      //이게 소형견인지 중형견인지 대형견인지 DB에서 찾아서 받아와
		HashMap<String, Object> sizeTemp = kDao.selectOneDogKind(petKind);
		String dogSize = (String)sizeTemp.get("dogSize");
//		System.out.println("DOG SIZE : "+dogSize);
		
		
//	      HashMap<String, Object> selectOneDogKind = kDao.selectOneDogKind(petKind);
//	    
//	      System.out.println("selectOneDogKind : "+selectOneDogKind);
//	      
//	      String dogSize = (String)selectOneDogKind.get("dogSize");
//	      System.out.println("DOGSIZE : "+dogSize);
	      //그다음에 나이를 대입해서 사람나이로 환산을 해준다
	      int transperAge;
	      
	      if (diffDays <= 730) // 2년(=730일) 전일 때
	         if (diffDays <= 61) { // 2개월 이전
	            // 한달에 1살 나이먹음(하루에 1/30.5살 나이먹음)
	            transperAge = (int) (diffDays * (1 / 30.5));
	         } else if (diffDays > 61 && diffDays <= 183) {// 2개월~6개월 일 때
	            // 한달에 2살 나이먹음(하루에 2/30.5살 나이먹음)
	            transperAge = 2 + (int) ((diffDays - 61) * (2 / 30.5));
	         } else if (diffDays > 183 && diffDays <= 365) { // 6~12개월일 때
	            // 한달에 1살 나이먹음(하루에 1/30.5살 나이먹음)
	            transperAge = 10 + (int) ((diffDays - 183) * (1 / 30.5));
	         } else { // 1년~2년 일 때(countDay2>365)
	            // 1달에 0.666666667살 나이먹음 (4/6) (하루에 (4/6)/30.5살 나이먹음)
	            transperAge = 16 + (int) ((diffDays - 365) * (4 / 183));
	         }

	      else {// 2살 이후 일 때

	         if (dogSize == "소형견") {// 소형견일 때
	            // 1년에 5살식 나이먹음 (하루에 5/365살 나이먹음)
	            transperAge = 24 + (int) ((diff - 730) * (5 / 365));
	         } else if (dogSize == "중형견") { // 중형견일 때
	            // 1년에 6살식 나이먹음
	            transperAge = 24 + (int) ((diff - 730) * (6 / 365));
	         } else {// 대형견일 떄
	            // 1년에 7살식 나이먹음
	            transperAge = 24 + (int) ((diff - 730) * (7 / 365));
	         }
	      }
	      
	      
	      //그다음에 HashMap에 같이 담아서 보내면??

	      date.put("transperAge", transperAge);
		
		return date;
	}

}
