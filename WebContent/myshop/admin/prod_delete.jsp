<%@page import="java.io.File"%>
<%@page import="my.shop.RproductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

prod_delete.jsp<br>
<%
	String pno = request.getParameter("pno");
	String pimage = request.getParameter("pimage");
	
	String delPath= config.getServletContext().getRealPath("/myshop/images");
	
	File dir = new File(delPath);
	File delFile = new File(dir,pimage);
	
	delFile.delete();
	
	RproductDao rpdao = RproductDao.getInstance();
	int cnt = rpdao.deleteRproduct(pno);
	String msg = "", url="";
	if(cnt>0){
		msg="Successfully deleted!";
		url="prod_list.jsp";
	}else{
		msg="Failed";
		url="prod_list.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>