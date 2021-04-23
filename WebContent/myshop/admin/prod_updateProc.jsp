<%@page import="java.io.File"%>
<%@page import="my.shop.RproductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

prod_updateProc.jsp<br>

<%
String msg ="";
String url="";


	String upload = config.getServletContext().getRealPath("/myshop/images");
// upload : C:\JSP_ysy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\15_Minimall\myshop\images
	String requestPath = request.getContextPath()+"/myshop/images";

	MultipartRequest mr = new MultipartRequest(
												request,
												upload,
												1024*1024*10,
												"UTF-8",
												new DefaultFileRenamePolicy()
												);
	
	String pno = mr.getParameter("pno");
	
	String pcategory = mr.getParameter("pcategory");
	System.out.println("pcategory: "+pcategory);
	
	String pname = mr.getParameter("pname");
	System.out.println("pname: "+pname);
	
	String pimage2 = mr.getParameter("pimage2"); //Koala.jpg(이전)
	System.out.println("pimage2: "+pimage2);
	
	String pimage = mr.getOriginalFileName("pimage"); // 새이미지 
	System.out.println("pimage: "+pimage);
	
	String pcompany = mr.getParameter("pcompany");
	
	String pqty = mr.getParameter("pqty");
	
	String pref = mr.getParameter("pref");
	
	String price = mr.getParameter("price");
	
	String point = mr.getParameter("point");
	
	String pcontents = mr.getParameter("pcontents");
	
	
	RproductDao rpdao = RproductDao.getInstance();


	int cnt = rpdao.updateRproduct(mr);  
	
	File delFile = null;
	File dir = new File(upload);
	
	if(pimage != null){  // 새:O
		if(pimage2 != null){ // 이전:O 새:O
			delFile = new File(dir,pimage2);
			delFile.delete();
%>
			<script type="text/javascript">
/* 				alert("이미지 화일 삭제 성공")
 */			</script>
<%			
		}
		else{ // 이전:X 새:O
			
		}
	}

	if( cnt > 0 ){
		msg="수정 성공";
		url="prod_list.jsp";
	}else{
		msg="수정 실패";
		url="prod_update.jsp?pno="+pno;
	}
	

%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>

