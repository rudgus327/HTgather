package kr.co.htgather.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinServiceImpl implements JoinService {

	@Autowired
	private joinDAO dao;
	
	@Override
	public int idCheck(String id) {
		int idCnt = dao.idCheck(id);
		return idCnt;
	}//idCheck : 중복체크

	@Override
	public int formSubmit(MbrDTO inDto) {
		int insertCnt = dao.formSubmit(inDto);
		return insertCnt;
	}//formSubmit : 회원가입

}
