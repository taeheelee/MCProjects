

import dao.BoardDao;
import model.Board;

public class Test {
	public static void main(String[] args) {
		BoardDao bd = BoardDao.getInstance();
		Board board = new Board();
		
		board.setBoard_code(1);
		board.setTitle("제목");
		board.setWriter("글쓴이");
<<<<<<< HEAD
		board.setContent("내용");
		//board.setReadcount(0); 0으로 자동설정이므로 필요없음
		//board.setWritedate("now()");	현재시간으로 자동설정이므로 필요없음
		board.setCategory("카테고리");
		board.setPetname("펫이름");
		board.setResist("예방접종");
		board.setLostdate("20170102");
		board.setKind("품종");
		board.setWeight(30);
		board.setAge(5);
		board.setSex("수컷");
		board.setPhone("010-1234-5678");
		board.setEmail("wawa@naver.com");
		board.setBirthday("20160412");
		board.setStarpoint(0);
		board.setBoastnum(0);
		
		//bd.insertBoard(board);
		//bd.updateBoard(board);
		//bd.deleteBoard(1);
		//System.out.println(bd.selectOne(1));
		
//		for(Board b : bd.selectBoardList(1))
//			System.out.println(b);
		
		for(Board b : bd.selectAll())
=======
		board.setContent("내용임");
		//board.setReadcount(0); 0으로 자동설정이므로 필요없음
		//board.setWritedate("now()");	현재시간으로 자동설정이므로 필요없음
		board.setCategory("카테고리");
		board.setPetname("펫이름");
		board.setResist("예방접종");
		board.setLostdate("20170102");
		board.setKind("품종");
		board.setWeight(30);
		board.setAge(5);
		board.setSex("수컷");
		board.setPhone("010-1234-5678");
		board.setEmail("wawa@naver.com");
		board.setBirthday("20160412");
		board.setStarpoint(0);
		board.setBoastnum(4);
		
//		bd.insertBoard(board);

		//bd.updateBoard(board);
		//bd.deleteBoard(1);
		//System.out.println(bd.selectOne(1));
		
//		for(Board b : bd.selectBoardList(1))
//			System.out.println(b);
		
//		for(Board b : bd.selectAll())
//			System.out.println(b);
		
//		for(Board b : bd.select_by_keyword("용"))
//			System.out.println(b);
		
		for(Board b : bd.select_by_boastnum())
>>>>>>> branch 'master' of https://github.com/taeheelee/MCProjects.git
			System.out.println(b);
	}
}
