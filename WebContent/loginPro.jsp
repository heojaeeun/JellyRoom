<%@page import="my.member.RmemberBean"%>
<%@page import="my.member.RmemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

loginPro.jsp!!<br>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	System.out.println("id:" + id);
	RmemberDao rmdao = RmemberDao.getInstance();
	RmemberBean rmember = rmdao.getRmemberInfo(id, password);
	
	String viewPage = null;
	
	if(rmember != null){
		String rmid = rmember.getId();
		String rmname = rmember.getName();
		String rmpref = rmember.getPref();
		
		session.setAttribute("rmpref",rmpref);
		session.setAttribute("rmid",rmid);
		session.setAttribute("rmname",rmname);
		session.setAttribute("rmno", rmember.getNo());
		
		System.out.println("rmid:" + rmid);
		System.out.println("rmname:" + rmname);
		System.out.println("rmpref:" + rmpref);
		
		if(rmid.equals("penguinabc")){
			viewPage = request.getContextPath()+"/myshop/admin/main.jsp";
		}
		else{ // 일반 사용자
			viewPage = request.getContextPath()+"/myshop/display/mall.jsp";
		}
	}
	else{
%>
		<script type="text/javascript">
			alert("가입하지 않은 회원입니다.");
		</script>
<%		
		viewPage = "login.jsp";//로그인페이지
	}//
	
	
%>

<script type = "text/javascript">
	location.href = "<%=viewPage%>";
</script>

