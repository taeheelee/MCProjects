package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import commons.Constant;
import interface_dao.IRepleDao;
import interface_service.IRepleService;

@Component
public class RepleService implements IRepleService{
	
	@Autowired
	IRepleDao dao;
	
	//댓글쓰기 혹은 댓댓글이라던가...?
	@Override
	public boolean writeReple(int boardIdx, String nickname, String content, int pIdx) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Reple.BOARDIDX, boardIdx);
		params.put(Constant.Reple.NICKNAME, nickname);
		params.put(Constant.Reple.CONTENT, content);
		int result = dao.insertReple(params);
		if(pIdx==0){
			params.put(Constant.Reple.GROUPCODE, params.get("repleIdx"));
			params.put(Constant.Reple.GROUPSEQ, 0);
			params.put(Constant.Reple.GROUPLV, 0);
			result = dao.updateGroup(params);
		}
		else{
			HashMap<String, Object> parentReple = dao.selectOne(pIdx);
			int groupCode = (int)parentReple.get(Constant.Reple.GROUPCODE);
			int groupSeq = (int)parentReple.get(Constant.Reple.GROUPSEQ);
			int groupLv = (int)parentReple.get(Constant.Reple.GROUPLV);
			
			HashMap<String, Object> params2 = new HashMap<>();
			params2.put(Constant.Reple.GROUPCODE, groupCode);
			params2.put(Constant.Reple.GROUPSEQ, groupSeq);
			dao.increaseGroupSeq(params2);

			params.put(Constant.Reple.GROUPCODE, parentReple.get(Constant.Reple.GROUPCODE));
			params.put(Constant.Reple.GROUPSEQ, (int)parentReple.get(Constant.Reple.GROUPSEQ)+1);
			params.put(Constant.Reple.GROUPLV, (int)parentReple.get(Constant.Reple.GROUPLV)+1);
			result = dao.updateGroup(params);
		}
		if(result > 0)
			return true;
		else
			return false;
	}
	
	//댓글수정
	@Override
	public boolean updateReple(int repleIdx, String content) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Constant.Reple.REPLEIDX, repleIdx);
		params.put(Constant.Reple.CONTENT, content);
		int result = dao.updateReple(params);
		if(result > 0)
			return true;
		else
			return false;
	}
	
	//댓글삭제
	@Override
	public boolean deleteReple(int repleIdx) {
		// TODO Auto-generated method stub
		int result = dao.deleteReple(repleIdx);
		if(result > 0)
			return true;
		else
			return false;
	}
	
	//댓글하나찾기
	@Override
	public HashMap<String, Object> selectOne(int repleIdx) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = dao.selectOne(repleIdx);
		return params;
	}
	
	//댓글리스트
	@Override
	public List<HashMap<String, Object>> selectRepleList(int boardIdx) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = dao.selectRepleList(boardIdx);
		return list;
	}
	
	//특정 닉네임이 쓴 댓글리스트
	@Override
	public List<HashMap<String, Object>> select_by_nickname(String nickname) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> list = dao.select_by_nickname(nickname);
		return list;
	}

}
