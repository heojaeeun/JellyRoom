<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.mall.RordersBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="top.jsp" %>

<jsp:useBean id="obean" class="my.shop.mall.RordersBean"/>
<jsp:useBean id="order" class="my.shop.mall.RordersDao" scope="session"/>

<%
String memid = request.getParameter("memid");
System.out.println("shopping_list.jsp memid:"+memid);
	
	ArrayList<RordersBean> lists = null;
	
	if(memid != null){
		lists = order.getOrderList(memid);
	}
	
%>

<td colspan="6" align="center" valign="top">
	
	<table border=1 width="800">
		
		<tr>
		
			<td colspan=5 align="center">
		
				<form method="post" action="shopping_list.jsp">
					<font size=4><b>𝑰𝑫:</b></font>
					<input type="text" name="memid" value="">
					<input type="submit" value="Search">
				</form>
			</td>
		</tr>
		<tr bgcolor="d5d5d5" align="center">
			<td><font size=4><b>𝑵𝒂𝒎𝒆</b></font></td>
			<td><font size=4><b>𝑰𝑫</b></font></td>
			<td><font size=4><b>𝑷𝒓𝒐𝒅𝒖𝒄𝒕</b></font></td>
			<td><font size=4><b>𝑸𝒕𝒚</b></font></td>
			<td><font size=4><b>𝑷𝒓𝒊𝒄𝒆</b></font></td>
		
		</tr>
		<%
		DecimalFormat df = new DecimalFormat("###,###");
		int total = 0;
		if(lists != null){
			for( RordersBean ob : lists){
		%>
				<tr>
					<td align="center"><%=ob.getMname() %></td>
					<td align="center"><%=ob.getMid() %></td>
					<td align="center"><%=ob.getPname() %></td>
					<td align="right"><%=ob.getQty() %></td>
					<td align="right">￦<%=df.format(ob.getAmount()) %></td>
				</tr> 
		<%
				total += ob.getAmount();
			} // for
		} // if
	%>
		<tr>
			<td colspan="4" align="center">총합</td>
			<td align="right">￦<%=df.format(total) %></td>
		</tr>
	</table>
</td>
<%@include file="bottom.jsp" %>
