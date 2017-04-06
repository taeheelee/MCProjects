package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import interface_dao.IImageDao;
import interface_service.IImageService;

@Component
public class ImageService implements IImageService {
	@Autowired
	IImageDao dao;

	@Override
	public boolean insertImage(HashMap<String, Object> params) {
		int result = dao.insertImage(params);

		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateImage(HashMap<String, Object> params) {
		int result = dao.updateImage(params);

		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteImage(int imgIdx) {
		int result = dao.deleteImage(imgIdx);

		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public HashMap<String, Object> selectOneImage(int imgIdx) {
		HashMap<String, Object> params = new HashMap<>();
		params = dao.selectOneImage(imgIdx);
		
		return params;
	}

	@Override
	public List<HashMap<String, Object>> selectAllImage() {
		List<HashMap<String, Object>> params = dao.selectAllImage();
		
		return params;
	}

}
