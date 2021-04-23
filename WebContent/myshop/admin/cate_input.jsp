<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function getInput(){
		
		if()
	}
</script>
<%@include file="top.jsp" %>
	<td colspan="6" align="center">
	<form action="cate_inputProc.jsp" method="post" name="myform">
		<table border="5" width="500" align="center">
			<font size=6 color="orange"><b>Ａｄｄ Ｃａｔｅｇｏｒｙ</b></font><br>
			
			<tr>
				<td bgcolor="orange" align="center"><font size=4><b>Category Name</b></font></td>
				<td><input type="text" name="catname"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center" bgcolor="purple">
					<input type="submit" value="Register"  onClick="return getInput()">
					<input type="reset" value="Cancel">
				</td>
			</tr>
			
		</table>
	</form>
	</td>
	
<%@include file="bottom.jsp" %>