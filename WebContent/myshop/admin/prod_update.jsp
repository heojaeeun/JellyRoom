<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="my.shop.*, java.util.*"%>

prod_update.jsp<br>

<%
	String pno = request.getParameter("pno");
	RproductDao rpdao = RproductDao.getInstance();
	RproductBean rpbean = rpdao.selectByPno(pno);
	System.out.println("=========================");
	System.out.println("pno:" + pno);
%>
<%@include file="top.jsp" %>
<td colspan=6 align=center>
<form name="f" action="prod_updateProc.jsp" method="post" enctype="multipart/form-data">

<input type=hidden name="pno" value="<%=rpbean.getPno()%>">

<table border=0 class=outline width="600">
<caption align="top"><font size=6><b>𝑼𝒑𝒅𝒂𝒕𝒆</b></font></caption>
	<tr>
		<th class="m2">Name</th>
		<td align=left>
		<input type="text" name="pname" value="<%=rpbean.getPname()%>">
		
	</tr>

	<tr>
		<th class="m2">Category</th>
		<td align=left>
			<input type="text" name="pcategory" value="<%=rpbean.getPcategory()%>"readonly>
			
		</td>
	</tr>
	
	<tr>
		<th class="m2">Company</th>
		<td align=left>
			<input type=text name="pcompany" value="<%=rpbean.getPcompany()%>">
		</td>
	</tr>
	
	<tr>
		<th class="m2">Image</th>
		<td align=left>
<%
	String pimage = request.getContextPath()+"/myshop/images";
%>
			<img src = "<%=pimage%>/<%=rpbean.getPimage()%>" width="100" height="100"/>
			
			<input type=file name="pimage">
			<input type="text" name="pimage2" value="<%=rpbean.getPimage()%>">
		</td>
	</tr>
	
	<tr>
		<th class="m2">Type</th>
		<td align=left>
			<select name="pref" >
			
				<option value="Cozy"  <%if(rpbean.getPref().equals("Cozy")){  %> selected <% } %>   >Cozy</option>
				<option value="Cheerful"  <%if(rpbean.getPref().equals("Cheerful")){  %> selected <% } %>   >Cheerful</option>
				<option value="Romantic"  <%if(rpbean.getPref().equals("Romantic")){  %> selected <% } %>   >Romantic</option>
				<option value="Beautiful"  <%if(rpbean.getPref().equals("Beautiful")){  %> selected <% } %>   >Beautiful</option>
				<option value="Modern"  <%if(rpbean.getPref().equals("Modern")){  %> selected <% } %>   >Modern</option>
				<option value="Cute"  <%if(rpbean.getPref().equals("Cute")){  %> selected <% } %>   >Cute</option>
				
			</select>
		</td>
	</tr>
	
	<tr>
		<th class="m2">Quantity</th>
		<td align=left>
			<input type=text name="pqty"  maxlength=8 value="<%=rpbean.getPqty()%>">
		</td>
	</tr>
	
	<tr>
		<th class="m2">Price</th>
		<td align=left>
		<input type=text name="price" maxlength=8 value="<%=rpbean.getPrice()%>">
		</td>
	</tr>
	
	<tr>
		<th class="m2">Point</th>
		<td align=left><input type=text name="point" value="<%=rpbean.getPoint()%>"></td>
	</tr>
	
	<tr>
		<th class="m2">About This Product</th>
		<td align=left>
		<textarea name="pcontents" rows=5 cols=50 style="resize: none;"><%=rpbean.getPcontents() %></textarea>
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