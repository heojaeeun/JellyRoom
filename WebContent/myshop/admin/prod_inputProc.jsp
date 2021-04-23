<%@page import="my.shop.RproductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

prod_inputProc.jsp<br>
<%-- 
<%
	request.setCharacterEncoding("UTF-8");
%>
 --%>
 
<%

String uploadDir = config.getServletContext().getRealPath("/myshop/images");
// 주의할 사항 : 
System.out.println("uploadDir:" + uploadDir);
//uploadDir:C:\JSP_ysy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\15_Minimall\myshop\images
 
String requestFolder = request.getContextPath()+"/myshop/images";
System.out.println("requestFolder:" + requestFolder);
//requestFolder:/15_Minimall/myshop/images

	MultipartRequest mr = new MultipartRequest(request,
												uploadDir,
												1024*1024*10,
												"UTF-8",
												new DefaultFileRenamePolicy());

	String pname = request.getParameter("pname");
	System.out.println("pname:"+pname);//null
	
	pname = mr.getParameter("pname");
	System.out.println("pname:"+pname);// 남성양복
	
	String pimage = mr.getParameter("pimage");
	System.out.println("pimage:"+pimage); // null
	
	pimage = mr.getFilesystemName("pimage");
	System.out.println("pimage:"+pimage); // Penguins.jpg
	
	String org = mr.getOriginalFileName("pimage");
	System.out.println("org:"+org);
	
	RproductDao rpdao = RproductDao.getInstance();
	
	
	int cnt = rpdao.insertRproduct(mr);
	System.out.println("cnt:" + cnt);
	String msg="", url="";
	if(cnt > 0){
		msg="상품 등록 성공!";
		url="prod_list.jsp";
	}else{
		msg="상품 등록 실패!"; 
		url="prod_input.jsp";
	}
%> 

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>






