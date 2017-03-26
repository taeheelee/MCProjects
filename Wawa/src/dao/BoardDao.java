package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Board;
import model.UserInfo;

public class BoardDao {
	private SqlSessionFactory sqlSessionFactory;
	private static BoardDao instance;
	
	public static BoardDao getInstance() {
		if(instance == null)
			instance = new BoardDao();
		return instance;
	}

	private BoardDao(){
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean insertBoard(Board board){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.insert("board.insert", board);
			if(result > 0){
				session.commit();
				return true;
			}
			else{
				session.rollback();
				return false;
			}
		}
		finally {
			session.close();
		}
	}
	
	public boolean updateBoard(Board board){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.update("board.update", board);
			if(result > 0){
				session.commit();
				return true;
			}else{
				session.rollback();
				return false;
			}
		}finally{
			session.close();
		}
	}
	
	public boolean deleteBoard(int num){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.delete("board.delete", num);
			if(result > 0){
				session.commit();
				return true;
			}else {
				session.rollback();
				return false;
			}
		}finally {
			session.close();
		}
	}
	
	//게시글 번호로 게시글 정보 가져오기
	public Board selectOne(int board_idx){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectOne("board.selectOne", board_idx);
		}
		finally {
			session.close();
		}
	}
	
	//게시판 유형에 맞는 게시글보기
	public List<Board> selectBoardList(int board_code){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("board.selectBoardList", board_code);
		}
		finally {
			session.close();
		}
	}
	
	//전체글보기
	public List<Board> selectAll(){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("board.selectAll");
		}
		finally {
			session.close();
		}
	}
	
	//글쓴이로 검색
	public List<Board> select_by_name(String name){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("board.select_by_name", name);
		}
		finally {
			session.close();
		}
	}
	
	//글제목으로 검색
	public List<Board> select_by_title(String title){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("board.select_by_title", title);
		}
		finally {
			session.close();
		}
	}
	//글내용으로 검색
	public List<Board> select_by_keyword(String keyword){
		SqlSession session = sqlSessionFactory.openSession();
		String temp = "%"+keyword+"%";
		try{
			return session.selectList("board.select_by_keyword", temp);
		}
		finally {
			session.close();
		}
	}
	//좋아요 많은순으로 정렬
	public List<Board> select_by_boastnum(){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("board.select_by_boastnum");
		}
		finally {
			session.close();
		}
	}
	
	public boolean insertUserInfo(UserInfo userinfo){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.insert("userinfo.insert", userinfo);
			if(result > 0){
				session.commit();
				return true;
			}
			else{
				session.rollback();
				return false;
			}
		}
		finally {
			session.close();
		}
	}
	
	public boolean updateUserInfo(UserInfo userinfo){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.update("userinfo.update", userinfo);
			if(result > 0){
				session.commit();
				return true;
			}else{
				session.rollback();
				return false;
			}
		}finally{
			session.close();
		}
	}
	
	public boolean deleteUserInfo(String id){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			int result = session.delete("userinfo.delete", id);
			if(result > 0){
				session.commit();
				return true;
			}else {
				session.rollback();
				return false;
			}
		}finally {
			session.close();
		}
	}
	
	//사용자 ID로 해당 사용자 정보 받아오기
	public UserInfo selectOneUserInfo(String id){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectOne("userinfo.select", id);
		}
		finally {
			session.close();
		}
	}
	
	public List<UserInfo> selectAllUserInfo() {
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.selectList("userinfo.selectAll");
		}
		finally {
			session.close();
		}
	}
}
