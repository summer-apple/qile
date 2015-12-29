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
  .add-btn{
    width: 100%;
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
#qry-form{
	display: none;
}
.article-warp {
    width: 100%;
    height: auto;
    margin-top: 20px;
    padding-bottom: 15px;
    border-bottom: 1px solid #DDD;
}
.article-title {
    font-size: 15px;
    padding-bottom: 15px;
}
.article-title a {
    color: #F78503;
}
.article-brief {
    margin-bottom: 15px;
}
.article-type {
    width: 50%;
    float: left;
}
.article-releasetime {
    text-align: right;
}
.article-bottom{
	color: #999;
}
</style>

</head>
<body>

	<nav class="nav-collapse">
		<ul>
			<c:if test="${!empty association}">
				<li><a href="<%=basePath%>mobile/association-center.jsp">资料</a></li>
				<li><a href="<%=basePath%>mobile/activity-list.jsp">活动</a></li>
				<li><a href="<%=basePath%>mobile/coupon-list.jsp">优惠券</a></li>
				<li><a href="<%=basePath%>mobile/article-list.jsp">资讯</a></li>
				<li><a href="<%=basePath%>mobile/login.jsp">退出</a></li>
			</c:if>
			<c:if test="${!empty company}">
				<li><a href="<%=basePath%>mobile/company-center.jsp">资料</a></li>
				<li><a href="<%=basePath%>mobile/article-list.jsp">资讯</a></li>
				<li><a href="<%=basePath%>mobile/login.jsp">退出</a></li>
			</c:if>
			<c:if test="${empty association && empty company}">
				<li><a href="<%=basePath%>mobile/article-list.jsp">资讯</a></li>
				<li><a href="<%=basePath%>mobile/login.jsp">登录</a></li>
			</c:if>
		</ul>
	</nav>

	<div class="clear"></div>
		<%-- <div class="logo-warp">
			<h4>活动列表</h4>
		</div> --%>
	<div class="clear"></div>
<div class="container">
   <div class="row">
     <div class="col-md-12 article-list">
			<!--ajax-->
     </div>
  </div>

	<form role="form" id="qry-form" class="qry-form" action="" method="post">
			<input id="pageNo" name="pageNo" type="hidden" value="0">
			<input id="pageSize" name="pageSize" type="hidden" value="10">
			<input id="amount" type="hidden">
	</form>

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




		//清除content内容，amount归零
		window.clean = function(){
			$(".content").empty();
			$("#pageNo").val(0);
		}

		window.qry = function(){

					$pageNo = $("#pageNo").val();
					$pageSize = $("#pageSize").val();
						$.ajax({
								url:'../article/qry-page',
								data: {'pageNo':$pageNo,'pageSize':$pageSize},
								type:'post',
								dataType:'json',
								success:function(data){
											$("#amount").val(data.amount);
											$.each(data.list,function(i,item){
														$(".article-list").append(
															'<div class="article-warp">'+
											 				 '<div class="article-title"><a href="../mobile/article.jsp?id='+item.id+'">'+item.title+'</a></div>'+
											 				 '<div class="article-brief">'+item.brief+'</div>'+
											 				 '<div class="article-bottom">'+
											 					 '<div class="article-type">'+item.type+'</div>'+
											 					 '<div class="article-releasetime">'+transTime(item.releasetime,false)+'</div>'+
											 				 '</div>'+
											 			 '</div>');
											});//each
										}//success
								});//ajax
							}//function

			$("#pageNo").val(Number($("#pageNo").val())+1);//页码++

			//载入时查询
			qry();

					//日期转换方法
					(function($) {
					    $.extend({
					        myTime: {
					            /**
					             * 当前时间戳
					             * @return <int>        unix时间戳(秒)
					             */
					            CurTime: function(){
		                			return Date.parse(new Date())/1000;
					            },
					            /**
					             * 日期 转换为 Unix时间戳
					             * @param <string> 2014-01-01 20:20:20  日期格式
					             * @return <int>        unix时间戳(秒)
					             */
					            DateToUnix: function(string) {
					                var f = string.split(' ', 2);
					                var d = (f[0] ? f[0] : '').split('-', 3);
					                var t = (f[1] ? f[1] : '').split(':', 3);
					                return (new Date(
					                        parseInt(d[0], 10) || null,
					                        (parseInt(d[1], 10) || 1) - 1,
					                        parseInt(d[2], 10) || null,
					                        parseInt(t[0], 10) || null,
					                        parseInt(t[1], 10) || null,
					                        parseInt(t[2], 10) || null
					                        )).getTime() / 1000;
					            },
					            /**
					             * 时间戳转换日期
					             * @param <int> unixTime    待时间戳(秒)
					             * @param <bool> isFull    返回完整时间(Y-m-d 或者 Y-m-d H:i:s)
					             * @param <int>  timeZone   时区
					             */
					            UnixToDate: function(unixTime, isFull, timeZone) {
					                if (typeof (timeZone) == 'number')
					                {
					                    unixTime = parseInt(unixTime) + parseInt(timeZone) * 60 * 60;
					                }
					                var time = new Date(unixTime * 1000);
					                var ymdhis = "";
					                ymdhis += time.getUTCFullYear() + "-";
					                ymdhis += (time.getUTCMonth()+1) + "-";
					                ymdhis += time.getUTCDate();
					                if (isFull === true)
					                {
					                    ymdhis += " " + time.getUTCHours() + ":";
					                    ymdhis += time.getUTCMinutes() + ":";
					                    ymdhis += time.getUTCSeconds();
					                }
					                return ymdhis;
					            }
					        }
					    });
					})(jQuery);



					/* alert($.myTime.UnixToDate(1442592000,true,8)); */

						function transTime(object,isFull){
							if (object!=null) {
								return $.myTime.UnixToDate(object/1000,isFull,8);
							}else{
								return "--";
							}
						}




	});
</script>
</body>
</html>
