package kr.co.htgather.join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class joinDAO {

	@Autowired
	private SqlSession sqlsession;
	
	public int idCheck(String id) {
		int idCnt = sqlsession.selectOne("JoinMapper.idCheck", id);
		return idCnt;
	}//idCheck : 중복체크

	public int formSubmit(MbrDTO inDto) {
		int insertCnt = sqlsession.insert("JoinMapper.formSubmit", inDto);
		return insertCnt;
	}//formSubmit : 회원가입
	
}//class
