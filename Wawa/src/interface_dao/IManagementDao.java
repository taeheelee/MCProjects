package interface_dao;

import java.util.List;

public interface IManagementDao {
	public boolean insertManagement(IManagementDao management);
	public boolean updateManagement(IManagementDao management);
	public boolean deleteManagement(int management_idx);
	public IManagementDao selectOne(int management_idx);
	public List<IManagementDao> selectList(int code);
}
