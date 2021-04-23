<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.RproductBean"%>
<%@page import="my.shop.RproductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%@include file="mall_top.jsp"%>
<style>
	.buynow{
		align: right;
	}
</style>

<script type="text/javascript">
	function goCart(pno){
		var oqty = document.f.oqty.value;
		location.href="mall_cartAdd.jsp?pno="+pno+"&oqty="+oqty;
	}
	
	function goOrder(pno){
		
		document.f.action="mall_order.jsp?pno="+pno;
		document.f.submit();
	}
</script>

<%
	DecimalFormat df = new DecimalFormat("###,###");
	String pno = request.getParameter("pno");
	RproductDao rpdao = RproductDao.getInstance();
	RproductBean rpbean = rpdao.selectByPno(pno);
	String imgPath = request.getContextPath()+"/myshop/images/"+rpbean.getPimage();
	
%>
<link rel = "stylesheet" type = "text/css" href = "<%=contextPath%>/style.css">
<form name="f" method="post">
<table width="100%" border=0 class="outline">
	<tr>
		<td align="center" class="m3">
			<img src="<%=imgPath%>" width="280" height="280">
		</td>
		<td align="left">
			<font color=black size=8>
				<b><%=rpbean.getPname() %>[<%=pno %>]</b>
			</font>
			<br><br><br>
		
				<font color=black size=6>
					<b>Name: </b>
					<%=rpbean.getPname() %>
				</font><br><br>
				<font color=black size=6>
					<b>Price: </b>
					<%=df.format(rpbean.getPrice()) %> 원
				</font><br><br>
				<font color=orange size=6>
					<b>Point: </b>
					<%=rpbean.getPoint() %> point
				</font><br><br>
				<font color=black size=6>
					<b>Qty: </b>
				</font>
					
					<select name="oqty" >
					<%
						int oqty = rpbean.getPqty();
						if(oqty==0){
							%>
								<option value="">No Product left</option>
							<%
						}//if
						else{
							for(int i=1; i<=oqty; i++){
								%>
									<option value="<%=i%>"><%=i %></option>
								<%
							}//for
						}//else
					%>
					</select>
					
				
					<tr  width="150" height="200" valign="top">
						<td>
							<font color=black size=6>
								<b>Detail</b><br>
								<font color=black size=5>
									<%=rpbean.getPcontents() %>
								</font>
								
							</font>
						
						</td>
						<td>
							<a href="javascript:goCart('<%=rpbean.getPno() %>')">
								<img src="./../../img/AddToCart.png" width=240 height=100>
							</a><br>
							<a href="javascript:goOrder('<%=rpbean.getPno() %>')">
								<img class="buynow" src="./../../img/BuyNow.png" width=240 height=100>
							</a>
						</td>
					</tr>
					
			
					
					
					
			</form>
		</td>
	</tr>
</table>
</form>

<%@ include file="mall_bottom.jsp" %>
