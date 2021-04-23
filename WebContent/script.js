

/**
 * script.js
 */

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
	
	if(isCheck == false){
		alert("중복체크 하세요");
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




