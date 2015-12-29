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
  .tip {
    text-align: center;
    display: block;
    color: #F00;
    font-size: 13px;
}
  label.error {
    font-size: 13px;
    color: #F00;
}
  .login-btn{
    min-width: 120px;
  }
  .register-link{
    text-align: center;
  }
  .login-btn{
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
	<div class="logo-warp">
		<image class="logo" src="../resources/images/qile-logo.png">
	</div>
<div class="container">
   <div class="row">
     <div class="col-md-12">
       <form class="form form-horizontal" id="login-form" method="post" role="form" action="../association/login">

		 <c:if test="${!empty tip}"><label class="tip">${tip}</label></c:if>

         <input type="hidden" id="id" name="id" value="0">
         <input type="hidden" id="flag" name="flag" value="0">
       <div class="form-group">
         <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
       </div>

       <div class="form-group">
         <input type="password" class="form-control" id="password" name="password" placeholder="密 码">
       </div>

       <%-- <div class="form-group">
          <label>选择身份：</label>
					<label class="radio-inline">
            <input type="radio" name="regtype" id="association" value="association" checked> 社团
          </label>
          <label class="radio-inline">
            <input type="radio" name="regtype" id="company" value="company"> 企业
          </label>
       </div> --%>
			 <div class="form-group">
          <label>选择身份：</label>

					<label class="radio-inline">
            <input type="radio" name="regtype" id="association" value="association" checked> 社团
          </label>

          <label class="radio-inline">
            <input type="radio" name="regtype" id="company" value="company"> 企业
          </label>

       </div>





       <div class="form-group">
         <button type="submit" class="login-btn btn btn-info">登 录</button>
       </div>

       <div class="form-group register-link">
         <a href="<%=basePath%>mobile/register.jsp">没有账号，去注册</a>
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

		//删除session
		$.ajax({
			url:"../association/logout",
			type:'post',
			dataType:'json'
		});

    //添加
	$("#login-form").validate({
							rules: {

								username: {
									required: true
								},

								password: {
									required: true
								}
							},

							messages: {
								username: {
									required: '必填项目'
								},

								password: {
									required: '必填项目'
								}
							}

						});

						$("#company").click(function(){
							$("#login-form").attr("action","../company/login");
						});

						$("#association").click(function(){
							$("#login-form").attr("action","../association/login");
						});

						$("#username").focus(function(){
							$(".tip").remove();
						});




	});
</script>
</body>
</html>
