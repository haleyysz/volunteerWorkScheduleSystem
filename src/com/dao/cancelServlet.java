package com.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.program;
import com.entity.programList;

import util.DBHelper;

/**
 * Servlet implementation class cancelServlet
 */
@WebServlet("/cancelServlet")
public class cancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8"); 
		request.setCharacterEncoding("UTF-8");
		
		int pid = Integer.valueOf(request.getParameter("pid"));
		int isCancel = 1;//true:取消为1
		System.out.println(pid);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
        	conn = DBHelper.getConnection();
        	String sql = "update program set isCancel=? where pid=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,isCancel);
            pstmt.setInt(2,pid);
            pstmt.executeUpdate();
			rs = pstmt.executeQuery();
            response.setContentType("text/html;charset=UTF-8"); 
            PrintWriter out=response.getWriter();
            out.write("<meta http-equiv=\"refresh\" content=\"0;http://localhost:8080/test/manager.jsp\">");
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

}
