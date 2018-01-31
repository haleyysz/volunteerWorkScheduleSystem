package com.entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBHelper;
import java.util.ArrayList;

public class volunteerList {

	public ArrayList<volunteer> getAllVolunteers() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<volunteer> list = new ArrayList<volunteer>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from volunteer";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				volunteer vt = new volunteer();
				vt.setVid(rs.getInt("vid"));
				vt.setVname(rs.getString("vname"));
				vt.setVpassword(rs.getString("vpassword"));
				vt.setVsex(rs.getString("vsex"));
				vt.setVage(rs.getString("vage"));
				vt.setVtel(rs.getString("vtel"));
				vt.setVemail(rs.getString("vemail"));
				list.add(vt);
			}
			return list;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
			// TODO: handle exception
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
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
	
	public ArrayList<volunteer> findAllByVid(int vid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<volunteer> list = new ArrayList<volunteer>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from volunteer where vid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, vid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				volunteer vt = new volunteer();
				vt.setVid(rs.getInt("vid"));
				vt.setVname(rs.getString("vname"));
				vt.setVpassword(rs.getString("vpassword"));
				vt.setVsex(rs.getString("vsex"));
				vt.setVage(rs.getString("vage"));
				vt.setVtel(rs.getString("vtel"));
				vt.setVemail(rs.getString("vemail"));
				list.add(vt);
				}
				return list;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
			// TODO: handle exception
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
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
	
	public volunteer findIdByName(String vname) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from volunteer where vname = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, vname);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				volunteer vt = new volunteer();
				vt.setVid(rs.getInt("vid"));
				vt.setVname(rs.getString("vname"));
				vt.setVpassword(rs.getString("vpassword"));
				vt.setVsex(rs.getString("vsex"));
				vt.setVage(rs.getString("vage"));
				vt.setVtel(rs.getString("vtel"));
				vt.setVemail(rs.getString("vemail"));
				return vt;
				}else{
					return null;
				}
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
			// TODO: handle exception
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
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
	
	public volunteer findNameById(int vid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from volunteer where vid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, vid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				volunteer vt = new volunteer();
				vt.setVid(rs.getInt("vid"));
				vt.setVname(rs.getString("vname"));
				vt.setVpassword(rs.getString("vpassword"));
				vt.setVsex(rs.getString("vsex"));
				vt.setVage(rs.getString("vage"));
				vt.setVtel(rs.getString("vtel"));
				vt.setVemail(rs.getString("vemail"));
				return vt;
				}else{
					return null;
				}
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
			// TODO: handle exception
		} finally {
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
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