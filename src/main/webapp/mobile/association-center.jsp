<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes" />
<title>其乐校园</title>
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
	header{
		height: 60px;
		width: 100%;
		text-align: center;
		margin-bottom: 10px;
	}
	.logo{
		height: 100%;
	}
</style>

</head>
<body>
	<header>
		<image class="logo" src="../resources/images/qile-logo.png">
	</header>
<div class="container-fluid">
   <div class="row">
     <div class="col-sm-12">
       <form id="update-form" method="post" role="form" action="">
         <input type="hidden" id="id" name="id" value="${association.id}">
				 <input type="hidden" id="password" name="password" value="${association.password}">
				 <input type="hidden" id="username" name="username" value="${association.username}">
				 <input type="hidden" id="phone" name="phone" value="${association.phone}">
			 <div class="form-group login-link">
 			 		<a href="add-activity.jsp">完善以下信息，并添加社团日常活动，就能获得千元物料包</a>
			 </div>
       <div class="form-group">
				 <label>用户名</label>
         <input type="text" class="form-control" placeholder="用户名" value="${association.username}" disabled>
       </div>
       <div class="form-group">
				 <label>手机号</label>
         <input type="text" class="form-control" placeholder="手机号" value="${association.phone}" disabled>
       </div>
       <div class="form-group">
				 <label>所在城市</label>
         <input type="text" class="form-control" id="city" name="city" placeholder="所在城市" value="${association.city}">
       </div>
       <div class="form-group">
				 <label>学校名称</label>
         <input type="text" class="form-control" id="school" name="school" placeholder="学校名称" value="${association.school}">
       </div>
       <div class="form-group">
				 <label>社团名称</label>
         <input type="text" class="form-control" id="name" name="name" placeholder="社团名称" value="${association.name}">
       </div>
       <div class="form-group">
				 <label>社团联系人</label>
         <input type="text" class="form-control" id="contact" name="contact" placeholder="社团联系人" value="${association.contact}">
       </div>
       <div class="form-group">
				 <label>职务</label>
         <input type="text" class="form-control" id="position" name="position" placeholder="职务" value="${association.position}">
       </div>
       <div class="form-group">
				 <label>社团总人数</label>
         <input type="number" class="form-control" id="people" name="people" placeholder="社团总人数" value="${association.people}">
       </div>
       <div class="form-group">
				 <label>邮箱</label>
         <input type="email" class="form-control" id="email" name="email" placeholder="邮箱" value="${association.email}">
       </div>
       <div class="form-group">
				 <label>微信</label>
         <input type="text" class="form-control" id="wechat" name="wechat" placeholder="微信" value="${association.wechat}">
       </div>
       <div class="form-group">
				 <label>社团介绍</label>
         <textarea class="form-control" id="description" name="description" placeholder="社团介绍（150字内）" >${association.description}</textarea>
       </div>
       <div class="form-group">
				 <label>社团类型</label>
         <select class="form-control" id="type" name="type">
            <c:if test="${association.type != null}"><option value="${association.type}" selected>${association.type}</option></c:if>
            <option value="学生会">学生会</option>
            <option value="经管实践型">经管实践型</option>
            <option value="文体兴趣型">文体兴趣型</option>
            <option value="学术科技型">学术科技型</option>
            <option value="公益服务型">公益服务型</option>
            <option value="理论学习型">理论学习型</option>
            <option value="其他">其他</option>
         </select>
       </div>

			 <div class="form-group">
				 <label>每学期物料费用(印刷+舞美)</label>
         <input type="number" class="form-control" id="purchaseFee" name="purchaseFee" placeholder="每学期物料费用(印刷+舞美)" value="${association.purchaseFee}">
       </div>

			 <div class="form-group">
				 <label>社团物料采购中最在意的是</label>
				 <select class="form-control" id="purchaseConcern" name="purchaseConcern">
						<c:if test="${association.purchaseConcern != null}"><option value="${association.purchaseConcern}" selected>${association.purchaseConcern}</option></c:if>
						<option value="价格优势">价格优势</option>
						<option value="服务质量">服务质量</option>
						<option value="产品质量">产品质量</option>
						<option value="配送速度">配送速度</option>
				 </select>
			 </div>

			 <div class="form-group">
				 <label>采购物料是否还有其他考虑因素（如果没有请填无）</label>
         <input type="text" class="form-control" id="purchaseAddition" name="purchaseAddition" placeholder="物料采购其他因素(50字内)" value="${association.purchaseAddition}">
       </div>
       <%-- <div class="form-group">
         <input type="password" class="form-control" id="password" name="password" placeholder="密 码">
       </div>

       <div class="form-group">
         <input type="password" class="form-control" id="confirm" name="confirm" placeholder="确认密码">
       </div> --%>

       <%-- <div class="form-group">
         <input type="phone" class="form-control" id="phone" name="phone" placeholder="手机号">
         <input type="button" class="btn btn-info get-security-code-btn" value="免费获取验证码">
       </div>
       <br><br><br>

       <div class="form-group">
         <input type="text" class="form-control" id="security" name="security" placeholder="验证码">
       </div><br><br> --%>



       <div class="form-group">
         <button type="submit" class="reg-btn btn btn-info">保 存</button>
       </div>


      </form>
     </div>
  </div>



