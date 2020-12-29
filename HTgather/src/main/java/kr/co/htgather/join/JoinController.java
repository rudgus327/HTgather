package kr.co.htgather.join;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/join")
public class JoinController {
	
	@Autowired
	private JoinService service;
	
	@RequestMapping(value = "/jform", method = RequestMethod.GET)
	public String jform() {
		return "join/jform";
	}//jform
	
	@ResponseBody
	@RequestMapping(value = "/idChk", method=RequestMethod.GET)
	public String idChk(String id) {
		int idCnt = service.idCheck(id);
		return ""+ idCnt;
	}//idCheck
	
	@RequestMapping(value = "/join", method=RequestMethod.POST)
	public String formSubmit(MbrDTO inDto) {
		int insertCnt = service.formSubmit(inDto);
		return ""+ insertCnt;
		
	}
	
	
}
