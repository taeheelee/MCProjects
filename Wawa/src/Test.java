


import java.util.HashMap;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import commons.Constant;
import dao.BoardDao;
import dao.DogKindDao;
import dao.ImageDao;
import interface_dao.IBoardDao;
import interface_dao.IDogKindDao;
import interface_dao.IImageDao;
import interface_dao.IManagementDao;
import interface_dao.IPetInfoDao;
import interface_dao.IRepleDao;
import interface_dao.IUserInfoDao;
import interface_dao.IVaccineInfoDao;


public class Test {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
//		IBoardDao bd = context.getBean("boardDao", IBoardDao.class);
		HashMap<String, Object> params = new HashMap<>();

//		params.put(Constant.Board.BOARDCODE, 2);
//		params.put(Constant.Board.TITLE, "제목이다요");
//		params.put(Constant.Board.WRITER, "이");
//		params.put(Constant.Board.CONTETNT, "게시판노가다다요!");
//		params.put(Constant.Board.CATEGORY, "카테고리는 개입니다");
//		params.put(Constant.Board.NAME, "길승이");
//		params.put(Constant.Board.RESIST, "레지스트");
//		params.put(Constant.Board.LOSTDATE, "20160317");
//		params.put(Constant.Board.KIND, "켈베로스");
//		params.put(Constant.Board.WEIGHT, 99);
//		params.put(Constant.Board.AGE, 1500);
//		params.put(Constant.Board.SEX, "중성임!아무튼 중성임!");
//		params.put(Constant.Board.PHONE, "010-0000-0000");
//		params.put(Constant.Board.EMAIL, "Goso@naver.com");
//		params.put(Constant.Board.BIRTHDAY, "19930114");
//		params.put(Constant.Board.STARPOINT, 3);
//		params.put(Constant.Board.LIKECOUNT, 99);
//		bd.insertBoard(params);
//		for(HashMap<String, Object> b : bd.selectAllBoard())
//			System.out.println(b);
		
//		IDog_kindDao dd = context.getBean("dog_kindDao", IDog_kindDao.class);
//		params.put(Constant.Dog_kind.KIND, "불독2");
//		params.put(Constant.Dog_kind.DOGSIZE, "소");
//		params.put(Constant.Dog_kind.ADULTWEIGHT,10);
//		dd.insertDog_kind(params);
//		System.out.println(dd.selectOneDog_kind("불독2"));
//		for(HashMap<String, Object> d : dd.selectAllDog_kind())
//			System.out.println(d);
		
//		IImageDao id = context.getBean("imageDao", IImageDao.class);
//		params.put(Constant.image.PHYSICALNAME, "기하학");
//		params.put(Constant.image.NAME, "화난개구리.jpg");
//		params.put(Constant.image.PATH, "니문서");
//		id.insertImage(params);
//		for(HashMap<String, Object> i : id.selectAllImage())
//			System.out.println(i);
		
//		IManagementDao md = context.getBean("managementDao", IManagementDao.class);
//		for(HashMap<String, Object> m : md.selectList(1))
//			System.out.println(m);
		
//		IRepleDao rd = context.getBean("repleDao", IRepleDao.class);
//		for(HashMap<String, Object> r : rd.selectAll())
//			System.out.println(r);
		
//		IUserInfoDao ud = context.getBean("userInfoDao", IUserInfoDao.class);
//		for(HashMap<String, Object> u : ud.selectAllUserInfo())
//			System.out.println(u);
		
//		IPetInfoDao pd = context.getBean("petInfoDao", IPetInfoDao.class);
//		for(HashMap<String, Object> p : pd.selectAll())
//			System.out.println(p);
		
//		IVaccineInfoDao vd = context.getBean("vaccineInfoDao", IVaccineInfoDao.class);
//		params.put(Constant.VaccineInfo.VACCINENAME, "백신이름");
//		params.put(Constant.VaccineInfo.VACCINEPERIOD, 365);
//		params.put(Constant.VaccineInfo.VACCINEAGE, 3);
//		vd.insertVaccine(params);
//		for(HashMap<String, Object> v : vd.selectAll())
//			System.out.println(v);
	}
}
