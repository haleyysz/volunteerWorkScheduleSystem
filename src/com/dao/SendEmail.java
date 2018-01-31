package com.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.mail.util.MailSSLSocketFactory;

import util.DBHelper;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 * Servlet implementation class SendEmail
 */
@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		  String email = request.getParameter("email");
		  String pname = request.getParameter("pname");
		  String plocation = request.getParameter("plocation");
		  String pdate = request.getParameter("pdate");
		  String ptime = request.getParameter("ptime");
		  String vname = request.getParameter("vname");
		  System.out.println(email);
		  
		  // 收件人的电子邮件 ID
//	      String to = email;
	 
	      // 发件人的电子邮件 ID
	      String from = "haleyysz@qq.com";
	 
	      // 获取系统的属性
	      Properties props = System.getProperties();
	 
	      // 设置邮件服务器
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.host", "smtp.qq.com");
	      props.put("mail.smtp.port", "587");
	      props.put("mail.username", "haleyysz@qq.com");
	      props.put("mail.password", "zxloookzrtitbfha");
	 
	      // 获取默认的 Session 对象
	      Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {  
              protected PasswordAuthentication getPasswordAuthentication() {  
                  return new PasswordAuthentication("haleyysz@qq.com",  
                          "zxloookzrtitbfha");
              }  
          });
	      session.setDebug(true);

	      try{
	         // 创建一个默认的 MimeMessage 对象
	         MimeMessage message = new MimeMessage(session);
	         // 设置 From: header field of the header.
	         message.setFrom(new InternetAddress(from));
	         // 设置 To: header field of the header.
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
	         // 设置 Subject: header field
	         message.setSubject("Inform of Service Request");
	         // 现在设置实际消息
	         message.setText("Congratulations," + vname +"! You have signed for " + pname + " in " + plocation + ", on " + pdate + " at " + ptime + ". We are glad to meet you there soon!");
	         // 发送消息
	         Transport.send(message);
	         
	         // 设置响应内容类型
		     response.setContentType("text/html;charset=UTF-8");
		     PrintWriter out = response.getWriter();
	         out.close();
	         out.write("send successfully");
	         out.close();
	         
//	         String title = "Sending Email...";
//	         String res = "Send Successfully!";
//	         String docType = "<!DOCTYPE html> \n";
//	         out.write(docType +
//	         "<html>\n" +
//	         "<head><title>" + title + "</title></head>\n" +
//	         "<body bgcolor=\"#f0f0f0\">\n" +
//	         "<h1 align=\"center\">" + title + "</h1>\n" +
//	         "<p align=\"center\">" + res + "</p>\n" +
//	         "</body></html>");
	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	      }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}
}
