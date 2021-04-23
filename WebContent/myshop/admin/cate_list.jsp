<%@page import="my.shop.RcategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.RcategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
	RcategoryDao rcdao = RcategoryDao.getInstance();
	ArrayList<RcategoryBean> lists = rcdao.getAllRcategory();
%>

<%@include file="top.jsp" %>

		<td align="center">
			<a href="cate_input.jsp">
				<img class="jr" src="./../../img/IMG_2913.PNG" width="200" height="200"/>
			</a>
		</td>
		
		<td colspan="6" align="center" valign="top">
			<table border="1" width="500" class="outline">
				<caption align="top"><font size=6><b>𝑪𝒂𝒕𝒆𝒈𝒐𝒓𝒚 𝑳𝒊𝒔𝒕</b></font></caption>
				<tr bgcolor="gray">
					<th width="15%">Number</th>
					<th width="75%">Category Name</th>
					<th width="10%">Delete</th>
				</tr>
			<%
				if(lists.size() ==0){
					out.print("<tr><td colspan='4' align='center'>No Category.</td></tr>");
				}else{
					for(int i=0; i<lists.size(); i++){
						RcategoryBean bean = lists.get(i);
			%>
						<tr>
							<td align="right"><%=bean.getCatno() %></td>
							<td align="center"><%=bean.getCatname()%></td>
							<td align="center"><a href="cate_delete.jsp?num=<%=bean.getCatno()%>">Delete</a>
						</tr>
			<%
				}//for
				}//else
			%>
				
				
			</table>
		</td>
		
	</tr>	
</table>

<%@include file="bottom.jsp" %>