package com.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBHelper;

public class creatManagerDao extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public creatManagerDao() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8"); 
		request.setCharacterEncoding("UTF-8");
		
		String mname = request.getParameter("mname");
		String mpassword = request.getParameter("mpassword");
		String msex = request.getParameter("msex");
		String mage = request.getParameter("mage");
		String mtel = request.getParameter("mtel");
		String memail = request.getParameter("memail");
		
        Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
        	conn = DBHelper.getConnection();
            String sql="insert into manager(mname,mpassword,msex,mage,mtel,memail)"+"values(?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mname);
            pstmt.setString(2, mpassword);
            pstmt.setString(3, msex);
            pstmt.setString(4, mage);
            pstmt.setString(5, mtel);
            pstmt.setString(6, memail);
            pstmt.executeUpdate();
            
            sql = "select * from manager where mname=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mname);
			rs = pstmt.executeQuery();
			rs.next();

            response.setContentType("text/html;charset=UTF-8"); 
            PrintWriter out=response.getWriter();
            out.write("<meta http-equiv=\"refresh\" content=\"0;http://localhost:8080/test/admin.jsp\">");
            out.flush();
            out.close();
            
        }catch (Exception ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		} finally{
			if(rs!=null){
				try{
					rs.close();
					rs = null;
				}catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			if(pstmt!=null){
				try{
					pstmt.close();
					pstmt = null;
				}catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
