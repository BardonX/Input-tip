package com.px.searchdemo.sysmanager.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.px.searchdemo.sysmanager.util.DbUtil;

public class Search extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String text=req.getParameter("text");
		String sql="select text from library where (spell like '%"+text+"%') or (text like '%"+text+"%')";
	    List<Map<String, Object>> queryForList = DbUtil.queryForList(sql);
	    JSONArray object=JSONArray.fromObject(queryForList);
	    resp.getWriter().print(object);
	}
	
	

}
