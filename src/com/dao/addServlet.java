package com.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.*;

import util.DBHelper;

/**
 * Servlet implementation class addServlet
 */
@WebServlet("/addServlet")
public class addServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String id1 = request.getParameter("vid").toString();
		String id2 = request.getParameter("pid").toString();
		int vid = Integer.valueOf(id1);
		int pid = Integer.valueOf(id2);
		int isCancel = 0;
		int isSignup = 1;
		int isPass = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
        	conn = DBHelper.getConnection();
        	String sql = "insert into request(pid,vid,isCancel,isSign,isPass)"+"values(?,?,?,?,?)";
        	System.out.println(sql);
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setInt(1, pid);
        	pstmt.setInt(2, vid);
        	pstmt.setInt(3, isCancel);
        	pstmt.setInt(4, isSignup);
        	pstmt.setInt(5, isPass);
            pstmt.executeUpdate();
			
            response.setContentType("text/html;charset=UTF-8"); 
            PrintWriter out=response.getWriter();
            out.write("<meta http-equiv=\"refresh\" content=\"0;http://localhost:8080/test/volunteer.jsp\">");
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
//		requestList requestlist = new requestList();
//		int status = 1;
//		System.out.println("vid = " + vid + ", pid = " + pid);
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = DBHelper.getConnection();
//			String sql = "insert into request(pid,vid,status)"+"values(?,?,?)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, pid);
//			pstmt.setInt(2, vid);
//			pstmt.setInt(3, status);
//			pstmt.executeUpdate();
//			System.out.println(sql);
//			
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.flush();
//			out.close();
//
//		} catch (Exception ex) {
//			// TODO Auto-generated catch block
//			ex.printStackTrace();
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//					pstmt = null;
//				} catch (Exception ex) {
//					ex.printStackTrace();
//				}
//			}
//		}
}
