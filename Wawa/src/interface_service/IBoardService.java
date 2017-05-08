package interface_service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface IBoardService {
	//================================삽입========================================================
	//뽐내기
	public boolean writeBoastBoard(int boardCode, String name, int age, String kind, String sex, String title, String content, String writer, MultipartFile file);
	//자유게시판,애견정보상식
	public boolean writeFreeBoard(int boardCode, String title, String category, String content, String writer);
	//유기견찾기
	public boolean writeDogFindBoard(int boardCode, String category, String name,String resist, String lostdate, String lostPlace,
			String kind, String sex, int age, double weight, String phone, String email, String title, String content, String writer, MultipartFile file);
	//짝꿍찾기
	public boolean writePartnerFindBoard(int boardCode, String name, String kind, String sex, 
			int age, double weight, String phone, String email, String title, String content, String writer, MultipartFile file);
	//제품리뷰
	public boolean writeReviewBoard(int boardCode, String title, String category, int starPoint, String content, String writer);
	
	//================================수정========================================================
	//뽐내기
	public boolean updateBoastBoard(int boardIdx, String name, String kind, int age, String sex, String title, String content, String writer, int likeCount, MultipartFile file);
	//자유게시판,애견정보상식
	public boolean updateFreeBoard(int boardIdx, String title, String category, String content, String writer, int readCount);
	//유기견찾기
	public boolean updateDogFindBoard(int boardIdx, String category, String name, String resist, String lostdate, String lostplace,
			String kind, String sex, int age, double weight, String phone, String email, String title, String content, String writer, MultipartFile file);
	//짝꿍찾기
	public boolean updatePartnerFindBoard(int boardIdx, String name, String kind, String sex, 
			int age, double weight, String phone, String email, String title, String content, String writer, MultipartFile file);
	//제품리뷰
	public boolean updateReviewBoard(int boardIdx, String title, String category, int starPoint, String content, String writer, int readCount);
	
	//============================================================================================
	//삭제
	public boolean deleteBoard(int boardIdx);
	//게시글보기
	public HashMap<String, Object> readBoard(int boardIdx);
	//게시글목록 및 페이징
	public HashMap<String, Object> getBoardList(int page, int boardCode);
	//좋아요 수 증가
	public boolean increaseBoastNum(int boardIdx);
	//좋아요 순으로 정렬
	public List<HashMap<String, Object>> selectBoastNum();
	
	//게시판 검색
	public HashMap<String, Object> searchBoard(String category, int type, String keyword, int page, int boardCode);
	//게시판인덱스로 게시판 검색
	public HashMap<String, Object> getBoardByBoardIdx(int boardIdx);
	//본인확인
	public boolean identifyUser(HashMap<String, Object> params);
	//펫 정보 가져오기
	public HashMap<String, Object> selectPetinfo(int idx);
}
