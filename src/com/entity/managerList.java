package com.entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBHelper;
import java.util.ArrayList;

public class managerList {
	
	public ArrayList<manager> getAllManagers() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<manager> list = new ArrayList<manager>();
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from manager";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				manager mg = new manager();
				mg.setMid(rs.getInt("mid"));
				mg.setMname(rs.getString("mname"));
				mg.setMpassword(rs.getString("mpassword"));
				mg.setMsex(rs.getString("msex"));
				mg.setMage(rs.getString("mage"));
				mg.setMtel(rs.getString("mtel"));
				mg.setMemail(rs.getString("memail"));
				list.add(mg);
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