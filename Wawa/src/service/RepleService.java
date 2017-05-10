package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import commons.Constant;
import interface_dao.IRepleDao;
import interface_service.IRepleService;

@Component
public class RepleService implements IRepleService {

	@Autowired
	IRepleDao dao;

	// 댓글쓰기 혹은 댓댓글이라던가...?
	@Override
	public boolean writeReple(int boardIdx, String nickname, String content, int pIdx) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Reple.BOARDIDX, boardIdx);
		params.put(Constant.Reple.NICKNAME, nickname);
		params.put(Constant.Reple.CONTENT, content);
		int result = dao.insertReple(params);
		if (pIdx == 0) {
			params.put(Constant.Reple.GROUPCODE, params.get("repleIdx"));
			params.put(Constant.Reple.GROUPSEQ, 0);
			params.put(Constant.Reple.GROUPLV, 0);
			result = dao.updateGroup(params);
		}
		// 댓글(또는 댓글의 댓글..)일때
		else {
			HashMap<String, Object> parentBoard = dao.selectOne(pIdx);
			int groupCode = (int) parentBoard.get(Constant.Reple.GROUPCODE);
			int groupSeq = (int) parentBoard.get(Constant.Reple.GROUPSEQ);
			int groupLv = (int) parentBoard.get(Constant.Reple.GROUPLV);
			int parentNum = (int) parentBoard.get("repleIdx");
			int max = dao.selectMax(groupCode);

			params.put(Constant.Reple.GROUPCODE, groupCode);
			params.put(Constant.Reple.GROUPLV, groupLv + 1);
			params.put("parentNum", parentNum);

			// 댓글의댓글(혹은 그 이상)일때
			if ((int) parentBoard.get(Constant.Reple.GROUPLV) > 0) {
				HashMap<String, Object> params2 = new HashMap<>();
				params2.put(Constant.Reple.GROUPCODE, groupCode);
				params2.put(Constant.Reple.GROUPSEQ, groupSeq);
				dao.increaseGroupSeq(params2);

				// 댓글의 댓글(혹은 그 이상)이 하나일때
				if (dao.selectParent(parentNum) == 0)
					params.put(Constant.Reple.GROUPSEQ, groupSeq + 1);

				// 댓글의 댓글(혹은 그 이상)이 하나가 아닐때
				else {
					// int param = (int)parentBoard.get("repleIdx");
					HashMap<String, Object> params3 = new HashMap<>();
					params3.put("parentNum", parentNum);
					params3.put(Constant.Reple.GROUPLV, params.get(Constant.Reple.GROUPLV));
					dao.decreaseGroupSeq(params3);

					params.put(Constant.Reple.GROUPSEQ, groupSeq + dao.selectParent((int) parentBoard.get("repleIdx"))
							+ (dao.selectMaxParent(groupCode) - groupLv));

				}
			}
			// 그냥 댓글일때
			else
				params.put(Constant.Reple.GROUPSEQ, max + 1);
			// 그룹업데이트!
			result = dao.updateGroup(params);
		}
		if (result > 0)
			return true;
		else
			return false;
	}

	// 댓글수정
	@Override
	public boolean updateReple(int repleIdx, String content) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Reple.REPLEIDX, repleIdx);
		params.put(Constant.Reple.CONTENT, content);
		int result = dao.updateReple(params);
		if (result > 0)
			return true;
		else
			return false;
	}

	// 댓글삭제
	@Override
	public boolean updateRepleDelete(int repleIdx) {
		// TODO Auto-generated method stub
		int result = dao.updateRepleDelete(repleIdx);
		if (result > 0)
			return true;
		else
			return false;
	}

	// 댓글완전삭제
	@Override
	public boolean deleteReple(int repleCode) {
		// TODO Auto-generated method stub
		int result = dao.deleteReple(repleCode);
		if (result > 0)
			return true;
		else
			return false;
	}
	
	@Override
	public List<HashMap<String, Object>> selectGroupCode(int groupCode) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = dao.selectGroupCode(groupCode);
		return list;
	}

	// 댓글하나찾기
	@Override
	public HashMap<String, Object> selectOne(int repleIdx) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = dao.selectOne(repleIdx);
		return params;
	}

	// 댓글리스트
	@Override
	public List<HashMap<String, Object>> selectRepleList(int boardIdx) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = dao.selectRepleList(boardIdx);
		return list;
	}

	// 특정 닉네임이 쓴 댓글리스트
	@Override
	public List<HashMap<String, Object>> select_by_nickname(String nickname) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = dao.select_by_nickname(nickname);
		return list;
	}

}
