<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="style.css" />

<style>
	body{
		background-image: url(./img/wall2.PNG);
	}
	.table3{
		background-color: white;
	}
</style>



	<table align=center>
		<tr>
			<td colspan=2>
			
				<img class="jellyroom" src="./img/jellyroom.png" width="550" height="230"/>
			
			</td>
		</tr>
	</table>
	
<form action="loginPro.jsp" method="post">	
	
	
	<table class="table3" align=center border=1 >
		
		<tr>
			<td bgcolor="white" align="center">ID</td>
			<td><input type="text" name="id" value="penguinabc"></td>
		</tr>
		
		<tr>
			<td bgcolor="white" align="center">PASSWORD</td>
			<td><input type="password" name="password" value="1234"></td>
		</tr>
		
		<tr>
			<td colspan=2 bgcolor="white">
				<input type="submit" value="login">
				<input type="button" value="Sign up" onClick="location.href='myshop/member/register.jsp'">
				<input type="button" value="Find ID" onClick="location.href='findid.jsp'">
				<input type="button" value="Find PW" onClick="location.href='findpwd.jsp'">
			</td>
		</tr>
	</table>
</form>






