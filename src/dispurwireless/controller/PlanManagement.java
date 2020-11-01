package dispurwireless.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dispurwireless.db.DispurWirelessDbUtil;
import dispurwireless.entity.MyPlan;
import dispurwireless.entity.Plan;
import dispurwireless.entity.Profile;

/**
 * Servlet implementation class PlanManagement
 */
@WebServlet("/PlanManagement")
public class PlanManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String theCommand = request.getParameter("command");
		
		
		
		// if the command is missing, then default to listing Customers
		if (theCommand == null) {
			theCommand = "ListPlans";
		}
		
		String adminCommands = "ListPlans"+"-"+"ViewPlan"+"-"+"LoadUpdatePlanForm"+"-"+"-"+"DeletePlan";
		
		String role = (String) request.getSession().getAttribute("role");
		if( adminCommands.contains(theCommand) &&(role==null || !role.equalsIgnoreCase("Admin")) ) {
			
			
			String contextpath = request.getContextPath();
			
			response.sendRedirect(response.encodeRedirectUrl(contextpath+"/access-denied.jsp"));
			return;
		}
		
		String userCommands = "MyPlans";
		
		if( userCommands.contains(theCommand) && role==null  ) {
			
			
			String contextpath = request.getContextPath();
			
			response.sendRedirect(response.encodeRedirectUrl(contextpath+"/login.jsp"));
			return;
		}
		
		// route to the appropriate method
		switch (theCommand) {
		
		case "ListPlans":
			listPlans(request, response);
			break;
		case "LoadUpdatePlanForm":
			loadUpdatePlanForm(request,response);
			break;
		case "ViewPlan":
			viewPlan(request,response);
			break;
		case "DeletePlan":
			deletePlan(request, response);
			break;
		case "ListDataPlans":
			listDataPlans(request,response);
			break;
		case "ListVoicePlans":
			listVoicePlans(request,response);
			break;
		case "MyPlans":
			myPlans(request,response);
			break;
		default:
			listPlans(request, response);
			
		}
		
	}



	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		
		switch(command) {
		case "AddPlan":
			addPlan(request,response);
			break;
		case "SearchPlan":
			searchPlan(request,response);
			break;
		case "UpdatePlan":
			updatePlan(request,response);
			break;
		case "BuyPlan":
			
			buyPlan(request,response);
			break;
		}
		
	}
	
	
	
	
	

	
	

	private void listPlans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Plan> plans = DispurWirelessDbUtil.getPlans();
		

		request.setAttribute("plans",plans);
		
		RequestDispatcher rd = request.getRequestDispatcher("/list-plans-for-admin.jsp");
		rd.forward(request, response);
	}
	
	private void searchPlan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int planId = Integer.parseInt(request.getParameter("planId"));
		
		
		ArrayList<Plan> plans = new ArrayList<Plan>();
		
		Plan plan = DispurWirelessDbUtil.getPlan(planId);
		
		if(plan!=null)
			plans.add(plan);
		
		request.setAttribute("plans",plans);
		RequestDispatcher rd = request.getRequestDispatcher("/list-plans-for-admin.jsp");
		rd.forward(request, response);
		
	}


	private void addPlan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		int tarrif = Integer.parseInt(request.getParameter("tarrif"));
		int validity = Integer.parseInt(request.getParameter("validity"));
		String rental = request.getParameter("rental");
		int price = Integer.parseInt(request.getParameter("price"));
		
		Plan plan = new Plan(name,type,tarrif,validity,rental,price);
		
		DispurWirelessDbUtil.addPlan(plan);
		
		listPlans(request,response);
		
	}
	
	private void loadUpdatePlanForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int planId = Integer.parseInt(request.getParameter("planId"));
		
		Plan plan = DispurWirelessDbUtil.getPlan(planId);
		
		request.setAttribute("plan", plan);
		
		RequestDispatcher rd = request.getRequestDispatcher("/update-plan-form.jsp");
		rd.forward(request, response);
	}


	private void updatePlan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int planId = Integer.parseInt(request.getParameter("planId"));
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		int tarrif = Integer.parseInt(request.getParameter("tarrif"));
		int validity = Integer.parseInt(request.getParameter("validity"));
		String rental = request.getParameter("rental");
		int price = Integer.parseInt(request.getParameter("price"));
		
		Plan plan = new Plan(planId,name,type,tarrif,validity,rental,price);
			
		DispurWirelessDbUtil.updatePlan(plan);
		
		
		listPlans(request,response);
		
	}

	private void viewPlan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int planId = Integer.parseInt(request.getParameter("planId"));
		
		Plan plan = DispurWirelessDbUtil.getPlan(planId);
		
		request.setAttribute("plan", plan);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view-plan.jsp");
		rd.forward(request, response);
		
	}

	private void deletePlan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int planId = Integer.parseInt(request.getParameter("planId"));
		DispurWirelessDbUtil.deletePlan(planId);
		
		listPlans(request,response);
		
	}
	
	private void listDataPlans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rental = request.getParameter("rental");
		if(rental==null)
			rental="No";
		List<Plan> plans = DispurWirelessDbUtil.getPlansForCustomer("Data", rental);
		
		request.setAttribute("type","Data");
		request.setAttribute("rental",rental);
		request.setAttribute("plans", plans);
		
		RequestDispatcher rd = request.getRequestDispatcher("/list-plans-for-customer.jsp");
		rd.forward(request, response);
		
	}

	
	private void listVoicePlans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rental = request.getParameter("rental");
		if(rental==null)
			rental="No";
		List<Plan> plans = DispurWirelessDbUtil.getPlansForCustomer("Voice", rental);
		
		request.setAttribute("type","Voice");
		request.setAttribute("rental",rental);
		request.setAttribute("plans", plans);
		
		RequestDispatcher rd = request.getRequestDispatcher("/list-plans-for-customer.jsp");
		rd.forward(request, response);
		
		
	}
	
	private void buyPlan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int planId = Integer.parseInt(request.getParameter("planId"));
		
		Profile profile = (Profile) request.getSession().getAttribute("profile");
		int regId = profile.getRegId();
		
		
		DispurWirelessDbUtil.buyPlan(regId, planId);
		
		String contextpath = request.getContextPath();
		
		response.sendRedirect(response.encodeRedirectUrl(contextpath+"/home.jsp"));
		return;
		
	}
	
	public void myPlans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Profile profile = (Profile) request.getSession().getAttribute("profile");
		int regId = profile.getRegId();
		
		
		List<MyPlan> myplans = DispurWirelessDbUtil.getMyPlans(regId);
		
	
		
		request.setAttribute("myplans", myplans);
		
		RequestDispatcher rd = request.getRequestDispatcher("/myplans.jsp");
		rd.forward(request, response);
	}

}
