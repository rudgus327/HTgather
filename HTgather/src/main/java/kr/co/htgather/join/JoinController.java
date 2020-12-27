package kr.co.htgather.join;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/join")
public class JoinController {
	
	
	@RequestMapping(value = "/jform", method = RequestMethod.GET)
	public String jform() {
		return "join/jform";
	}//form
}
