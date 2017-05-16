package service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import commons.Constant;
import interface_dao.IDogKindDao;
import interface_dao.IManagementDao;
import interface_dao.IMedicalDao;
import interface_dao.IPetInfoDao;
import interface_dao.IPetInfoFileDao;
import interface_service.IPetinfoService;
import model.Management;

@Component
public class PetInfoService implements IPetinfoService {
	
	@Autowired
	IPetInfoDao dao;
	
	@Autowired
	IPetInfoFileDao petFileDao;
	
	@Autowired
	IMedicalDao mDao;
	
	@Autowired
	IDogKindDao kDao;
	
	@Autowired
	IManagementDao mmDao;
	
	@Override
	public boolean insertPetInfo(int idx, String resist, String id, String name, String kind, Date birthday, String neutral,
			double weight, String sex, Date groomingStart, String groomingPeriod, int mainPet, MultipartFile file) {
		// TODO Auto-generated method stub
		
		String path = "UploadPetinfo/";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		
		UUID uuid = UUID.randomUUID();
		String fileName = file.getOriginalFilename();
		int fileSize = (int)file.getSize();
		String fileuri = path + uuid;
		
		HashMap<String, Object> petFile = new HashMap<>();
		petFile.put("originFileName", fileName);
		petFile.put("size", fileSize);
		petFile.put("uri", fileuri);
		
		File localFile = new File(fileuri);
		try {
			file.transferTo(localFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		petFileDao.insertPetInfoFile(petFile);
		
		
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
		params.put("mainPet", mainPet);
		params.put("fileId", petFile.get("id")); //아이디값이 바로 나오나??
		
		int result = dao.insertPetInfo(params);
		
		long insertedPetIdx = (long) params.get("idx");
		int insertedPetIdxInt = (int)insertedPetIdx;
		
		Management model = new Management();
		model.setIdx(insertedPetIdxInt);
		model.setDate(new Date());
		model.setWeight(weight);
		mmDao.insertManagement(model);
		
		
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
			double weight, String sex, Date groomingStart, String groomingPeriod, int mainPet, MultipartFile file) {
		// TODO Auto-generated method stub
		//수정할 강아지 목록을 받아와서 출력해주고
		HashMap<String, Object> tmp = dao.selectOne(idx);
		int fileId = (int)dao.selectOne(idx).get("fileId");
		
		String path = "UploadPetinfo/";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		
		UUID uuid = UUID.randomUUID();
		String fileName = file.getOriginalFilename();

		

		System.out.println("입력된 오리지날fileName : "+fileName);
		
		
		HashMap<String, Object> fileTemp = petFileDao.selectOne(fileId);
//		System.out.println("fileTemp : "+fileTemp);
		String savedFileName = (String)fileTemp.get("originFileName");
		System.out.println("저장되어있던 파일 이름 : "+savedFileName);
		

			
		if(fileName.equals("")){
			//파일이름이 없다! 그럼 사진 변경 안해염 
			
		}else {//파일이름이 생겼으면 그걸로 변경하자
			
			int fileSize = (int)file.getSize();
			String fileuri = path + uuid;
			
			HashMap<String, Object> petFile = new HashMap<>();
			petFile.put("originFileName", fileName);
			petFile.put("size", fileSize);
			petFile.put("uri", fileuri);
			petFile.put("fileId",fileId );
			
			File localFile = new File(fileuri);
			try {
				file.transferTo(localFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			petFileDao.updatePetInfoFile(petFile);
		}
			
			

		
		
		
		
		
		//변경사항은 변경되면 새로운 params에 받고  변경되지 않은 내용들은 SelectOne의 내용 그대로
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.PetInfo.IDX, idx);//방금 이거 추가함요 
		params.put(Constant.PetInfo.RESIST, resist);
//		params.put(Constant.PetInfo.ID, id);
		params.put(Constant.PetInfo.NAME, name);
		params.put(Constant.PetInfo.KIND, kind);
		params.put(Constant.PetInfo.BIRTHDAY, birthday);
		params.put(Constant.PetInfo.NEUTRAL, neutral);
		params.put(Constant.PetInfo.WEIGHT, weight);
		params.put(Constant.PetInfo.SEX, sex);
		params.put(Constant.PetInfo.GROOMINGSTART, groomingStart);
		params.put(Constant.PetInfo.GROOMINGPERIOD, groomingPeriod);
		params.put("mainPet", mainPet);
		params.put("fileId", fileId);
		
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
	public HashMap<String, Object> selectOne(int idx) {
		// TODO Auto-generated method stub
		return dao.selectOne(idx);
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
		
		
		
	    //품종도 여기서 못하나?
	      //일단 해당 강아지의 견종을 받아와

		
		String petIdxString = (String) params.get("petIdx");
		int petIdx = Integer.parseInt(petIdxString);
		
		HashMap<String, Object> temp = dao.selectOne(petIdx);
		String petKind = (String) temp.get("kind");
	      
	      //이게 소형견인지 중형견인지 대형견인지 DB에서 찾아서 받아와
		HashMap<String, Object> sizeTemp = kDao.selectOneDogKind(petKind);
		String dogSize = (String)sizeTemp.get("dogSize");

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

	         if (dogSize.equals("소형견")) {// 소형견일 때
	            // 1년에 5살식 나이먹음 (하루에 5/365살 나이먹음)
	            transperAge = 24 + (int) ((diff - 730) * (5 / 365));
	         } else if (dogSize.equals("중형견")) { // 중형견일 때
	            // 1년에 6살식 나이먹음
	            transperAge = 24 + (int) ((diff - 730) * (6 / 365));
	         } else {// 대형견일 떄
	            // 1년에 7살식 나이먹음
	            transperAge = 24 + (int) ((diff - 730) * (7 / 365));
	         }
	      }
	      
	      
	      //그다음에 HashMap에 같이 담아서 보내면??

	      date.put("transperAge", transperAge);

	      
	      
	      //그렇다면, 일일 kcal도 여기서 계산해보자
	      Double petWeight = (Double)temp.get("weight");
	      int calories = (int)(  ( ( petWeight * 30 ) + 70) * 1.8   );
	      date.put("calories", calories);
	      
	      // 해당 견종 성견 평균 무게
	      Double adultWeight = (Double)sizeTemp.get("adultWeight");
	      date.put("adultWeight",adultWeight);

	      // 평균 운동량 
	      String exerciseMsg="";
	      String warningMsg="(※ 하루 적정 운동량은 각 강아지의 건강상태 및 나이, 견종 등에 따라 달라집니다.)";
	      if(dogSize.equals("소형견")){
	    	  exerciseMsg= "소형견 평균 일일 운동 권장량 : 20 ~ 30분";
	      } else if (dogSize.equals("중형견")){
	    	  exerciseMsg= "중형견 평균 일일 운동 권장량 : 45 ~ 60분";
	      } else{
	    	  exerciseMsg= "대형견 평균 일일 운동 권장량 : 60 ~ 90분";
	      }
	      date.put("exerciseMsg",exerciseMsg);
	      date.put("warningMsg",warningMsg);
	      
// 이제 미용 D-day를 계산해보자
	      
	      
	      
	      //1.D-day 구하기 : 미용알림시작일 + 미용 알림 주기 - 오늘 날짜
	      Date groomingStart = (Date) temp.get("groomingStart");
	      int groomingPeriod = (int) temp.get("groomingPeriod");
	      
	      String d_day="";
	      
	      if(groomingStart == null || groomingPeriod == 0){
	    	  d_day="미설정";
	      }else{
	    	  long diffGrooming = groomingStart.getTime() - today.getTime();
	    	  long dDay = diffGrooming / (24 * 60 * 60 * 1000) +groomingPeriod;
	    	  d_day = "D-" + String.valueOf(dDay);
	    	  //2. D-day 가 마이너스가 되면, update 미용알림시작일  = 미용알림시작일 + 미용 알림 주기
	    	  
	    	  Calendar cal = Calendar.getInstance();
	    	  cal.setTime(groomingStart);
	    	  // if(dDay < 0){
	    	  
	    	  if (dDay==0){
	    		  d_day = "D-DAY";
	    	  }
	    	  while (dDay < 0) {
	    		  cal.add(Calendar.DATE, groomingPeriod);
	    		  
	    		  Date newGroomingStart = new Date(cal.getTimeInMillis());
	    		  String newGroomingStartString = transFormat.format(newGroomingStart);
	    		  
	    		  temp.put(Constant.PetInfo.GROOMINGSTART, newGroomingStartString);
	    		  dDay += groomingPeriod;
	    		  d_day = "D-" + String.valueOf(dDay);
	    	  }
	    	  
//		dao.updatePetInfo(temp);
	    	  // }
	    	  
	      }
	      


		date.put("d_day", d_day);

		return date;
	}

	@Override
	public HashMap<String, Object> selectFile(int fileId) {
		// TODO Auto-generated method stub
		return petFileDao.selectOne(fileId);
	}
	
	@Override
	public HashMap<String, Object> selectMainPet(String id){
		List<HashMap<String, Object>> petList = dao.selectPetList(id);
		HashMap<String, Object> params = new HashMap<>(); 					
		
		for(int i = 0; i < petList.size(); i ++){
			if(((int)petList.get(i).get("mainPet")) == 1){
				params.put("name" , petList.get(i).get("name"));
				params.put("sex" , petList.get(i).get("sex"));
				params.put("birth" , petList.get(i).get("birthday"));
				params.put("fileId" , petList.get(i).get("fileId"));
				params.put("groomingStart", petList.get(i).get("groomingStart"));
	            params.put("groomingPeriod", petList.get(i).get("groomingPeriod"));
	            break;
			}else{
				params.put("name" , petList.get(0).get("name"));
				params.put("sex" , petList.get(0).get("sex"));
				params.put("birth" , petList.get(0).get("birthday"));
				params.put("fileId" , petList.get(0).get("fileId"));
				params.put("groomingStart", petList.get(0).get("groomingStart"));
	            params.put("groomingPeriod", petList.get(0).get("groomingPeriod"));
	         }
		}
		return params;
	}


	@Override
	public boolean updateWeight(double weight, int idx) {
		// TODO Auto-generated method stub
		HashMap<String, Object> pet = new HashMap<>();
		pet.put("weight", weight);
		pet.put("idx", idx);
		if(dao.updateWeight(pet) > 0)
			return true;
		else return false;
	}

}
