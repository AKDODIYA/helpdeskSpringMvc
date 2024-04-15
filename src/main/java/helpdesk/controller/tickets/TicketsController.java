package helpdesk.controller.tickets;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import helpdesk.model.registerandlogin.Login;
import helpdesk.model.tickets.Tickets;
import helpdesk.service.tickets.TicketsService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

@Controller

public class TicketsController {

	@Autowired
	private TicketsService ticketsService;

	public void setTicketService(TicketsService ticketsService) {
		this.ticketsService = ticketsService;
	}

	@RequestMapping(value = "/dashboard/ticket/create", method = RequestMethod.POST)
	public ModelAndView createTicket(Tickets tickets, Model model, HttpSession session) {
		ModelAndView mav = null;
		if (session.getAttribute("username") != null && !session.getAttribute("username").equals("")) {
			System.out.println("session iD : " + session.getId());
			System.out.println("session loginID at tickets COntroller: " + session.getAttribute("loginId"));
			String username = (String) session.getAttribute("username");

			int loginId = (int) session.getAttribute("loginId");

			System.out.println("login id at createTicket : " + loginId);


			mav = new ModelAndView("tickets");
			mav.addObject("ticket", new Tickets());
			mav.addObject("ticketId", TicketsService.randomAlphaNumeric(6));
			mav.addObject("loginId", session.getAttribute("loginId"));
			mav.addObject("category", ticketsService.retrieveCategory());
			if (ticketsService.saveTicket(tickets, loginId, username)) {
				mav.addObject("message", "success");
				return mav;
			} else {
				mav.addObject("message", "error");
				return mav;
			}
		} else {
			mav = new ModelAndView("index");
			mav.addObject("Login", new Login());
			return mav;
		}

	}

	@RequestMapping(value = "/dashboard/ticket")
	public ModelAndView displayCreateTicket(HttpSession session) {
		ModelAndView mav=null;
		if (session.getAttribute("username") != null && !session.getAttribute("username").equals("")) {
			System.out.println((String) session.getId());
			mav = new ModelAndView("tickets");
			mav.addObject("ticket", new Tickets());
			mav.addObject("ticketId", TicketsService.randomAlphaNumeric(6));
			mav.addObject("loginId", session.getAttribute("loginId"));
			mav.addObject("category", ticketsService.retrieveCategory());
			return mav;
		} else {
			mav = new ModelAndView("index");
			mav.addObject("Login", new Login());
			return mav;
		}
		
	}

	@ResponseBody
	@RequestMapping(value = "/dashboard/displayTickets")
	public String myTickets(HttpSession session) {
		System.out.println("at displayTickets - my tickets");
		System.out.println(session.getId());
		int loginId = (int) session.getAttribute("loginId");
		System.out.println(loginId + "at mytickets- displaytickets");
		List<Tickets> myTickets = ticketsService.retrieveTicketsData(loginId);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(myTickets);
		return jsonArray;
	}

	@ResponseBody
	@RequestMapping(value = "/loadSubCat", method = RequestMethod.POST)
	public String loadSubCat(@RequestBody JsonObject js) {
		System.out.println(js);
		String category = js.get("category").toString().replaceAll("\"", "");
		System.out.println(category);
		List<String> subCategory = ticketsService.retrieveSubCategory(category);
		String subCategoryHtmlStr = "";
		for (String subC : subCategory) {
			subCategoryHtmlStr += "<option value = '" + subC + "'>" + subC + "</option>";

		}
		return subCategoryHtmlStr;
	}

}
