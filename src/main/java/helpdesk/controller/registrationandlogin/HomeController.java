package helpdesk.controller.registrationandlogin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import helpdesk.model.registerandlogin.Address;
import helpdesk.model.registerandlogin.Login;
import helpdesk.model.registerandlogin.User;
import helpdesk.service.registerandlogin.RegistrationAndLoginService;

@Controller
public class HomeController {

	@Autowired
	private RegistrationAndLoginService rlService;

	public void setRlservice(RegistrationAndLoginService rlService) {
		this.rlService = rlService;
	}

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public ModelAndView index(Login login, Model model, HttpSession session) {
		ModelAndView mav = null;
		if (session.getAttribute("username") != null && !session.getAttribute("username").equals("")) {
			String user = (String) session.getAttribute("username");
			System.out.println(user + "at login");
			System.out.println("session iD : " + session.getId());
			System.out.println("Session loginId at controller: " + session.getAttribute("loginId"));
			mav = new ModelAndView("dashboard");
			mav.setViewName("redirect:/dashboard");
			return mav;
		} else {
			mav = new ModelAndView("index");
			mav.addObject("Login", new Login());
			return mav;
		}

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(Login login, Model model, HttpSession session) {
		ModelAndView mav = null;
		String usert = rlService.verifyUser(login);
		if ("admin".equals(usert) || "agent".equals(usert)) {
			session.setAttribute("loginId", login.getLoginId());
			session.setAttribute("username", login.getUsername());
			session.setAttribute("userType", usert);
			String user = (String) session.getAttribute("username");
			System.out.println(user + "at login");
			System.out.println("session iD : " + session.getId());
			System.out.println("Session loginId at controller: " + session.getAttribute("loginId"));
			mav = new ModelAndView("dashboard");
			mav.setViewName("redirect:/dashboard");
			return mav;
		} else {
			mav = new ModelAndView("index");
			mav.addObject("Login", new Login());
			mav.addObject("message", "Please enter valid username and password!");
			return mav;
		}

	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView mainpage(User user, Model model, HttpSession session) {
		ModelAndView mav = null;
		if (!(session.getAttribute("username") == null) && !session.getAttribute("username").equals("")) {
			mav = new ModelAndView("dashboard");
			mav.addObject("Login", new User());
			System.err.println(session.getId());
			mav.addObject("userType", session.getAttribute("userType"));
			return mav;
		} else {
			mav = new ModelAndView("redirect:/login");
			return mav;
		}
	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public ModelAndView aboutpage(User user, Model model, HttpSession session) {
		ModelAndView mav = null;
		mav = new ModelAndView("about");
		return mav;
	}


	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signup(User user, Model model) {
		List<String> userType = rlService.retrieveUserType();
		List<String> usStates = rlService.retrieveStates();
		ModelAndView mav = new ModelAndView("signup");
		mav.addObject("Login", new User());
		mav.addObject("userType", userType);
		mav.addObject("usStates", usStates);
		return mav;
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signup1(User user, Model model) {
		String message = rlService.saveUser(user);
		System.out.print(user);
		List<String> userType = rlService.retrieveUserType();
		List<String> usStates = rlService.retrieveStates();
		ModelAndView mav = new ModelAndView("signup");
		mav.addObject("Login", new User());
		mav.addObject("userType", userType);
		mav.addObject("usStates", usStates);
		mav.addObject("message", message);
		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		mav.setViewName("redirect:/login");
		session.invalidate();
		return mav;
	}
}
