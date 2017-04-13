package interface_service;

import java.util.HashMap;
import java.util.List;

public interface IBoardService {
	//================================삽입========================================================
	//뽐내기
	public boolean writeBoastBoard(int boardCode, String name, int age, String sex, String content, String writer);
	//자유게시판,애견정보상식
	public boolean writeFreeBoard(int boardCode, String title, String category, String content, String writer);
	//유기견찾기
	public boolean writeDogFindBoard(int boardCode, String category, String name, String resist, String lostdate, 
			String kind, String sex, int age, double weight, String phone, String email, String content, String writer);
	//짝꿍찾기
	public boolean writePartnerFindBoard(int boardCode, String name, String kind, String sex, 
			int age, double weight, String phone, String email, String content, String writer);
	//제품리뷰
	public boolean writeReviewBoard(int boardCode, String title, String category, int starPoint, String content, String writer);
	
	//================================수정========================================================
	//뽐내기
	public boolean updateBoastBoard(int boardIdx, String name, int age, String sex, String content, String writer);
	//자유게시판,애견정보상식
	public boolean updateFreeBoard(int boardIdx, String title, String category, String content, String writer);
	//유기견찾기
	public boolean updateDogFindBoard(int boardIdx, String category, String name, String resist, String lostdate, 
			String kind, String sex, int age, double weight, String phone, String email, String content, String writer);
	//짝꿍찾기
	public boolean updatePartnerFindBoard(int boardIdx, String name, String kind, String sex, 
			int age, double weight, String phone, String email, String content, String writer);
	//제품리뷰
	public boolean updateReviewBoard(int boardIdx, String title, String category, int starPoint, String content, String writer);
	
	//============================================================================================
	//삭제
	public boolean deleteBoard(int boardIdx);
	//게시글보기
	public HashMap<String, Object> readBoard(int boardIdx);
	//
	public HashMap<String, Object> getBoardList(int page, int boardCode);
	//좋아요 수 증가
	public boolean increaseBoastNum(int boardIdx);
	
	//이름으로 게시판 검색
	public List<HashMap<String, Object>> getBoardByName(HashMap<String, Object> params);
	//제목으로 게시판 검색
	public List<HashMap<String, Object>> getBoardByTitle(HashMap<String, Object> params);
	//키워드로 게시판 검색
	public List<HashMap<String, Object>> getBoardByKeyword(HashMap<String, Object> params);
	public HashMap<String, Object> getBoardByBoardIdx(HashMap<String, Object> params);
}
