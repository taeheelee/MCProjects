


import java.util.HashMap;

import dao.BoardDao;
import dao.Dog_kindDao;
import dao.ImageDao;
import interface_dao.IBoardDao;
import interface_dao.IDog_kindDao;
import interface_dao.IImageDao;
import interface_dao.IManagementDao;


public class Test {
	public static void main(String[] args) {
		
		IBoardDao bd = BoardDao.getInstance();
		HashMap<String, Object> params = new HashMap<>();

//		params.put("board_code", 2);
//		params.put("title", "제목이다요");
//		params.put("writer", "이");
//		params.put("conten", "게시판노가다다요!");
//		params.put("category", "카테고리는 개입니다");
//		params.put("petname", "길승이");
//		params.put("resist", "레지스트");
//		params.put("lostdate", "20160317");
//		params.put("kind", "켈베로스");
//		params.put("weight", 99);
//		params.put("age", 1500);
//		params.put("sex", "중성임!아무튼 중성임!");
//		params.put("phone", "010-0000-0000");
//		params.put("email", "Goso@naver.com");
//		params.put("birthday", "19930114");
//		params.put("starpoint", 3);
//		params.put("boastnum", 99);
//		bd.insertBoard(params);
//		for(HashMap<String, Object> b : bd.selectAllBoard())
//			System.out.println(b);
		
//		IDog_kindDao dd = Dog_kindDao.getInstance();
//		params.put("kind", "불독2");
//		params.put("dogSize", "소");
//		params.put("adultWeight",10);
//		dd.insertDog_kind(params);
//		System.out.println(dd.selectOneDog_kind("불독2"));
//		for(HashMap<String, Object> d : dd.selectAllDog_kind())
//			System.out.println(d);
		
//		IImageDao id = ImageDao.getInstance();
//		params.put("board_idx", 5);
//		params.put("physical_name", "기하학");
//		params.put("name", "화난개구리.jpg");
//		params.put("path", "니문서");
//		id.insertImage(params);
//		System.out.println(id.selectOneImage(2));
//		for(HashMap<String, Object> i : id.selectAllImage())
//			System.out.println(i);
	}
}
