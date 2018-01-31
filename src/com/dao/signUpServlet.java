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
@WebServlet("/signServlet")
public class signUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public signUpServlet() {
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
		int isSignup = 1;
		
		volunteerList volunteerlist = new volunteerList();
        volunteer vt = volunteerlist.findNameById(vid);
        String vname = vt.getVname();
        String vemail = vt.getVemail();
        
		programList programlist = new programList();
		program pg = programlist.findNameById(pid);
		String pintro = pg.getPintro();
		String pnum = pg.getPnum();
		String pdate = pg.getPdate();
		String pstart = pg.getPstart();
		String pend = pg.getPend();
		String plocation = pg.getPlocation();
		int isCancel = 0;
		int isPass = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
        	conn = DBHelper.getConnection();
        	String sql = "insert into program(vid,vname,vemail,pintro,pnum,pdate,pstart,pend,plocation,isCancel,isSignup,isPass)"+"values(?,?,?,?,?,?,?,?,?,?,?,?)";
        	System.out.println(sql);
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setInt(1, vid);
        	pstmt.setString(2, vname);
        	pstmt.setString(3, vemail);
            pstmt.setString(4, pintro);
            pstmt.setString(5, pnum);
            pstmt.setString(6, pdate);
            pstmt.setString(7, pstart);
            pstmt.setString(8, pend);
            pstmt.setString(9, plocation);
            pstmt.setInt(10, isCancel);
            pstmt.setInt(11, isSignup);
            pstmt.setInt(12, isPass);
            pstmt.executeUpdate();
			
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
