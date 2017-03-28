package interface_dao;

import java.util.List;

public interface ManagementDao {
	public boolean insertManagement(ManagementDao management);
	public boolean updateManagement(ManagementDao management);
	public boolean deleteManagement(int management_idx);
	public ManagementDao selectOne(int management_idx);
	public List<ManagementDao> selectList(int code);
}
