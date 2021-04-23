<%@page import="my.shop.RproductBean"%>
<%@page import="my.shop.RproductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cb" class="my.shop.mall.RcartBean" scope="session"/>

<%
	String pno = request.getParameter("pno");
	String oqty = request.getParameter("oqty");
	System.out.println("상품번호/주문수량:"+pno+"/"+oqty);
	
	RproductDao rpdao = RproductDao.getInstance();
	RproductBean rpbean = rpdao.selectByPno(pno);
	
	if(rpbean.getPqty() < Integer.parseInt(oqty)){
		
		%>
		<script type="text/javascript">
			alert('수량 초과');
			location.href ="mall.jsp";
		</script>
		
		<%
		return;
	}//if
%>

<%
	cb.addRproduct(pno,oqty);
	response.sendRedirect("mall_cartList.jsp");
%>