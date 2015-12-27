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
  .input-warp{
    float: left;
    width: 50%;
  }
  label.error {
    font-size: 13px;
    color: #F00;
}
  #phone,#security{
    width: 100%;
    float: none;
  }
  .get-security-code-btn{
    width: 25%;
    float: right;
    min-width: 120px;
  }
  .reg-btn{
    min-width: 120px;
  }
  .login-link,.protocol-link{
    text-align: center;
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
<div class="container">
   <div class="row">
     <div class="col-sm-12">
       <form id="add-form" method="post" role="form" action="../activity/update">
				 <input type="hidden" id="id" name="id" value="0">
         <input type="hidden" id="association" name="association" value="${association.id}">
       <div class="form-group">
				 <label>活动名称</label>
         <input type="text" class="form-control" id="title" name="title" placeholder="活动名称">
       </div>

       <div class="form-group">
				 <label>活动标签</label>
         <input type="text" class="form-control" id="tag" name="tag" placeholder="活动标签">
       </div>

       <div class="form-group">
				 <label>活动规模</label>
         <input type="number" class="form-control" id="people" name="people" placeholder="活动规模(人数)">
       </div>
       <div class="form-group">
          <label>活动起始月份：</label>

						    	<select class="form-control col-md-5" id="startMonth" name="startMonth">
						    		<option value="1">1</option><option value="2">2</option><option value="3">3</option>
						    		<option value="4">4</option><option value="5">5</option><option value="6">6</option>
						    		<option value="7">7</option><option value="8">8</option><option value="9">9</option>
						    		<option value="10">10</option><option value="11">11</option><option value="12">12</option>
						    	</select>
				</div>
				<div class="form-group">
					<label>活动结束月份：</label>
								<select class="form-control col-md-5" id="endMonth" name="endMonth">
						    		<option value="1">1</option><option value="2">2</option><option value="3">3</option>
						    		<option value="4">4</option><option value="5">5</option><option value="6">6</option>
						    		<option value="7">7</option><option value="8">8</option><option value="9">9</option>
						    		<option value="10">10</option><option value="11">11</option><option value="12">12</option>
						    	</select>
				</div>
					<div class="form-group">
						<label>活动内容</label>
						<textarea class="form-control" id="content" name="content" placeholder="活动内容" ></textarea>
					</div>




       <div class="form-group btn-warp">
         <a href="javascript:history.back();" class="cancel-btn btn btn-default">取消</a>
				 <button type="submit" class="save-btn btn btn-info">保存</button>
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

		//获取地址栏参数 调用getUrlParam(name)方法

function getUrlParam(name) {
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r!=null) return unescape(r[2]); return null;
}

	var $activityid = getUrlParam("id");
	if ($activityid > 0) {
		$.ajax({
			url:"../activity/get-one?id="+$activityid,
			type:'post',
			dataType:'json',
			success:function(data){
				$("#id").val(data.id);
				$("#association").val(data.association);
				$("#title").val(data.title);
				$("#people").val(data.people);
				$("#content").html(data.content);
				$("#startMonth").prepend('<option value="'+data.startMonth+'" selected>'+data.startMonth+'</option>');
				$("#endMonth").prepend('<option value="'+data.endMonth+'" selected>'+data.endMonth+'</option>');
			}
		});
	}

    //添加
	$("#add-form").validate({
							rules: {
                title: {
                  required: true,
									maxlength:50
                },

                tag: {
                  required: true,
									maxlength:20
                },

								people: {
									number: true,
									min:0
								},

								content: {
									required: true
								}
							},

							messages: {
								title: {
									required: '必填项目',
									maxlength:'最长50个字',
								},

								tag: {
									required: '必填项目',
									maxlength:'最长20个字',
								},

								people: {
									number: '必须为整数',
									min:'不能为负数'
								},

								content: {
									required: '必填项目',
								}
							},

							// Form Processing via AJAX
							submitHandler: function(form){


								var $id = $("#id").val();

                var $url;
								if ($id == 0) {
									$url ='../activity/add';
								}else{
									$url ='../activity/update';
								}

								$("#add-form").ajaxSubmit({
													url:$url,
													type:'post',
													dataType:'json',
													success:function(data){
															if (data) {
																//注册成功
																$.ajax({
																	url:"../activity/activity-count?id=${association.id}",
																	type:'post',
																	dataType:'json',
																	success:function(data){
																		if (data == 1) {
																				alert('保存成功,恭喜您获得千元物料包，请前往优惠券查看。');
																		}else{
																				alert('保存成功');
																		}
																	}
																});


															}else{
																//注册失败
																alert('保存失败,请稍后再试');
															}
													}
											});
										}
						});


	});
</script>
</body>
</html>
