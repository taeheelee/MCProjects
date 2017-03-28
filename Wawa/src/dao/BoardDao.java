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

public class BoardDao implements interface_dao.BoardDao{
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
	
	//게시글추가
	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.BoardDao.class).insertBoard(board);
		}
		finally {
			session.close();
		}
	}
	
	//게시글수정
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.BoardDao.class).updateBoard(board);
		}
		finally {
			session.close();
		}
	}
	
	//게시글삭제

	public int deleteBoard(int board_idx) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.BoardDao.class).deleteBoard(board_idx);
		}
		finally {
			session.close();
		}
	}
	
	//게시글 불러오기

	public Board selectOne(int board_idx) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.BoardDao.class).selectOne(board_idx);
		}
		finally {
			session.close();
		}
	}
	
	//전체글보기
	public List<Board> selectAll() {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.BoardDao.class).selectAll();
		}
		finally {
			session.close();
		}
	}
	
	//게시판 유형에 맞는 게시글 모두 불러오기
	public List<Board> selectBoardList(int board_code) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.BoardDao.class).selectBoardList(board_code);
		}
		finally {
			session.close();
		}
	}
	
	//글쓴이로 검색
	public List<Board> select_by_name(String name) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.BoardDao.class).select_by_name(name);
		}
		finally {
			session.close();
		}
	}
	
	//글제목으로 검색
	public List<Board> select_by_title(String title) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.BoardDao.class).select_by_title(title);
		}
		finally {
			session.close();
		}
	}
	
	//내용으로 검색
	public List<Board> select_by_keyword(String keyword) {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.BoardDao.class).select_by_keyword(keyword);
		}
		finally {
			session.close();
		}
	}

	//좋아요 많은순으로 정렬
	public List<Board> select_by_boastnum() {
		// TODO Auto-generated method stub
		SqlSession session = sqlSessionFactory.openSession();
		try{
			return session.getMapper(interface_dao.BoardDao.class).select_by_boastnum();
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
