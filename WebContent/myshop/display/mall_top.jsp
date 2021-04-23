<%@page import="my.shop.RcategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.RcategoryDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript">
	
</script>


<style>
	.top{
		margin-left: 5px;
		
		
	}
	.jellyroom{
		margin-left: auto;
		margin-right: auto;
	}
	body{
		background-image: url(./wall1.PNG);
	}
	.table1{
		background-color: white;
	}
	
	
</style>

<%
 	String contextPath = request.getContextPath();
	String rmid = (String)session.getAttribute("rmid");
	String rmname = (String)session.getAttribute("rmname");
	System.out.println("rmid:" + rmid);
	
%>

<link rel = "stylesheet" type = "text/css" href = "<%=contextPath%>/style.css">

<table align=center width = "770px" >
	<tr>
		<td align=center>
			<a href ="mall.jsp">
			<img class="jellyroom" src="<%=contextPath%>/img/jellyroom.png" width="550" height="230"/>
			</a>
		</td>
	</tr>
</table>
<table class = "table1" border="3" width = "770px" align = "center">
	
	<tr height=50>
		<td colspan ="2" align = "center">
			
			<b>
				<a href = "<%=contextPath%>/login.jsp"><font color = black size=5>𝕃𝕠𝕘𝕚𝕟</font></a>|
				<a href="company.jsp"><font color = black size=5>𝔸𝕓𝕠𝕦𝕥 𝕌𝕤</font></a> | 
				
				<a href="./../member/edit.jsp">
				<img class="top" src="<%=contextPath%>/img/edit.PNG" width="50" height="50"/>
				</a>
				
				<a href="mall_cartList.jsp">
				<img class="top" src="<%=contextPath%>/img/cart.PNG" width="50" height="50"/>
				</a>
				
				<a href="./../../logout.jsp">
				<img class="top" src="<%=contextPath%>/img/logout1.png" width="50" height="50"/>
				</a>
			</b>
			<span class="logout">
			<%try{
					if(rmid.equals("penguinabc123")){
					%>
						<a href ="./../admin/main.jsp">
							<font color=black size=5>✿ℍ𝕖𝕝𝕝𝕠, <%=rmname%>!✿</font>
						</a>		
					<%
					}else{
				
				%>
					<font color=black size=5>✿ℍ𝕖𝕝𝕝𝕠, <%=rmname%>!✿</font>
				
				<% 
					}
			}catch(Exception e){
				
			}
			%>
		
			
			</span>
	
		</td>
	
	</tr>
	
	<tr>
		<td width=180px align = center valign = "top">
			<table width=600px>
				<tr>
					<font size=7 color=pink>𝔻𝕖𝕤𝕚𝕘𝕟 𝕪𝕠𝕦𝕣 𝕠𝕨𝕟 𝕤𝕡𝕒𝕔𝕖❕</font>
				</tr>
				<tr align=center>
				<% 
					RcategoryDao rcdao = RcategoryDao.getInstance();
					ArrayList<RcategoryBean> lists = rcdao.getAllRcategory();
					if(lists.size()==0){
						out.print("<tr><td>등록된 카테고리 없음</td></tr>");
					}
					int cnt =0;
					for(RcategoryBean rcbean : lists){
						cnt++;
						String catname = rcbean.getCatname();
						int catno = rcbean.getCatno();
				%>
					
						
							<td>
								<a href="<%=contextPath%>/myshop/display/mall_cgList.jsp?catname=<%=catname%>">
									<font color="black" size=4>
										<b>♡<%=catname%>♡</b>
									</font>
									
								</a>
							</td>
						<%
							if(cnt%3==0){
								out.print("</tr><tr align=center>");
							}
					
					}//for
					
				%>
				</tr>	
			</table>
		</td>
	</tr>
	<tr>
		
		<td width= 590px align=center valign="top">
		
	
	
