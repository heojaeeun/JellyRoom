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
	
	table2{
		background-color: white;
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

<table class = "table2" width=800 height=400>
	
	<tr>
		
		<td align="center">
			<a href="cate_list.jsp">
				<img class="cl" src="./../../img/categoryList.PNG" width="250" height="250"/>
			</a>
		</td>
		
	
		<td align="center">
			<a href="<%=request.getContextPath()%>/myshop/admin/prod_list.jsp">
				<img class="pl" src="./../../img/productList.PNG" width="250" height="250"/>
			</a>
		</td>
	</tr>
	<tr>
		<td align="center">
			<a href="shopping_list.jsp">
				<img class="sl" src="./../../img/shoppingList.png" width="250" height="250"/>
			</a>
		</td>
		
		<td align="center">
			<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">
				<img class="jr" src="./../../img/jellyroom.png" width="370" height="210"/>
			</a>
		</td>
		
	</tr>
	

</table>