package com.entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBHelper;

public class volunteer {
	
	private int vid;
	private String vname;
	private String vpassword;
	private String vsex;
	private String vage;
	private String vtel;
	private String vemail;
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVpassword() {
		return vpassword;
	}
	public void setVpassword(String vpassword) {
		this.vpassword = vpassword;
	}
	public String getVsex() {
		return vsex;
	}
	public void setVsex(String vsex) {
		this.vsex = vsex;
	}
	public String getVage() {
		return vage;
	}
	public void setVage(String vage) {
		this.vage = vage;
	}
	public String getVtel() {
		return vtel;
	}
	public void setVtel(String vtel) {
		this.vtel = vtel;
	}
	public String getVemail() {
		return vemail;
	}
	public void setVemail(String vemail) {
		this.vemail = vemail;
	}
	public  boolean validate() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;

		try {
			conn = DBHelper.getConnection();
			String sql = "select * from volunteer where vname=? and vpassword=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vname);
			pstmt.setString(2, vpassword);
			rs = pstmt.executeQuery();
			if(rs.next()){
				vname = rs.getString("vname");
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
