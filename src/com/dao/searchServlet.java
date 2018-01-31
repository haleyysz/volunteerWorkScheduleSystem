package com.dao;

import java.util.*;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.program;
import com.entity.programList;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class searchServlet
 */
@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static List<String> pnames = new ArrayList<String>();
	static programList programlist = new programList();
	static ArrayList<program> list = programlist.getAllPrograms();
	
	static{
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
			program pg = list.get(i);
			pnames.add(pg.getPintro());
			}
		}
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//获得keyword
		String keyword = request.getParameter("keyword");
		System.out.println(keyword);
		//处理数据
		List<String> listData = getData(keyword);
		//
		response.getWriter().write(JSONArray.fromObject(listData).toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	public List<String> getData(String keyword){
		List<String> list = new ArrayList<String>();
		
		for(String data:pnames){
			if(data.contains(keyword)){
				list.add(data);
			}
		}
		return list;
	}

}