</div>






<script type="text/javascript">
	$().ready(function(){

    //添加
	$("#update-form").validate({
							rules: {
                city: {
                  maxlength:20
                },

                school: {
                  maxlength:20
                },

								name: {
									maxlength:20
								},

                contact: {
									maxlength:20
								},

								position: {
									maxlength:20
								},

								people: {
									number:true,
									min:0
								},

								email: {
									email:true,
									maxlength:100
								},

								wechat: {
									maxlength:20
								},

								description: {
									maxlength:150
								},

								purchaseFee: {
									number:true,
									min:0
								},

								purchaseAddition: {
									maxlength:50
								}

							},

							messages: {
								city: {
                  maxlength:'最多20个字'
                },

                school: {
                  maxlength:'最多20个字'
                },

								name: {
									maxlength:'最多20个字'
								},

                contact: {
									maxlength:'最多20个字'
								},

								position: {
									maxlength:'最多20个字'
								},

								people: {
									number:'请输入正整数',
									min:'不能为负数'
								},

								email: {
									email:'请输入正确邮箱格式',
									maxlength:'最多100个字'
								},

								wechat: {
									maxlength:'最多20个字'
								},

								description: {
									maxlength:'最多150个字'
								},

								purchaseFee: {
									number:'请输入正整数',
									min:'不能为负数'
								},

								purchaseAddition: {
									maxlength:'最多50个字'
								}
							},

							// Form Processing via AJAX
							submitHandler: function(form)
							{
								$("#update-form").ajaxSubmit({
													url:'../association/update',
													type:'post',
													dataType:'json',
													success:function(data){
															if (data!=0) {
																//注册成功
																alert('保存成功');
																//window.location.href=$redirect;
															}else{
																//注册失败
																alert('保存失败,请稍后再试');
															};
													}
											});
							}
						});


            // $(".get-security-code-btn").click(function(){
						//
            //   $.ajax({
            //     url:"../util/get-security",
            //     data: {'phone':$('#phone').val(),'type':$('input:radio[name="regtype"]:checked').val()},
            //     type:'post',
            //     dataType:'json',
            //     success:function(data){
            //       if (data != 0) {
            //         $("#id").val(data);
            //       }else{
            //         alert('获取验证码错误，请稍后再试');
            //       }
            //       settime();
            //     }
            //   });
            // });


// function checkSecurity(){
//   $.ajax({
//     url:"../util/check-security",
//     data: {'id':$('#id').val(),'type':$('input:radio[name="regtype"]:checked').val(),'code':$("#security").val()},
//     type:'post',
//     dataType:'json',
//     success:function(data){
//       if (data) {
//         alert('验证码正确');
//         $("#flag").val(1);
//       }else{
//         alert('验证码错误');
//       }
//     }
//   });
// }


// //开始倒计时
// var countdown = 5;
// function settime() {
//   var obj = $(".get-security-code-btn");
//   if (countdown == 0) {
//     obj.removeAttr("disabled");
//     obj.val("免费获取验证码");
//     return;
//   } else {
//     obj.attr("disabled", true);
//     obj.val("重新发送(" + countdown + ")");
//     countdown--;
//   }
//   setTimeout(function() { settime() },1000) //每1000毫秒执行一次
// }
//
//
//
// //校验手机号是否合法
// function isPhoneNum(){
//   var phonenum = $("#phonenum").val();
//   var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
//   if(!myreg.test(phonenum)){
//     alert('请输入有效的手机号码！');
//     return false;
//   }else{
//     return true;
//   }
// }


	});
</script>
</body>
</html>
