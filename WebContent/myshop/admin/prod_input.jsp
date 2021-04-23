<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.shop.*, java.util.*"%>
    
<%@include file="top.jsp" %>
<td colspan=6 align=center>
<form name="f" action="prod_inputProc.jsp" method="post" enctype="multipart/form-data">
<table border=0 class=outline width="600">
<caption align="top"><font size=6><b>𝑨𝒅𝒅 𝑷𝒓𝒐𝒅𝒖𝒄𝒕𝒔</b></font></caption>
	<tr>
		<th class="m2">Name</th>
		<td align=left>
		<input type="text" name="pname" value="Name">
		
	</tr>

	<tr>
		<th class="m2">Category</th>
		<td align=left>
			<select name="pcategory">
			<%
				RcategoryDao rcdao = RcategoryDao.getInstance();
				ArrayList<RcategoryBean> lists = rcdao.getAllRcategory();
				if(lists.size() ==0){
					%>
						<option value="">No Category</option>
					<%
				}
				else{
					for(RcategoryBean rcbean : lists){
						String catname = rcbean.getCatname();
					%>
						<option value="<%=catname%>">[<%=catname%>]</option>
					<%
					}//for
				}
			%>
			</select>
			
		</td>
	</tr>
	
	<tr>
		<th class="m2">Company</th>
		<td align=left>
			<input type=text name="pcompany" value="Jelly Room">
		</td>
	</tr>
	
	<tr>
		<th class="m2">Image</th>
		<td align=left>
			<input type=file name="pimage">
		</td>
	</tr>
	
	<tr>
		<th class="m2">Type</th>
		<td align=left>
			<select name="pref" >
				<option value="Cozy">Cozy
				<option value="Cheerful">Cheerful
				<option value="Romantic">Romantic
				<option value="Beautiful">Beautiful
				<option value="Modern">Modern
				<option value="Cute">Cute
			</select>
		</td>
	</tr>
	
	<tr>
		<th class="m2">Quantity</th>
		<td align=left>
			<input type=text name="pqty"  maxlength=8 value="15">
		</td>
	</tr>
	
	<tr>
		<th class="m2">Price</th>
		<td align=left>
		<input type=text name="price" maxlength=8 value="50000">
		</td>
	</tr>
	
	<tr>
		<th class="m2">Point</th>
		<td align=left><input type=text name="point" value="50"></td>
	</tr>
	
	<tr>
		<th class="m2">About This Product</th>
		<td align=left>
		<textarea name="pcontents" rows=5 cols=50 style="resize: none;">Jelly Room 제품</textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan=2 class="m1" align="center">
		<input type=submit value="Register">
		<input type=reset value="Cancel">
		</td>
	</tr>
	
</table>

</form>
</td>
<%@include file="bottom.jsp" %>