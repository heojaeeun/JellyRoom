<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.RproductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@include file="mall_top.jsp"%>

<jsp:useBean id="cb" class="my.shop.mall.RcartBean" scope="session"/>

<%
	DecimalFormat df = new DecimalFormat("###,###");
	ArrayList<RproductBean> rclist = cb.getAllRproducts();
	System.out.println("mall_cartList.jsp rclist: "+ rclist.size());
	
	int cartTotalPrice = 0;
	int cartTotalPoint = 0;
%>
<%
	if(rclist.size()==0){
		
%>
	<table border=1 width=770px>
		<tr>
			<td align="center">
				선택한 상품 없음.
			</td>
		</tr>
	</table>
<%
	}else{
		for(RproductBean rpbean : rclist){
%>
		<table border="4" width="60%" align="left">
			<tr>
				<td align="left">
					<font color="black" size=5>
						<b>Name[No] :</b> <%=rpbean.getPname()%>[<%=rpbean.getPno()%>]
					</font>
				</td>
			</tr>
			
			<tr>
				<td align="left">
					<form name="f" method="post" action="mall_cartEdit.jsp">
						<font color="black" size=5><b>Qty :</b> </font> 
						<input type="text" name="oqty" size="6" value="<%=rpbean.getPqty() %>"> 
						<input type="hidden" name="pno" value="<%=rpbean.getPno() %>">
						<input type="submit" value="Edit">
					</form>
				</td>
			</tr>
			<tr>
				<td align="left">
					<font color="black" size=5>
						<b>Price :</b> <%=df.format(rpbean.getPrice()) %>원
					</font>
				</td>
			</tr>
			<tr>
				<td align="left">
					<font color="red" size=5>
						<b>Total Price :</b> <%=df.format(rpbean.getTotalPrice()) %>원
					</font>
				</td>
			</tr>
				<tr>
				<td align="left">
					<font color="orange" size=5>
						<b>Total Point :</b> <%=rpbean.getTotalPoint() %>point
					</font>
				</td>
			</tr>
			<%
				String imgPath = request.getContextPath()+"/myshop/images/"+rpbean.getPimage();
			%>
			
		</table>
		<img src ="<%=imgPath %>" width=240 height=240/>
<%			
		cartTotalPrice += rpbean.getTotalPrice();
		cartTotalPoint += rpbean.getTotalPoint();
		}//for
	}//else
%>
	<table border="1" width=770px align="center">
		<tr>
			<td align=right>
				<font size=7 color=black>
					<b>Total Price :</b>
					<%=df.format(cartTotalPrice)%>원 
				</font>
			</td>
			<td align=right>
				<font size=7 color=orange>
					<b>Total Point :</b>
					<%=cartTotalPoint %>point
				</font>
			</td>  
		</tr>
		
		<tr>
			<td align=center>
					<a href="javascript:history.go(-2)">
						<font size=5 color=black>
							<b>Back to the Mall</b>
						</font>
					</a>
			</td>  
			<td align=center>
					<a href="mall_order.jsp?pno=00&oqty=00">
						<font size=5 color=black>
							<b>주문하기</b>
						</font>
					</a>
			</td>
			
		</tr>
	
	</table>


<%@include file="mall_bottom.jsp"%>
