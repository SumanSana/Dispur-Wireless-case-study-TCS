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
import dispurwireless.entity.Profile;
import dispurwireless.entity.Account;
import dispurwireless.entity.MyPlan;

/**
 * Servlet implementation class CustomerManagement
 */
@WebServlet("/CustomerManagement")
public class CustomerManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String role = (String) request.getSession().getAttribute("role");
		if(role==null || !role.equalsIgnoreCase("Admin")) {
			
			String contextpath = request.getContextPath();
			
			response.sendRedirect(response.encodeRedirectUrl(contextpath+"/access-denied.jsp"));
			return;
		}
		
		String theCommand = request.getParameter("command");
		
		// if the command is missing, then default to listing Customers
		if (theCommand == null) {
			theCommand = "ListCustomers";
		}
		
		// route to the appropriate method
		switch (theCommand) {
		
		case "ListCustomers":
			listCustomers(request, response);
			break;	
		case "ViewCustomer":
			viewCustomer(request,response);
			break;
		case "DeleteCustomer":
			deleteCustomer(request, response);
			break;
		
		default:
			listCustomers(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		switch(command) {
		case "RegisterCustomer":
			registerCustomer(request,response);
			break;
		case "UpdateProfile":
			updateProfile(request,response);
			break;
		case "SearchCustomer":
			searchCustomer(request,response);
			break;
		}
	}
	
	
	
	

	private void registerCustomer(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String firstName=request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String contactNumber=request.getParameter("contactNumber");
		
		if(DispurWirelessDbUtil.getProfileByEmail(email)!=null) {
			request.setAttribute("msg","Error : Email id is already present");
			RequestDispatcher rd = request.getRequestDispatcher("/register-form.jsp");
			rd.forward(request,response);
		}
		
		else{
			
			Profile profile = new Profile(firstName,lastName,address,email,contactNumber);
			Account account = new Account(password,"Customer");
			
			
			
			int regId = DispurWirelessDbUtil.registerCustomer(profile, account);
			
			request.setAttribute("msg","Success : You have registered Successfully!<br>Your registration number is : "+regId);
			RequestDispatcher rd = request.getRequestDispatcher("/register-form.jsp");
			rd.forward(request,response);
			
		}
		
		
	}
	
	private void updateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int regId = Integer.parseInt(request.getParameter("regId"));
		String email = request.getParameter("email");
		String firstName=request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String contactNumber=request.getParameter("contactNumber");
		
		Profile profile = new Profile(regId,firstName,lastName,address,email,contactNumber);
		
		int i=DispurWirelessDbUtil.updateProfile(profile);
		if(i>0) {
			request.getSession().setAttribute("profile",profile);
			String contextpath = request.getContextPath();
			response.sendRedirect(response.encodeRedirectUrl(contextpath+"/home.jsp"));
		}
		else {
			request.setAttribute("msg","Error : Some error occured !");
			RequestDispatcher rd = request.getRequestDispatcher("/update-profile-form.jsp");
			rd.forward(request,response);
		}
		
	}
	
	
	

	private void listCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Profile> customers = DispurWirelessDbUtil.getCustomerProfiles();
		
		
		request.setAttribute("customers",customers);
		
		RequestDispatcher rd = request.getRequestDispatcher("/list-customers.jsp");
		rd.forward(request, response);
		
	}
	
	private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int regId = Integer.parseInt(request.getParameter("regId"));
		
		ArrayList<Profile> customers = new ArrayList<Profile>();
		
		Profile profile = DispurWirelessDbUtil.seacrhCustomerProfile(regId);
		
		if(profile!=null)
			customers.add(profile);
		
		request.setAttribute("customers",customers);
		RequestDispatcher rd = request.getRequestDispatcher("/list-customers.jsp");
		rd.forward(request, response);
	}
	
	private void viewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int regId = Integer.parseInt(request.getParameter("regId"));
		
		Profile customer = DispurWirelessDbUtil.getProfile(regId);
		List<MyPlan> customerplans = DispurWirelessDbUtil.getMyPlans(regId);
		
		request.setAttribute("customer",customer);
		request.setAttribute("customerplans",customerplans);
		RequestDispatcher rd = request.getRequestDispatcher("/view-customer.jsp");
		rd.forward(request, response);
		
	}
	
	
	private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int regId = Integer.parseInt(request.getParameter("regId"));
		
		
		DispurWirelessDbUtil.deleteCustomer(regId);
		
		listCustomers(request,response);
		
	}
	



	

}
