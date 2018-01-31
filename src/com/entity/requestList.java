package com.entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBHelper;

public class requestList {
		
	public ArrayList<request> getAllRequests() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<request> list = new ArrayList<request>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from request";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				request r = new request();
				r.setRid(rs.getInt("rid"));
				r.setPid(rs.getInt("pid"));
				r.setVid(rs.getInt("vid"));
				r.setIsCancel(rs.getInt("isCancel"));
				r.setIsSign(rs.getInt("isSign"));
				r.setIsPass(rs.getInt("isPass"));
				list.add(r);
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
	public ArrayList<request> findAllByPid(int pid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<request> list = new ArrayList<request>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from request where pid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, pid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				request r = new request();
				r.setRid(rs.getInt("rid"));
				r.setPid(rs.getInt("pid"));
				r.setVid(rs.getInt("vid"));
				r.setIsCancel(rs.getInt("isCancel"));
				r.setIsSign(rs.getInt("isSign"));
				r.setIsPass(rs.getInt("isPass"));
				list.add(r);
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
	public ArrayList<request> findAllByVid(int vid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<request> list = new ArrayList<request>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from request where vid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, vid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				request r = new request();
				r.setRid(rs.getInt("rid"));
				r.setPid(rs.getInt("pid"));
				r.setVid(rs.getInt("vid"));
				r.setIsCancel(rs.getInt("isCancel"));
				r.setIsSign(rs.getInt("isSign"));
				r.setIsPass(rs.getInt("isPass"));
				list.add(r);
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

}
