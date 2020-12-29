package kr.co.htgather.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinService {

	@Autowired
	private joinDAO dao;
	
	public int idChk(String mbr_id) {
		int idCount = dao.idChk(mbr_id);
		return idCount;
	}//idChk : 아이디 중복체크

	public int register(MbrDTO inDto) {
		int successCnt = dao.register(inDto);
		return successCnt;
	}//register : 회원가입
	
}
