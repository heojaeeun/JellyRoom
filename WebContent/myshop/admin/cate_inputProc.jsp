<%@page import = "my.shop.RcategoryDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

cate_inputProc.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="rcbean" class="my.shop.RcategoryBean"/>
<jsp:setProperty property="*" name="rcbean"/>

<%
	RcategoryDao rcdao =RcategoryDao.getInstance();
	int cnt= rcdao.insertRcategory(rcbean);
	String msg="", url="";
	if(cnt>0){
		msg="카테고리 등록 성공";
		url="cate_list.jsp";
	}else{
		msg="카테고리 등록 실패";
		url="cate_input.jsp";
	}
%>
<script>
	alert("<%=msg%>" + "했습니다.");
	location.href="<%=url%>";
</script>