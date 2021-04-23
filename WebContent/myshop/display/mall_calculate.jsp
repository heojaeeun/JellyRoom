<%@page import="my.shop.RproductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cb" class="my.shop.mall.RcartBean" scope="session"/>
<jsp:useBean id="order" class="my.shop.mall.RordersDao" scope="session"/>

<%
	ArrayList<RproductBean> cv = cb.getAllRproducts();
	
	int rmno = (Integer)session.getAttribute("rmno");
	
	int cnt = order.insertOrders(cv, rmno);
	
	String msg="", url="";
	
	if(cnt>0){
		msg = "주문 완료";
		cb.removeAllProduct();
	%>
		<script type="text/javascript">
			alert('<%=msg%>')
			
			var answer = confirm('계속 쇼핑 하시겠습니까?')
			if(answer){
				location.href="mall.jsp";
			}
			else{
				location.href="<%=request.getContextPath()%>/logout.jsp";
			}
		</script>
	
	<%
	
	}
	else{
		msg="주문 실패";
		url="mall.jsp";
	%>
		<script type="text/javascript">
			alert('<%=msg%>');
			location.href="<%=url%>";
		</script>
	
	<%
	}
	
	
%>