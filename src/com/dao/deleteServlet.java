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

import com.entity.volunteer;
import com.entity.volunteerList;

import util.DBHelper;

/**
 * Servlet implementation class volunteerServlet
 */
@WebServlet("/volunteerServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String action;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public deleteServlet() {
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
//		response.setContentType("text/html");
//		response.setCharacterEncoding("UTF-8");
//		request.setCharacterEncoding("UTF-8");
//
//		String vid = request.getParameter("vid");
//		System.out.println(vid);
//
//		if (request.getParameter("action") != null) {
//			this.action = request.getParameter("action");
//			if (action.equals("deleteV")) {
//
//				Connection conn = null;
//				PreparedStatement pstmt = null;
//				ArrayList<volunteer> list = new ArrayList<volunteer>();
//				try {
//					conn = DBHelper.getConnection();
//					String sql = "delete from volunteer where vid = '" + vid + "'";
//					System.out.println(sql);
//					pstmt = conn.prepareStatement(sql);
//					int rs = pstmt.executeUpdate();
//
//					response.setContentType("text/html;charset=UTF-8");
//					PrintWriter out = response.getWriter();
//					out.write("<script>window.location.reload();</script>");
//					// out.write("<h1 align='center'>");
//					// out.write("Submit Successfully!");
//					// out.write("</h1>");
//					// out.write("<h2 align='center'>");
//					// out.write("Go back in 3 seconds...");
//					// out.write("</h2>");
//					// out.write("<meta http-equiv=\"refresh\"
//					// content=\"3;http://localhost:8080/test/admin.jsp\">");
//					out.close();
//
//				} catch (Exception ex) {
//					// TODO Auto-generated catch block
//					ex.printStackTrace();
//				} finally {
//					if (pstmt != null) {
//						try {
//							pstmt.close();
//							pstmt = null;
//						} catch (Exception ex) {
//							ex.printStackTrace();
//						}
//					}
//				}
//			}
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String vid = request.getParameter("vid");
		String mid = request.getParameter("mid");
		String pid = request.getParameter("pid");
		String rid = request.getParameter("rid");
		System.out.println("vid = " + vid);
		System.out.println("mid = " + mid);
		System.out.println("pid = " + pid);
		System.out.println("rid = " + rid);
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBHelper.getConnection();
			
			if(vid != null){
				String sql = "delete from volunteer where vid = '" + vid + "'";
				System.out.println(sql);
				pstmt = conn.prepareStatement(sql);
			}
			if(mid != null){
				String sql = "delete from manager where mid = '" + mid + "'";
				System.out.println(sql);
				pstmt = conn.prepareStatement(sql);
			}
			if(pid != null){
				String sql = "delete from program where pid = '" + pid + "'";
				System.out.println(sql);
				pstmt = conn.prepareStatement(sql);
			}
			if(rid != null){
				String sql = "delete from request where rid = '" + rid + "'";
				System.out.println(sql);
				pstmt = conn.prepareStatement(sql);
			}
			
			int rs = pstmt.executeUpdate();
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
	        out.flush();  
	        out.close();
	        out.write("delete successfully!");

		} catch (Exception ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
					pstmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
}