package com.entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBHelper;

public class admin {
	private int adminId;
	private String adminUsername;
	private String adminPassword;
	
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getAdminUsername() {
		return adminUsername;
	}
	public void setAdminUsername(String adminUsername) {
		this.adminUsername = adminUsername;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public  boolean validate() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;

		try {
			conn = DBHelper.getConnection();
			String sql = "select * from admin where adminUsername=? and adminPassword=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminUsername);
			pstmt.setString(2, adminPassword);
			rs = pstmt.executeQuery();
			if(rs.next()){
				adminUsername=rs.getString("adminUsername");
				result = true;
			}else{
				result = false;
			}
		} catch (Exception ex) {
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
		return result;
	}
}
