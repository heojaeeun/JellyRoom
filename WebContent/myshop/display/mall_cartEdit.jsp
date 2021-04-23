<%@page import="my.shop.RproductBean"%>
<%@page import="my.shop.RproductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="cb" class="my.shop.mall.RcartBean" scope="session"/>

<%
	String pno = request.getParameter("pno");
	String oqty = request.getParameter("oqty");
	System.out.println("mall.cartEdit.jsp pno:"+pno+" oqty:"+oqty);
	
	RproductDao rpdao = RproductDao.getInstance();
	RproductBean rpbean = rpdao.selectByPno(pno);
	
	if(rpbean.getPqty() < Integer.parseInt(oqty)){
		%>
		<script type="text/javascript">
			alert("수량 초과");
			history.back();
		</script>		
		<%
		return;
	}
	cb.setEdit(pno,oqty);
%>

<script>
	/* alert("수량 수정 완료"); */
	location.href="mall_cartList.jsp";
</script>