<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList" %>
<%@page import="my.shop.RproductBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="mall_top.jsp"%>

<jsp:useBean id="cb" class="my.shop.mall.RcartBean" scope="session"/>

<%
	DecimalFormat df = new DecimalFormat("###,###");
	String pno = request.getParameter("pno");
	String oqty = request.getParameter("oqty");
	System.out.println("mall_order.jsp pno:"+pno+", oqty:"+oqty);
	
 	if(!pno.equals("00") && !oqty.equals("00")){ // 즉시구매하기, 장바구니구매 아님!
		cb.addRproduct(pno, oqty);
	} 
%>

<table width="90%" border="1" align="center" class="outline">
	<tr>
		<td colspan="4" align="center">
			<font size=6><b>The Shopping List</b></font>
		</td>
	</tr>
	<tr>
		
		<th width="25%">Category</th>
		<th width="40%">Name</th>
		<th width="10%">Qty</th>
		<th width="25%">Price</th>
		
	</tr>
	
	<%
	int totalPrice = 0;
	ArrayList<RproductBean> cv = cb.getAllRproducts();
	for(RproductBean rpbean : cv){
	%>
		<tr>
			<td><%=rpbean.getPcategory() %></td>
			
			<td><%=rpbean.getPname() %></td>
			<td><%=rpbean.getPqty() %></td>
			<td><%=df.format(rpbean.getPrice()) %></td>
		</tr>
	<%
		totalPrice += rpbean.getTotalPrice();
	}//for
	%>
	<tr>
		<td colspan=4 align="right">
			<font color="black" size=6>
				<b>Total Price: </b>
				<%=df.format(totalPrice) %>원
			</font>
			
		</td>
	</tr>
</table>
<br>
<input type="button" value="Back" align="right" onClick="javascript:history.go(-2)">

<input type="button" value="Confirm" align= "right" onClick="location.href='mall_calculate.jsp'">
<br>

<%@ include file="mall_bottom.jsp"%>