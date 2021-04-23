<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
<style>
	body{
		text-align:center;
		background-image: url(./../../img/adminback.JPG);
	}
	
	table{
		margin : 0 auto;
	}
	
	.table2{
		background-color: white;
		font-color: black;
	}
</style>

<link rel ="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"/>

<a href="main.jsp">
<font size= 10 color="black">
	<b>Ｈｅｌｌｏ Ｐｅｎｇｕｉｎ</b>
</font>
</a> 
<a href="<%=request.getContextPath() %>/logout.jsp">
	 <img class="logout" src="./../../img/logout1.png" width="50" height="50"/>
</a>
<br><br>

<table class="table2" border="5" width=800 height=400>
	<tr>
		
		<td align="center">
			<a href="cate_list.jsp">
			<font color=black; size=5>
			ℂ𝕒𝕥𝕖𝕘𝕠𝕣𝕪 𝕃𝕚𝕤𝕥
			</font>
			</a>
		</td>
		
	
		<td align="center">
			<a href="<%=request.getContextPath()%>/myshop/admin/prod_list.jsp">
				<font color=black; size=5>
					ℙ𝕣𝕠𝕕𝕦𝕔𝕥 𝕃𝕚𝕤𝕥
				</font>
			</a>
		</td>
		
		<td align="center">
			<a href="shopping_list.jsp">
				<font color=black; size=5>
					𝕊𝕙𝕠𝕡𝕡𝕚𝕟𝕘 𝕃𝕚𝕤𝕥
				</font>
			</a>
		</td>
		
		<td align="center">
			<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">
				<img class="jr" src="./../../img/jellyroom.png" width="150" height="70"/>
			</a>
		</td>
		
	</tr>
	
	<tr height="320">