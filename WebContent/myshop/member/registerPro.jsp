<%@page import="my.member.RmemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

registerPro.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rmbean" class="my.member.RmemberBean"/>
<jsp:setProperty property="*" name="rmbean"/>

<%
	RmemberDao rmdao = RmemberDao.getInstance();
int cnt = rmdao.insertRdata(rmbean);
	String msg ="", url="";
	if(cnt>0){
		msg="가입 성공";
		url = request.getContextPath()+"/login.jsp";
	}
	else{
		msg = "가입 실패";
		url = "register.jsp";
		//url = request.getContextPath()+"/myshop/member/register.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>" + "했습니다.");
	location.href = "<%=url%>";
</script>

 