<%@page import= "java.util.ArrayList" %>
<%@page import="my.member.RmemberDao"%>
<%@page import="my.member.RmemberBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
 	int rmno = (Integer)session.getAttribute("rmno");
 	System.out.println("-------======================------");
/* 	System.out.println("rmno: "+no);
 */%>

<jsp:useBean id="rmbean" class="my.member.RmemberBean" scope="session"/>
<jsp:setProperty property="*" name="rmbean"/>

<%	
	String msg ="";
	String url ="";
	
	

	System.out.println("rmno: "+rmno);

	String name= request.getParameter("name");
	System.out.println("name: "+name);
	
	String id= request.getParameter("id");
	System.out.println("id: "+id);
	
	String password= request.getParameter("password");
	System.out.println("password: "+password);
	
	String gender= request.getParameter("gender");
	System.out.println("gender: "+gender);
	
	String age= request.getParameter("age");
	System.out.println("age: "+age);
	
	String hp1= request.getParameter("hp1");
	System.out.println("hp1: "+hp1);
	
	String hp2= request.getParameter("hp2");
	System.out.println("hp2: "+hp2);
	
	String hp3= request.getParameter("hp3");
	System.out.println("hp3: "+hp3);
	
	String email= request.getParameter("email");
	System.out.println("email: "+email);
	
	String country= request.getParameter("country");
	System.out.println("country: "+country);
	
	String pref= request.getParameter("pref");
	System.out.println("pref: "+pref);
	
	RmemberDao rmdao = RmemberDao.getInstance();
	
	int cnt = rmdao.updateRmember(name, id, password, gender, age, hp1, hp2, hp3, email, country, pref,rmno);
	
	System.out.println("cnt: "+cnt);
	
	if(cnt>0){
		msg="개인정보 수정 성공";
		url="../display/mall.jsp";
	}else{
		msg="수정 실패";
		url="edit.jsp";
	}
	
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>