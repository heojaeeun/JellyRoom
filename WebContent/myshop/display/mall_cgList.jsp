<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.RproductBean"%>
<%@page import="my.shop.RproductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="mall_top.jsp" %>     

<%
	request.setCharacterEncoding("UTF-8");
	String catname = request.getParameter("catname");
	System.out.println("mall_cgList.jsp catname:"+catname);
	
	DecimalFormat df = new DecimalFormat("###,###");
	
	RproductDao rpdao = RproductDao.getInstance();
	ArrayList<RproductBean> rplists = rpdao.selectByRcategory(catname);
	
%>

	<hr color=black width=100%>
	<font color=black size=5><%=catname %></font>
	<hr color=black width=100%>
	
	<%
	if(rplists.size()==0){
		out.print("<b>No product from "+catname+"</b>");
	}
	else{
	%>
	<br>
	<table width=100% border = 1>
		<tr>
			<%
			int count =0;
			for(RproductBean rpbean : rplists){
				count++;
				String pimage = rpbean.getPimage();
				String pname = rpbean.getPname();
				int price = rpbean.getPrice();
				int point = rpbean.getPoint();
				int pno = rpbean.getPno();
				String imgPath = request.getContextPath()+"/myshop/images/"+pimage;
			%>
				<td align="center">
					<a href="mall_prodView.jsp?pno=<%=pno%>">
						<img src="<%=imgPath%>" width=220 height=220><br>	
					</a>
					<%=pname %><br>
					<font color="orange"><%=df.format(price) %></font>원<br>
					<font color="blue"><%=df.format(point) %></font>point<br>
				</td>
			<%
				if(count%3==0){
					out.print("</tr><tr>");
				}//if
			}//for
			%>
		</tr>
	</table>
	
	<%
	}
	%>
	
<%@ include file="mall_bottom.jsp" %>