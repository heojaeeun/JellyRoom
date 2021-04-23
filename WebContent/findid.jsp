<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css" />
<style>
	body{
			background-image: url(./img/adminback.JPG);
	}
	.regi{
		background-color:white;
	}
	.jellyroom{
		margin-left: auto;
		margin-right: auto;
	}
</style>


<table align=center width = "770px" >
	<tr>
		<td align=center>
			<a href ="login.jsp">
			<img class="jellyroom" src="./img/jellyroom.png" width="550" height="230"/>
			</a>
		</td>
	</tr>
</table>

<form action="findidProc.jsp" method="post">
<table border="1" align="center">
	<tr>
		<td bgcolor="Orange" align="center"><font size=4><b>Name</b></font></td>
		<td><input type="text" name="name" value="">
	</tr>
	<tr>
		<td bgcolor="Orange" align="center"><font size=4><b>Phone Number 8 digits</b></font></td>
		<td>
			<input type="text" name="hp2" maxlength="4" size="4" value="" >
			-
			<input type="text" name="hp3" maxlength="4" size="4" value="" >
		</td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="purple" align="center">
			<input type="submit" value="ID Search">
		</td>
	</tr>
</table>
</form>