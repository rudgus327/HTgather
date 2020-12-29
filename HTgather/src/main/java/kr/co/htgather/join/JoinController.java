package kr.co.htgather.join;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class JoinController {
	private static final Logger logger
	= LoggerFactory.getLogger(JoinController.class);
	
	@Autowired
	private JoinService service;
	
	@RequestMapping(value = "/jform", method = RequestMethod.GET)
	public String jform() {
		return "join/jform";
	}//jform
	
	@ResponseBody
	@RequestMapping(value = "/idChk", method=RequestMethod.GET)
	public String idChk(String mbr_id) {
		int idCount = service.idChk(mbr_id);
		return ""+ idCount;
	}//idChk : 아이디 중복체크
	
	@ResponseBody
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String register(MbrDTO inDto) {
		int successCnt = service.register(inDto);
		logger.info(""+successCnt);
		if (successCnt == 1) {//회원가입 성공
			return ""+successCnt;
		}else {//회원가입 실패
			return "-1";
		}
	}//register : 회원가입
	
	
}
