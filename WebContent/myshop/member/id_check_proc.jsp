<%@page import="my.member.RmemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String userid = request.getParameter("userid");
	System.out.println("userid:" + userid);
	
	RmemberDao rmdao = RmemberDao.getInstance();
	boolean isCheck = rmdao.searchId(userid); 
	String str = "";
	if(isCheck == true){
		str = "NO";
		out.print(str);
	}
	else{
		str = "YES";
		out.print(str);
	}
%>
