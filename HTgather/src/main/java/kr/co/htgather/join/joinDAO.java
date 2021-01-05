package kr.co.htgather.join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class joinDAO {

	@Autowired
	private SqlSession sqlsession;
	
	public int idChk(String mbr_id) {
		int idCount = sqlsession.selectOne("JoinMapper.idChk", mbr_id);
		return idCount;
	}//idCheck : 아이디 중복체크 회원가입

	public int register(MbrDTO inDto) {
		int successCnt 
			= sqlsession.insert("JoinMapper.register", inDto);
		return successCnt;
	}//register : 회원가입

	public int pwdCheck(MbrDTO indto) {
		int pwdYn = sqlsession.selectOne("JoinMapper.pwdCheck", indto);
		return pwdYn;
	}

	public int login(MbrDTO indto) {
		int mbrNo = sqlsession.selectOne("JoinMapper.login", indto);
		return mbrNo;
	}


	
}//class
