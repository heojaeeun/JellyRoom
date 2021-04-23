<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.RproductBean"%>
<%@page import="my.shop.RproductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <br>

<%@ include file="mall_top.jsp" %>
	
	<%
		DecimalFormat df = new DecimalFormat("###,###");
		String rmpref = (String)session.getAttribute("rmpref");
		
		
		String[] mood = {"Cozy", "Cheerful", "Romantic", "Beautiful", "Modern"};
		RproductDao rpdao = RproductDao.getInstance();
		for(int i=0; i<mood.length; i++){
			ArrayList<RproductBean> rplists = rpdao.selectByPpref(mood[i]);		
			System.out.println("rplist.size():" + rplists.size());
			
			System.out.println("=================--------============");
			System.out.println("rmpref:"+rmpref);
			
	%>
		<hr color = black width=100%>
	
	
		<%
	
				if(rmpref.equals(mood[i])){
					
			%>
					<font color=pink size=6><b>✭✭✭✭✭✭✭</b></font>
					<font color= black size=6><b><%=mood[i] %></b></font>
					<font color=pink size=6><b>✭✭✭✭✭✭✭</b></font>
			<%
				/* 	out.print("  <b>recommend</b>"); */
				}else{
					
					
			%>
					<font color= black size=6><b><%=mood[i] %></b></font>
			<%
				}
		
		
	
		%>
		<hr color = black width=100%>
	<%
			if(rplists.size()==0){
				out.print("<b> No "+mood[i]+" Product<b>");
				
			}
			else{
	%>
				<br>
				<table border="0" width="100%" align="center">
					<tr>
						<%
							int count=0;
							for(RproductBean rpbean : rplists){
								count++;
								String pimage= rpbean.getPimage();
								String pname = rpbean.getPname();
								int price = rpbean.getPrice();
								int point = rpbean.getPoint();
								int pno = rpbean.getPno();
								String imgPath = request.getContextPath()+"/myshop/images/"+pimage;
						%>
								<td align="center">
									<a href ="mall_prodView.jsp?pno=<%=pno%>">
										<img src="<%=imgPath%>" width="220" height="220"> <br>
									</a>
									<%=pname %><br>
									<font color="orange"><%=df.format(price)%></font>원<br>
									<font color="purple"><%=point %></font>point <br>
								</td>
						<%
								if(count%3 ==0){
									out.print("</tr><tr>");
								}
							}
							
							
						%>
					</tr>
				</table>
				
	<%			
			}
	
		}//for
	%>
	


<%@ include file="mall_bottom.jsp" %>