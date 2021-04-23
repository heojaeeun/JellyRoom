<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.RproductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.RproductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
DecimalFormat df = new DecimalFormat("###,###");
%>
<script type = "text/javascript">
	function checkDel(pno,pimage){
		var answer = confirm("정말 삭제하시겠습니까?");
		if(answer){
			location.href = "prod_delete.jsp?pno="+pno+"&pimage="+pimage;
		}
	}
</script>

<%@include file="top.jsp" %>
	
	<td align = "center">
		<a href = "prod_input.jsp">
			<img class="jr" src="./../../img/IMG_2912.PNG" width="200" height="200"/>
		</a>
	</td>
	
	<td colspan="6" align="center">
		<table border=0 width="99%" class="outline">
			<caption align="top"><font size=6><b>𝑷𝒓𝒐𝒅𝒖𝒄𝒕 𝑳𝒊𝒔𝒕</b></font></caption>
			<tr class="m2">
				<th>Number</th><!-- pno -->
				<th>Name</th><!-- pname -->
				<th>Category</th><!-- pcategory -->
				<th>Image</th><!-- pimage -->
				<th>Type</th><!-- pref -->
				<th>Company</th><!-- pcompany -->
				<th>Quantity</th><!-- pqty -->
				<th>Price</th><!-- price -->
				<th>Edit/Delete</th>
			</tr>
			<%
		
			RproductDao rpdao = RproductDao.getInstance();
			ArrayList<RproductBean> list = rpdao.getAllRproducts();
			
		try{
			if(list.size() == 0){
				out.print("<tr><td colspan=8>등록한 상품이 없습니다.</td></tr>");
				
			}else{
				for(RproductBean rprod : list){
					
			%>
					<tr>
						<td align="center"><%=rprod.getPno() %></td>
						<td align="center"><%=rprod.getPname() %></td>
						<td align="center"><%=rprod.getPcategory() %></td>
						<td align="center">
						<%
						String imgPath = request.getContextPath()+"/myshop/images/"+rprod.getPimage();
						System.out.println("imgPath:" + imgPath);
						%>
							<img src="<%=imgPath%>" width=40 height=40>
						</td>
						<td align="center"><%=rprod.getPref() %></td>
						<td align="center"><%=rprod.getPcompany() %></td>
						<td align="center"><%=rprod.getPqty() %></td>
						<td align="center"><%=df.format(rprod.getPrice()) %></td>
						<td>
							<a href = "prod_update.jsp?pno=<%=rprod.getPno()%>">Edit /</a>
							<a href="javascript:checkDel('<%=rprod.getPno()%>','<%=rprod.getPimage()%>')">Delete</a>
							
						</td>
						
					</tr>
			
			<%
			
				}//for
			}//else
		}catch(Exception e){
			
		}
			
			%>
			
		</table>
	</td>
<%@include file="bottom.jsp" %>
  