package com.entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBHelper;

public class programList {
	public ArrayList<program> getAllPrograms() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<program> list = new ArrayList<program>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from program";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				program pg = new program();
				pg.setPid(rs.getInt("pid"));
				pg.setPintro(rs.getString("pintro"));
				pg.setPnum(rs.getString("pnum"));
				pg.setPdate(rs.getString("pdate"));
				pg.setPstart(rs.getString("pstart"));
				pg.setPend(rs.getString("pend"));
				pg.setPlocation(rs.getString("plocation"));
				pg.setIsCancel(rs.getInt("isCancel"));
				pg.setIsSignup(rs.getInt("isSignup"));
				pg.setIsPass(rs.getInt("isPass"));
				list.add(pg);
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
	public ArrayList<program> findAllByPid(int pid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<program> list = new ArrayList<program>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from program where pid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, pid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				program pg = new program();
				pg.setPid(rs.getInt("pid"));
				pg.setPintro(rs.getString("pintro"));
				pg.setPnum(rs.getString("pnum"));
				pg.setPdate(rs.getString("pdate"));
				pg.setPstart(rs.getString("pstart"));
				pg.setPend(rs.getString("pend"));
				pg.setPlocation(rs.getString("plocation"));
				pg.setIsCancel(rs.getInt("isCancel"));
				pg.setIsSignup(rs.getInt("isSignup"));
				pg.setIsPass(rs.getInt("isPass"));
				list.add(pg);
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
	public program findNameById(int pid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from program where pid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, pid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				program pg = new program();
				pg.setPid(rs.getInt("pid"));
				pg.setPintro(rs.getString("pintro"));
				pg.setPnum(rs.getString("pnum"));
				pg.setPdate(rs.getString("pdate"));
				pg.setPstart(rs.getString("pstart"));
				pg.setPend(rs.getString("pend"));
				pg.setPlocation(rs.getString("plocation"));
				pg.setIsCancel(rs.getInt("isCancel"));
				pg.setIsSignup(rs.getInt("isSignup"));
				pg.setIsPass(rs.getInt("isPass"));
				return pg;
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