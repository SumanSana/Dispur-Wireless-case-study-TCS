package dispurwireless.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dispurwireless.db.DispurWirelessDbUtil;
import dispurwireless.entity.Profile;



@WebServlet("/LogIn")
public class LogIn extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int regId = Integer.parseInt(request.getParameter("regId"));
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		String role=DispurWirelessDbUtil.verifyLogin(regId, password);
		if(role!=null)		
		{ 
					Profile profile = DispurWirelessDbUtil.getProfile(regId);
					session.setAttribute("profile",profile);
					session.setAttribute("role",role);
					String contextPath = request.getContextPath();
					response.sendRedirect(response.encodeRedirectURL(contextPath + "/home.jsp"));
					
					
		}
		else 
		{
			
		    request.setAttribute("error", "Invalid Credentials");
		    
		    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		    rd.forward(request, response); 
		} 
	}
}