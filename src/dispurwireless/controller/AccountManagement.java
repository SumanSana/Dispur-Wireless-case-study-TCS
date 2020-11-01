package dispurwireless.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dispurwireless.db.DispurWirelessDbUtil;
import dispurwireless.entity.Profile;

/**
 * Servlet implementation class AccountManagemet
 */
@WebServlet("/AccountManagement")
public class AccountManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		switch(command) {
		case "ChangePassword":
			changePassword(request,response);
			break;
		}
	}

	private void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldPassword = request.getParameter("oldPassword");
		String newPassword1 = request.getParameter("newPassword1");
		String newPassword2 = request.getParameter("newPassword2");
		Profile profile =(Profile) request.getSession().getAttribute("profile");
		
		if(DispurWirelessDbUtil.verifyLogin(profile.getRegId(),oldPassword)==null) {
			request.setAttribute("msg","Error : You have entered wrong old password ");
			RequestDispatcher rd = request.getRequestDispatcher("/change-password-form.jsp");
			rd.forward(request, response);
		}
		else {
			DispurWirelessDbUtil.changePassword(profile.getRegId(), newPassword1);
			String contextpath = request.getContextPath();
			response.sendRedirect(response.encodeRedirectUrl(contextpath+"/home.jsp"));
		}
	}

}
