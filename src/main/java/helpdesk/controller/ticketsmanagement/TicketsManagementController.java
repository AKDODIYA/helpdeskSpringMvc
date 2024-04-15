package helpdesk.controller.ticketsmanagement;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import helpdesk.dao.ticketsmanagement.TicketsManagementDao;
import helpdesk.model.tickets.Tickets;
import helpdesk.service.ticketsmanagment.TicketsManagementService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class TicketsManagementController {
	
	@Autowired
TicketsManagementService ticketsMngService;
	
	@Autowired
	TicketsManagementDao ticketsMngDao;
	
		
	@ResponseBody
	@RequestMapping(value="/approvedTickets",method = RequestMethod.POST)
	public String approvedTickets(){
		List<Tickets> approvedTickets = ticketsMngService.retrieveApprovedTickets();
		for(Tickets t: approvedTickets){
		System.out.println(t + "at approvedTickets ticketsMngController");
		}
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(approvedTickets);
		return jsonArray;
	}
	@ResponseBody
	@RequestMapping(value="/approvedTicketsCount",method = RequestMethod.POST)
	public String approvedTicketsCount(){
		List<Tickets> approvedTickets = ticketsMngService.retrieveApprovedTickets();
		String count= approvedTickets.size()+"";
		return count;
	}
	
	@ResponseBody
	@RequestMapping(value="/pendingTickets",method = RequestMethod.POST)
	public String pendingTickets(){
		List<Tickets> pendingTickets = ticketsMngService.retrievePendingTickets();
		for(Tickets t: pendingTickets){
		System.out.println(t + "at pendingTickets ticketsMngController");
		}
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(pendingTickets);
		return jsonArray;
	}
	@ResponseBody
	@RequestMapping(value="/pendingTicketsCount",method = RequestMethod.POST)
	public String pendingTicketsCount(){
		List<Tickets> pendingTickets = ticketsMngService.retrievePendingTickets();
		String count= pendingTickets.size()+"";
		return count;
	}
	
	@ResponseBody
	@RequestMapping(value="/rejectedTickets",method = RequestMethod.POST)
	public String rejectedTickets(){
		List<Tickets> rejectedTickets = ticketsMngService.retrieveRejectedTickets();
		for(Tickets t: rejectedTickets){
		System.out.println(t + "at rejectedTickets ticketsMngController");
		}
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonArray = gson.toJson(rejectedTickets);
		return jsonArray;
	}
	@ResponseBody
	@RequestMapping(value="/rejectedTicketsCount",method = RequestMethod.POST)
	public String rejectedTicketsCount(){
		List<Tickets> rejectedTickets = ticketsMngService.retrieveRejectedTickets();
		String count= rejectedTickets.size()+"";
		return count;
	}
	
	@ResponseBody
	@RequestMapping(value="/approve",method=RequestMethod.GET)
	public void approveTickets(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam("val") int ticketId, @RequestParam("comment") String comments){
		System.out.println("at approve");
		
		ticketsMngDao.approveTickets("approved", ticketId, comments);
	}
	
	@ResponseBody
	@RequestMapping(value="/reject",method=RequestMethod.GET)
	public void rejectTickets(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam("val") int ticketId, @RequestParam("comment") String comments){
		ticketsMngDao.rejectTickets("rejected", ticketId, comments);
	}
}
