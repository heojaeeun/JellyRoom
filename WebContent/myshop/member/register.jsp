<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/script.js"></script> --%>

<style>
	body{
			background-image: url(../../img/wall2.PNG);
	}
	.regi{
		background-color:white;
	}
	.jellyroom{
		margin-left: auto;
		margin-right: auto;
	}
</style>
<script type = "text/javascript">

var isCheck = false;
var use;

$(function(){
	$('input[name="id"]').keydown(function(){
		//alert(1);
		$('#idmessage').css('display','none');
		isCheck = false; // 
	});

});

function writeSave(){ 
	//alert(1);
	if($('input[name="name"]').val() == ""){
		alert("이름을 입력하세요");
		$('input[name="name"]').focus();
		return false;
	}
	
	if($('input[name="id"]').val() == ""){
		alert("id를 입력하시오");
		$('input[name="id"]').focus();
		return false;
	}
	
	if(isCheck == false){
		alert("중복체크 하세요");
		return false;
	}
	
	if($('input[name="password"]').val() == ""){
		alert("비밀번호를 입력하세요");
		$('input[name="password"]').focus();
		return false;
	}
	
	if($('input[name="repassword"]').val() == ""){
		alert("비밀번호 확인을 입력하세요");
		$('input[name="repassword"]').focus();
		return false;
	}
	
	if($('input[name="hp2"]').val() == ""){
		alert("휴대폰 번호를 알맞게 입력하세요");
		$('input[name="hp2"]').focus();
		return false;
	}
	
	if($('input[name="hp3"]').val() == ""){
		alert("휴대폰 번호를 알맞게 입력하세요");
		$('input[name="hp3"]').focus();
		return false;
	}
	
	if($('input[name="email"]').val() == ""){
		alert("이메일을 입력하세요");
		$('input[name="email"]').focus();
		return false;
	}
	
	if($('input[name="age"]').val() == ""){
		alert("나이를 입력하세요.");
		$('input[name="age"]').focus();
		return false;
	}
	
	if($('input[name="country"]').val() == ""){
		alert("거주중인 국가를 입력하세요.");
		$('input[name="country"]').focus();
		return false;
	}
	
	
	if(use == "impossible"){
		alert("이미 사용중인 아이디입니다.");
		return false;
	}

}

function duplicate(){ // 중복체크 
	
	isCheck = true;
	
	$.ajax({
		url: "id_check_proc.jsp",
		data:({
			userid : $('input[name="id"]').val() // userid=hong
		}),
		success:function(data){
			if($.trim(data) == 'YES'){
				$('#idmessage').html("<font color=red>사용 가능합니다.</font>");
				//$('#idmessage').show();
				$('#idmessage').css('display','inline');
				use = "possible";
			}
			else{
				$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
				$('#idmessage').show();
				use = "impossible";
			}
		}// success
	}); // ajax
}//duplicate

</script>



<table align=center width = "770px" >
	<tr>
		<td align=center>
			<a href ="../../login.jsp">
			<img class="jellyroom" src="../../img/jellyroom.png" width="550" height="230"/>
			</a>
		</td>
	</tr>
</table>
<form action = "registerPro.jsp" method="post" onSubmit = "return writeSave()">

<table class = "regi" border="1" align="center">
	<tr>
		<th align="center">Name</th>
		<td>
			<input type="text" name="name" value="" >
		</td>
	</tr>
	<tr>
		<th align="center">ID</th>
		<td>
			<input type="text" name="id">
			<input type="button" id="id_check" value="Double check" onClick="return duplicate()"></input>
			<span id="idmessage"></span>
		</td>
	</tr>
	<tr>
		<th align="center">Password</th>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<th align="center">Re-Password</th>
		<td><input type="password" name="repassword" id="repassword">
		<span id="pwmessage" style="display:none;"></span></td>
	</tr>
	<tr>
		<th align="center">Mobile Phone</th>
		<td>
			<select name="hp1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="031">031</option>
			</select>
			
			<input type="text" name="hp2" size="4" maxlength="4" value="2343">-
			<input type="text" name="hp3" size="4" maxlength="4" value="5676">
		</td>
	</tr>
	<tr>
		<th align="center">Email</th>
		<td>
			<input type="text" name="email" value="penguin@naver.com">
		</td>
	</tr>
	<tr>
		<th align="center">Gender</th>
		<td>
			<input type="radio" name="gender" value="female" checked>Female
			<input type="radio" name="gender" value="male" >Male
			
		</td>
	</tr>
	<tr>
		<th align="center">Age</th>
		<td>
			<input type="text" name="age" value="3">
			
		</td>
	</tr>
	<tr>
		<th align="center">Country</th>
		<td>
			<input type="text" name="country" value="Korea">
			
		</td>
	</tr>
	<tr>
		<th align="center">Mood</th>
		<td>
			<input type="radio" name="pref" value="Cozy" checked>Cozy
			<input type="radio" name="pref" value="Cheerful" >Cheerful
			<input type="radio" name="pref" value="Romantic" >Romantic
			<input type="radio" name="pref" value="Beautiful" >Beautiful
			<input type="radio" name="pref" value="Modern" >Modern
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="Sign up" id="sub">&nbsp;&nbsp;
			<input type="reset" value="Cancel">
		</td>
	</tr>
</table>

</form>