<%@page import="my.member.RmemberBean"%>
<%@page import="my.member.RmemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name= request.getParameter("name");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	
	RmemberDao rmdao = RmemberDao.getInstance();
	RmemberBean rmbean = rmdao.getMemberByIdAndName(id, name, hp2, hp3);
	String msg="", url="";
	if(rmbean == null){
		msg = "회원 정보가 존재하지 않습니다.";
	}
	else{
		msg = rmbean.getPassword();
	}
	url = request.getContextPath() + "/login.jsp";
	
%>
<script type = "text/javascript">
	alert("회원님의 비밀번호는 <%=msg%>"+" 입니다.");
	location.href = "<%=url%>";
</script>