package com.dao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.*;
/**
 * Servlet implementation class loginDao
 */
@WebServlet("/loginDao")
public class loginDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginDao() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8"); 
		request.setCharacterEncoding("UTF-8"); 
        
		String adminUsername = request.getParameter("adminUsername");
		String adminPassword = request.getParameter("adminPassword");
		
		String vname = request.getParameter("vname");
		String vpassword = request.getParameter("vpassword");
		
		String mname = request.getParameter("mname");
		String mpassword = request.getParameter("mpassword");
		
		
		if(adminUsername != null){
			//admin
	        admin admin0 = new admin();
	        admin0.setAdminUsername(adminUsername);
	        admin0.setAdminPassword(adminPassword);
	        System.out.println("username: " + request.getParameter("adminUsername")+ ", password: " +request.getParameter("adminPassword"));
	        
	        if(admin0.validate())
	        {
	        	request.getSession().setAttribute("admin", adminUsername);
	        	request.getRequestDispatcher("admin.jsp").forward(request, response);
	        }
	        else
	        {
	        	request.getSession().setAttribute("message", "wrong username or password!");
	        	request.getSession().setMaxInactiveInterval(1);
	        	response.sendRedirect(request.getContextPath()+"/index.jsp");
	        	return;
	        }
		}
        
		if(vname != null){
			//volunteer
	        volunteer v = new volunteer();
	        volunteerList vt = new volunteerList();
	        volunteer vvt = vt.findIdByName(vname);
	        v.setVname(vname);
	        v.setVpassword(vpassword);
	        
	        
	        System.out.println("username: " + request.getParameter("vname")+ ", password: " +request.getParameter("vpassword"));
	        
	        if(v.validate())
	        {
	        	int id = vvt.getVid();
		        System.out.println("vname = " + vname + ", vid =" + id);
	        	request.getSession().setAttribute("volunteer", vname);
	        	request.getSession().setAttribute("vid",id);
	        	request.getRequestDispatcher("volunteer.jsp").forward(request, response);
	        	
	        }
	        else
	        {
	        	request.getSession().setAttribute("message", "Wrong username or password!");
	        	request.getSession().setMaxInactiveInterval(1);
	        	response.sendRedirect(request.getContextPath()+"/index.jsp");
	        	return;
	        }
		}
        
        
		if(mname != null){
			//manager
	        manager manager0 = new manager();
	        manager0.setMname(mname);
	        manager0.setMpassword(mpassword);
	        System.out.println("username: " + request.getParameter("mname")+ ", password: " +request.getParameter("mpassword"));
	        
	        if(manager0.validate())
	        {
	        	request.getSession().setAttribute("manager", mname);
	        	request.getRequestDispatcher("manager.jsp").forward(request, response);
	        }
	        else
	        {
	        	request.getSession().setAttribute("message", "Wrong username or password!");
	        	request.getSession().setMaxInactiveInterval(1);
	        	response.sendRedirect(request.getContextPath()+"/index.jsp");
	        	return;
	        }
		}
        
	}

}
