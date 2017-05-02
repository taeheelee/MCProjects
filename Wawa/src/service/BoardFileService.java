package service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import commons.Constant;
import interface_dao.IBoardFileDao;
import interface_service.IBoardFileService;

@Service
public class BoardFileService implements IBoardFileService{

	@Autowired
	private IBoardFileDao fileDao;
	@Override
	public HashMap<String, Object> selectOne(int fileId) {
		// TODO Auto-generated method stub
		return fileDao.selectOne(fileId);
	}
	@Override
	public HashMap<String, Object> writeSummernoteFile(MultipartFile file) {
		// TODO Auto-generated method stub
		String path = "Upload/";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		
		UUID uuid = UUID.randomUUID();
		//원본파일명
		String fileName = file.getOriginalFilename();
		//파일사이즈
		int fileSize = (int)file.getSize();
		//파일경로
//		String fileuri = path + fileName;
		String fileuri = path + uuid;
		
		HashMap<String, Object> boardFile = new HashMap<>();
		boardFile.put(Constant.BoardFile.ORIGINFILENAME, fileName);
		boardFile.put(Constant.BoardFile.SIZE, fileSize);
		boardFile.put(Constant.BoardFile.URI, fileuri);
		
		File localFile = new File(fileuri);
		try {
			file.transferTo(localFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fileDao.insertBoardFile(boardFile);
		boardFile.put(Constant.BoardFile.FILEID, boardFile.get("id"));
//		int fileid = Integer.parseInt((String)boardFile.get("id"));
		return boardFile;
	}

}
