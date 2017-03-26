package interface_dao;

import java.util.List;

public interface Dog_kind {
	public boolean insertDog_kind(Dog_kind Dog_kind);
	public boolean updateDog_kind(Dog_kind Dog_kind);
	public boolean deleteDog_kind();
	public Dog_kind selectOne(String nickname);
	public List<Dog_kind> selectAll();	
}
