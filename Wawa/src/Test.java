


import dao.ManagementDao;
import interface_dao.BoardDao;
import model.Board;
import model.Management;

public class Test {
	public static void main(String[] args) {
//		ManagementDao md = ManagementDao.getInstance();
//		Management management = new Management();
//		
//		management.setCode(123);
//		management.setDate("20160316");
//		management.setWeight(30);
//		md.insertManagement(management);
		
//		for(Management m : md.selectListManagement(123))
//			System.out.println(m);
		
		BoardDao bd = dao.BoardDao.getInstance();
		
		Board board = new Board();
		board.setBoard_code(1);
		board.setTitle("제목");
		board.setWriter("글쓴이");
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

		//bd.insertBoard(board);
//		bd.updateBoard(board);
		//bd.deleteBoard(1);
		//System.out.println(bd.selectOne(1));
		
//		for(Board b : bd.selectBoardList(1))
//			System.out.println(b);
		
		for(Board b : bd.selectAll())
			System.out.println(b);
		
//		for(Board b : bd.select_by_keyword("용"))
//			System.out.println(b);
		
//		for(Board b : bd.select_by_boastnum())
//			System.out.println(b);
	}
}
