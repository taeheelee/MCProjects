package model;

public class Board {
	private int boardIdx;
	private int boardCode;
	private String title;
	private String writer;
	private String content;
	private String readCount;
	private String writeDate;
	private String category;
	private String name;
	private String resist;
	private String lostDate;
	private String kind;
	private int weight;
	private int age;
	private String sex;
	private String phone;
	private String email;
	private String birthday;
	private int starPoint;
	private int likeCount;
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public int getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReadCount() {
		return readCount;
	}
	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getResist() {
		return resist;
	}
	public void setResist(String resist) {
		this.resist = resist;
	}
	public String getLostDate() {
		return lostDate;
	}
	public void setLostDate(String lostDate) {
		this.lostDate = lostDate;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	@Override
	public String toString() {
		return "Board [boardIdx=" + boardIdx + ", boardCode=" + boardCode + ", title=" + title + ", writer=" + writer
				+ ", content=" + content + ", readCount=" + readCount + ", writeDate=" + writeDate + ", category="
				+ category + ", name=" + name + ", resist=" + resist + ", lostDate=" + lostDate + ", kind=" + kind
				+ ", weight=" + weight + ", age=" + age + ", sex=" + sex + ", phone=" + phone + ", email=" + email
				+ ", birthday=" + birthday + ", starPoint=" + starPoint + ", likeCount=" + likeCount + "]";
	}

	
	
}
