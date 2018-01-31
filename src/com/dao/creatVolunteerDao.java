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

import com.entity.volunteer;
import util.DBHelper;

public class creatVolunteerDao extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public creatVolunteerDao() {
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
		
		String vname = request.getParameter("vname");
		String vpassword = request.getParameter("vpassword");
		String vsex = request.getParameter("vsex");
		String vage = request.getParameter("vage");
		String vtel = request.getParameter("vtel");
		String vemail = request.getParameter("vemail");
		
        Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
        	conn = DBHelper.getConnection();
            String sql="insert into volunteer(vname,vpassword,vsex,vage,vtel,vemail)"+"values(?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, vname);
            pstmt.setString(2, vpassword);
            pstmt.setString(3, vsex);
            pstmt.setString(4, vage);
            pstmt.setString(5, vtel);
            pstmt.setString(6, vemail);
            pstmt.executeUpdate();
            
            sql = "select * from volunteer where vname=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vname);
			rs = pstmt.executeQuery();
			rs.next();

            response.setContentType("text/html;charset=UTF-8"); 
            PrintWriter out=response.getWriter();
//            out.write("<h1 align='center'>");
//            out.write("Submit Successfully!");
//            out.write("</h1>");
//            out.write("<h2 align='center'>");
//            out.write("Go back in 3 seconds...");
//            out.write("</h2>");
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
