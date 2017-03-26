package model;

public class Reple {
	private int board_code;
	private int board_idx;
	private String nickname;
	private String content;
	public int getBoard_code() {
		return board_code;
	}
	public void setBoard_code(int board_code) {
		this.board_code = board_code;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Reple [board_code=" + board_code + ", board_idx=" + board_idx
				+ ", nickname=" + nickname + ", content=" + content +"]";
	}
}
