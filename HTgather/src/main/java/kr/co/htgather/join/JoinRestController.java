package kr.co.htgather.join;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/inout")
public class JoinRestController {

	@Autowired
	private JoinService service;
	
	@RequestMapping(value = "/in", method = RequestMethod.GET)
	public int login(HttpSession session, MbrDTO indto) {
		int mbrNo = service.login(indto);
		if (mbrNo > 0) {
			indto.setMno(""+mbrNo);
			session.setAttribute("login_dto", indto);
		}
		return mbrNo;
	}//login
	
	@RequestMapping(value = "/out", method = RequestMethod.GET)
	public int logout(HttpSession session) {
		session.invalidate();
		return 1;
	}//logout
	
}
