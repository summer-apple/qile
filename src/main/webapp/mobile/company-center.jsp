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
	<link rel="stylesheet" href="../resources/js/responsive-nav/responsive-nav.css">
	<link rel="stylesheet" href="../resources/js/responsive-nav/responsive-nav-styles.css">
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
		color: #999;
  }
  .reg-btn{
    width: 100%;
  }
	.logo-warp{
		height: 60px;
		width: 100%;
		text-align: center;
		margin-bottom: 10px;
		clear: both;
	}
	.logo{
		height: 100%;
	}
	.btn-warp{
		text-align: center;
	}
.clear{
	clear: both;
}
</style>

</head>
<body>

		<%@include file="nav.jsp"%>

	<div class="clear"></div>
		<div class="logo-warp">
			<image class="logo" src="../resources/images/qile-logo.png">
		</div>
	<div class="clear"></div>
<div class="container-fluid">
   <div class="row">
     <div class="col-sm-12">
       <form id="update-form" method="post" role="form" action="">
         <input type="hidden" id="id" name="id" value="${company.id}">
				 <input type="hidden" id="password" name="password" value="${company.password}">
				 <input type="hidden" id="username" name="username" value="${company.username}">
				 <input type="hidden" id="phone" name="phone" value="${company.phone}">


       <div class="form-group">
				 <label>用户名</label>
         <input type="text" class="form-control" placeholder="用户名" value="${company.username}" disabled>
       </div>
       <div class="form-group">
				 <label>手机号</label>
         <input type="text" class="form-control" placeholder="手机号" value="${company.phone}" disabled>
       </div>
       <div class="form-group">
				 <label>城市</label>
         <input type="text" class="form-control" id="city" name="city" placeholder="所在城市" value="${company.city}">
       </div>
       <div class="form-group">
				 <label>企业名称</label>
         <input type="text" class="form-control" id="name" name="name" placeholder="企业名称" value="${company.name}">
       </div>
       <div class="form-group">
				 <label>联系人</label>
         <input type="text" class="form-control" id="contact" name="contact" placeholder="联系人" value="${company.contact}">
       </div>
       <div class="form-group">
				 <label>职务</label>
         <input type="text" class="form-control" id="position" name="position" placeholder="职务" value="${company.position}">
       </div>
       <div class="form-group">
				 <label>邮箱</label>
         <input type="email" class="form-control" id="email" name="email" placeholder="邮箱" value="${company.email}">
       </div>
       <div class="form-group">
				 <label>微信</label>
         <input type="text" class="form-control" id="wechat" name="wechat" placeholder="微信" value="${company.wechat}">
       </div>
       <div class="form-group">
				 <label>企业介绍</label>
         <textarea class="form-control" id="description" name="description" placeholder="企业介绍（150字内）" >${company.description}</textarea>
       </div>

       <div class="form-group">
         <button type="submit" class="reg-btn btn btn-info">保 存</button>
       </div>


      </form>
     </div>
  </div>



</div>






<script type="text/javascript" src="../resources/js/jquery-1.11.1.min.js"></script>
<script src="../resources/js/responsive-nav/responsive-nav.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery.form.js"></script>
<script type="text/javascript" src="../resources/js/jquery-validate/jquery.validate.js"></script>
<script>
	var navigation = responsiveNav(".nav-collapse", {
		animate: true,                    // Boolean: Use CSS3 transitions, true or false
		transition: 284,                  // Integer: Speed of the transition, in milliseconds
		label: "Menu",                    // String: Label for the navigation toggle
		insert: "after",                  // String: Insert the toggle before or after the navigation
		customToggle: "",                 // Selector: Specify the ID of a custom toggle
		closeOnNavClick: false,           // Boolean: Close the navigation when one of the links are clicked
		openPos: "relative",              // String: Position of the opened nav, relative or static
		navClass: "nav-collapse",         // String: Default CSS class. If changed, you need to edit the CSS too!
		navActiveClass: "js-nav-active",  // String: Class that is added to <html> element when nav is active
		jsClass: "js",                    // String: 'JS enabled' class which is added to <html> element
		init: function(){},               // Function: Init callback
		open: function(){},               // Function: Open callback
		close: function(){}               // Function: Close callback
	});
</script>
<script type="text/javascript">
	$().ready(function(){

    //添加
	$("#update-form").validate({
							rules: {
                city: {
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

								email: {
									email:true,
									maxlength:100
								},

								wechat: {
									maxlength:20
								},

								description: {
									maxlength:150
								}

							},

							messages: {
								city: {
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
								email: {
									email:'请输入正确邮箱格式',
									maxlength:'最多100个字'
								},

								wechat: {
									maxlength:'最多20个字'
								},

								description: {
									maxlength:'最多150个字'
								}
							},

							// Form Processing via AJAX
							submitHandler: function(form)
							{
								$("#update-form").ajaxSubmit({
													url:'../company/update',
													type:'post',
													dataType:'json',
													success:function(data){
															if (data!=0) {
																//注册成功
																alert('保存成功');
																//window.location.href="<%=basePath%>mobile/edit-activity.jsp?id=0";
															}else{
																//注册失败
																alert('保存失败,请稍后再试');
															};
													}
											});
							}
						});



	});
</script>
</body>
</html>
