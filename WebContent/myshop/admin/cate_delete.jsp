<%@page import = "my.shop.RcategoryDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
cate_delete.jsp<br>

<%
	String catno = request.getParameter("num");
	System.out.println("catno:"+ catno);
	
	RcategoryDao rcdao = RcategoryDao.getInstance();
	
	try{
		int cnt = rcdao.deleteRcategory(catno);
		
		String msg = "", url="cate_list.jsp";
		
		if(cnt>0){
			msg="카테고리 삭제 성공";
		}
		else{
			msg="카테고리 삭제 실패";
		}
%>
		<script type="text/javascript">
			alert("<%=msg%>");
			location.href="<%=url%>";
		</script>

<%		
	}catch(Exception e){
		
	}
	
%>
