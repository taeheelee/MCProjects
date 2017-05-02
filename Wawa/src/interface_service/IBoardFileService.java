package interface_service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

public interface IBoardFileService {
	public HashMap<String, Object> selectOne(int fileId);
	public HashMap<String, Object> writeSummernoteFile(MultipartFile file);
}
