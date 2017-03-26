package interface_dao;

import java.util.List;

public interface Management {
	public boolean insertManagement(Management management);
	public boolean updateManagement(Management management);
	public boolean deleteManagement(int management_idx);
	public Management selectOne(int management_idx);
	public List<Management> selectList(int code);
}
