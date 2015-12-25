<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DRARTISAN</title>
<link rel="stylesheet" type="text/css" href="../resources/js/bootstrap/css/bootstrap.min.css">
  <script type="text/javascript" src="../resources/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="../resources/js/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../resources/js/jquery.form.js"></script>
  <script type="text/javascript" src="../resources/js/jquery-validate/jquery.validate.js"></script>
<style type="text/css">
  *{
    margin: 0;
    padding: 0;
    text-decoration: none;
    outline: none;
  }
  body{
    margin: 20px;
  }
  #phone,#security{
    width: 65%;
    float: left;
  }
  .get-security-code-btn{
    width: 25%;
    float: right;
    min-width: 120px;
  }
  .login-link,.protocol-link{
    text-align: center;
  }
  .reg-btn{
    width: 100%;
  }
</style>

</head>
<body>

<div class="container-fluid">
   <div class="row">
     <div class="col-sm-12">
       <form id="update-form" method="post" role="form" action="">
         <input type="hidden" id="id" name="id" value="0">
         <input type="hidden" id="flag" name="flag" value="0">
       <div class="form-group">
         <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
       </div>

       <div class="form-group">
         <input type="password" class="form-control" id="password" name="password" placeholder="密 码">
       </div>

       <div class="form-group">
         <input type="password" class="form-control" id="confirm" name="confirm" placeholder="确认密码">
       </div>
       <div class="form-group">
          <label>选择身份：</label>
          <label class="radio-inline">
            <input type="radio" name="regtype" id="company" value="company"> 企业
          </label>
          <label class="radio-inline">
            <input type="radio" name="regtype" id="association" value="association" checked> 社团
          </label>
       </div>

       <div class="form-group">
         <input type="phone" class="form-control" id="phone" name="phone" placeholder="手机号">
         <input type="button" class="btn btn-info get-security-code-btn" value="免费获取验证码">
       </div>
       <br><br><br>

       <div class="form-group">
         <input type="text" class="form-control" id="security" name="security" placeholder="验证码">
       </div><br><br>

       <div class="form-group protocol-link">
         <a href="javascript:void(0);">《易联校园用户注册协议》</a>
       </div>

       <div class="form-group">
         <button type="submit" class="reg-btn btn btn-info">同意协议并注册</button>
       </div>

       <div class="form-group login-link">
         <a href="login.jsp">已有账号，去登录</a>
       </div>
      </form>
     </div>
  </div>



</div>






<script type="text/javascript">
	$().ready(function(){

    //添加
	$("#register-form").validate({
							rules: {
                phone: {
                  required: true,
                  //phoneUS: true,
                  remote: '../util/check-phone'
                },

                security: {
                  required: true
                },

								username: {
									required: true,
									maxlength:20,
                  remote: '../util/check-username'
								},

								password: {
									required: true,
                  minlength:6,
									maxlength:16
								},

                confirm: {
									required: true,
									maxlength:16,
                  equalTo: "#password"
								}
							},

							messages: {
                phone: {
                  required: '必填项目',
                  //phoneUS: '请输入正确的手机号',
                  remote: '该手机号已被注册'
                },

                security: {
                  required: '必填项目'
                },

								username: {
									required: '必填项目',
									maxlength:'最长20个字符',
                  remote: '该用户名已存在'
								},

								password: {
									required: '必填项目',
                  minlength: '最短6个字符',
									maxlength:'最长16个字符'
								},

                confirm: {
                  required: '必填项目',
                  minlength: '最短6个字符',
									maxlength:'最长16个字符',
                  equalTo: "两次输入密码不一致"
								}
							},

							// Form Processing via AJAX
							submitHandler: function(form)
							{


								var $regtype = $('input:radio[name="regtype"]:checked').val();


								if ($regtype == 'company') {
									$url ='../company/register';
								}else{
									$url ='../association/register';
								}


                $.ajax({
                  url:"../util/check-security",
                  data: {'id':$('#id').val(),'type':$('input:radio[name="regtype"]:checked').val(),'code':$("#security").val()},
                  type:'post',
                  dataType:'json',
                  success:function(data){
                    if (data) {
                      alert('验证码正确');
                      $("#register-form").ajaxSubmit({
      					                url:$url,
      					                type:'post',
      					                dataType:'json',
      					                success:function(data){
      					                    if (data!=0) {
      					                    	//注册成功
                                      alert('register success');
      					                    }else{
      					                    	//注册失败
                                      alert('register failure');
      					                    };
      					                }
      					            });
                    }else{
                      alert('验证码错误');
                    }
                  }
                });


							}
						});


            $(".get-security-code-btn").click(function(){

              $.ajax({
                url:"../util/get-security",
                data: {'phone':$('#phone').val(),'type':$('input:radio[name="regtype"]:checked').val()},
                type:'post',
                dataType:'json',
                success:function(data){
                  if (data != 0) {
                    $("#id").val(data);
                  }else{
                    alert('获取验证码错误，请稍后再试');
                  }
                  settime();
                }
              });
            });


function checkSecurity(){
  $.ajax({
    url:"../util/check-security",
    data: {'id':$('#id').val(),'type':$('input:radio[name="regtype"]:checked').val(),'code':$("#security").val()},
    type:'post',
    dataType:'json',
    success:function(data){
      if (data) {
        alert('验证码正确');
        $("#flag").val(1);
      }else{
        alert('验证码错误');
      }
    }
  });
}


//开始倒计时
var countdown = 5;
function settime() {
  var obj = $(".get-security-code-btn");
  if (countdown == 0) {
    obj.removeAttr("disabled");
    obj.val("免费获取验证码");
    return;
  } else {
    obj.attr("disabled", true);
    obj.val("重新发送(" + countdown + ")");
    countdown--;
  }
  setTimeout(function() { settime() },1000) //每1000毫秒执行一次
}



//校验手机号是否合法
function isPhoneNum(){
  var phonenum = $("#phonenum").val();
  var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
  if(!myreg.test(phonenum)){
    alert('请输入有效的手机号码！');
    return false;
  }else{
    return true;
  }
}


	});
</script>
</body>
</html>
