package interface_dao;

import java.util.List;

public interface Dog_kindDao {
	public boolean insertDog_kind(Dog_kindDao Dog_kind);
	public boolean updateDog_kind(Dog_kindDao Dog_kind);
	public boolean deleteDog_kind();
	public Dog_kindDao selectOne(String nickname);
	public List<Dog_kindDao> selectAll();	
}
