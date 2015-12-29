<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>





<html lang="en">
<head>
<base href="<%=basePath%>">
<%@ include file="meta.jsp" %>

<%@ include file="css.jsp" %>
<style type="text/css">
#uploadifive-file_upload, #uploadifive-content_upload {
	background-color: #000;
	color: #FFF;
}
.content-line #uploadifive-file_upload,.content-line #uploadifive-content_upload {
	display: none !important;
}

/* .wangEditor-modal-container .wangEditor-modal{
	margin-top:-3637px !important;
} */
</style>


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->


</head>
<body class="page-body">



	<div class="page-container">
		<!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

		<!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
		<!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
		<!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->

		<%@ include file="side-bar.jsp"%>
		<div class="main-content">

			<%@ include file="top-bar.jsp"%>

			<div class="page-title">

			<div class="title-env">
					<h1 class="title">文章管理</h1>
					<p class="description">query edit or create  article</p>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="dashboard/home"><i class="fa-home"></i>主页</a></li>
						<li class="active"><strong>查询文章</strong></li>
					</ol>

				</div>

			</div>


<!--主体部分开始-->
			<div class="add-panel panel panel-default" style="display: none;">
						<div class="panel-heading">
							<h3 class="panel-title">新增文章</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">–</span>
									<span class="expand-icon">+</span>
								</a>
								<a href="javascript:void(0);" class="close-panel">
									×
								</a>
							</div>
						</div>
						<div class="panel-body">

							<form id="add-form" role="form" class="form-horizontal" action="" method="post">

								<input name="id" type="hidden" id="id">

								<div class="form-group">
									<label class="col-sm-2 control-label" for="title">标&nbsp;&nbsp;&nbsp;题</label>

									<div class="col-sm-10">
										<input name="title" type="text" class="form-control" id="title" placeholder="标题,50字以内">

									</div>
								</div>


								<div class="form-group">
									<label class="col-sm-2 control-label" for="link">类&nbsp;&nbsp;&nbsp;型</label>
									<div class="col-sm-10">
										<select name="type" class="form-control" id="type">
											<option value="企业">企业</option>
											<option value="社团">社团</option>
										</select>
									</div>
								</div>


								<div class="form-group">
									<label class="col-sm-2 control-label" for="content">概&nbsp;&nbsp;&nbsp;要</label>
									<div class="col-sm-10">
										<textarea name="brief" id="brief" class="form-control" placeholder="内容概要，150字以内(非必填，默认截取详情前150字)"></textarea>
									</div>

								</div>



								<div class="form-group">
									<label class="col-sm-2 control-label" for="content">详&nbsp;&nbsp;&nbsp;情</label>
									<div class="col-sm-10 content-line">
										<%-- <input id="content_upload" type="file" name="upload" style="display:none;" />
										<div id="tip-queue-2" style="display:none;"></div>
										<div id="uploadContainer">
										    <input type="button" value="选择文件" id="btnBrowse"/>
										</div> --%>

										<textarea name="content" id="content" style='height:500px;'></textarea>
									</div>

								</div>



								<div class="form-group">
									<div class="col-sm-6">
									</div>
									<div class="col-sm-2">
										<button id="add-btn" type="submit" class="btn btn-primary btn-single btn-sm">保 存</button>
										<button id="update-btn" type="submit" class="btn btn-primary btn-single btn-sm">更 新</button>
									</div>
								</div>


							</form>

						</div>
					</div>
<!--新增新闻表单结束-->

			<div class="panel panel-default">

				<div class="row">

					<div class="col-sm-8">
						<a href="javascript:void(0);" class="open-panel btn btn-primary btn-single btn-sm" style="float:left; margin-right:10px;">新建文章</a>
					</div>

				<div class="col-sm-4">


						<form class="form-inline" id="qry-form" action="" method="post">
							<div class="row">

							<div class="form-group">
								<input id="pageNo" name="pageNo" class="form-control" type="hidden" value="0" placeholder="页码">
							</div>
							<div class="form-group">
								<input id="pageSize" name="pageSize" class="form-control" type="hidden" value="10" placeholder="每页新闻数">
							</div>

							<div class="form-group">
								<input id="amount" name="amount" class="form-control" type="hidden" placeholder="总页数">
							</div>
							</div>
						</form>

					</div>


				</div>
				<br>


				<div class="row">
					<div class="col-sm-12">
						<table id="qry-table" class="table table-bordered table-striped table-condensed table-hover">
										<thead>
											<tr>
												<th>ID</th>
												<th>标题</th>
												<th>类型</th>
												<th>简介</th>
												<th>时间</th>
												<th>操作</th>
											</tr>
										</thead>

										<tbody>

										</tbody>
						</table>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12">
						<div class="pagination"></div>
					</div>
				</div>


			</div>


<!--主体部分结束-->
			<!-- Main Footer -->
			<!-- Choose between footer styles: "footer-type-1" or "footer-type-2" -->
			<!-- Add class "sticky" to  always stick the footer to the end of page (if page contents is small) -->
			<!-- Or class "fixed" to  always fix the footer to the end of page -->
			<%@ include file="footer.jsp"%>
		</div>



	</div>


	<div class="page-loading-overlay">
		<div class="loader-2"></div>
	</div>

	<div class="modal fade" id="modal-1" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">操作提示</h4>
				</div>

				<div class="modal-body">
					确定要删除该条内容吗？该操作不可撤销！
				</div>

				<div class="del-id"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white del-confirm-btn" data-dismiss="modal">删除</button>
					<button type="button" class="btn btn-info" data-dismiss="modal">取消</button>

				</div>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="resources/js/select2/select2.css">
	<link rel="stylesheet" href="resources/js/select2/select2-bootstrap.css">

	<%@ include file="script.jsp" %>
	<script type="text/javascript" src="resources/js/jquery.pagination.js"></script>
	<script src="resources/js/jquery.uploadifive.js"></script>
	<!-- <script src="resources/js/ckeditor/ckeditor.js"></script> -->
	<!-- <script src="resources/js/ckeditor/adapters/jquery.js"></script> -->

	<script src="resources/js/select2/select2.min.js"></script>
	<script src="resources/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="resources/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="resources/js/multiselect/js/jquery.multi-select.js"></script>


	<link rel="stylesheet" href="resources/js/wangEditor/css/wangEditor-1.3.12.css">
	<script src="resources/js/wangEditor/js/wangEditor-1.3.12.min.js"></script>

	<script type="text/javascript">
	$().ready(function(){

//首次进入时刷新
	qry(true);


//获取dom节点
//    var $uploadContainer = $('#uploadContainer');

    var editor = $('#content').wangEditor({
        //重要：传入 uploadImgComponent 参数，值为 $uploadContainer
        //'uploadImgComponent': $uploadContainer,
        'menuConfig': [
						    ['viewSourceCode'],
						    ['bold', 'underline', 'italic', 'foreColor', 'backgroundColor', 'strikethrough'],
						    ['blockquote', 'fontFamily', 'fontSize', 'setHead', 'list', 'justify'],
						    ['createLink', 'unLink', 'insertTable'],
						    ['insertImage', 'insertVideo', 'insertLocation','insertCode'],
						    ['undo', 'redo', 'fullScreen']
						]
    });

  	//  //添加内容图片
		//
		//
  	//   $('#content_upload').uploadifive({
  	// 		'width'           : 75,                 // The width of the button
  	// 		'height'          : 30,                 // The height of the button
  	//         'auto' : true,   //取消自动上传
  	//         'uploadScript' : 'util/upload-image', //处理上传文件Action路径
  	//         'fileObjName'  : 'file',        //文件对象
	  //       'buttonText'   : ' 上传详情图片 ',   //按钮显示文字
	  //       'queueID'      : 'tip-queue-2', //drug and drop box's ID
	  //       'fileType'     : 'image/jpg,image/jpeg,image/png',   //允许上传文件类型
	  //       'fileSizeLimit'   : '20MB',                  // Maximum allowed size of files to upload
	  //       'formData'     : {"folder":"article"},//The other data want to send
	  //       'queueSizeLimit'  : 100,                  //The maximum number of files in drup and drop box
    //         'simUploadLimit'  : 100,                  // The maximum number of files to upload at once
    //         'uploadLimit'     : 100,                  // The maximum number of files you can upload
	  //       'onUploadComplete' : function(file, data) { //文件上传成功后执行
	  //       			var basePath = "<%=basePath%>";
		// 				var url = basePath + $.parseJSON(data);
		// 				editor.command(event, 'insertHTML', '<img src="' + url + '"/>');
		// 				$(".content-line #real-input:first").remove();
	  //       	}
		// });
		//
	  // 	$(document).on("click","#btnBrowse",function(){
		// 				$(".content-line #real-input:last").click();
		// 			});



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





//查询方法
		function qry(initPageFlag){
            $.ajax({
                url:'article/qry-page',
                data: {'pageNo':$('#pageNo').val(),'pageSize':$('#pageSize').val()},
                type:'post',
                dataType:'json',
                success:function(data){
                    $("#qry-table tbody").empty();

                	$.each(data.list, function(i, item) {
                		 $("#qry-table tbody").append(
                		'<tr class="article-'+item.id+'">'+
						'	<td class="article-id">'+item.id+'</td>'+
						'	<td class="article-title">'+item.title+'</td>'+
						'	<td class="article-type">'+item.type+'</td>'+
						'	<td class="article-brief" style="max-width:400px;">'+item.brief+'</a></td>'+
							'	<td class="article-releasetime">'+transTime(item.releasetime,true)+'</td>'+
						'	<td style="min-width:115px;"><a class="edit-btn btn btn-primary btn-single btn-sm" onclick="edit('+item.id+')">编辑</a><a class="btn btn-primary btn-single btn-sm" onclick=del('+item.id+')>删除</a></td>'+
						'</tr>'
                		 );
                	$("#amount").val(data.amount);

                	if(initPageFlag){
                		$(".pagination").pagination(data.amount, {
						  prev_text: '&laquo;',
						  next_text: '&raquo;',
						  ellipse_text:"...",
						  items_per_page: 1,
						  num_display_entries: 6,
						  current_page: 0,
						  num_edge_entries: 2,
						  link_to:"javascript:void(0);",
						  callback:pageSelectCallback

						});
                	}


                  	});
                }
            });


		}


//点击页码查询

		function pageSelectCallback(current_page, aa){
			$("#pageNo").val(current_page+1);
			 qry(false);
		}


//添加
	$("#add-form").validate({
							rules: {
								title: {
									required: true,
									maxlength:50
								},

								brief: {
									//required: true,
									maxlength:150
								}
							},

							messages: {
								title: {
									required: '必填项目',
									maxlength:'最多50个汉字'
								},
								brief: {
									//required: '必填项目',
									maxlength:'最多150个汉字'
								}
							},

							// Form Processing via AJAX
							submitHandler: function(form)
							{


								if ($("#brief").val()=="") {
									var $brief = $("#content").val().replace(/(\n)/g, "").replace(/(\t)/g, "").replace(/(\r)/g, "").replace(/<\/?[^>]*>/g, "").replace(/\s*/g, "").substring(0,149);
									$("#brief").val($brief);
								}




								var $url ='';

								if ($("#id").val()==0) {
									$url ='article/add';
								}else{
									$url ='article/update';
								}

								$("#add-form").ajaxSubmit({
					                url:$url,
					                type:'post',
					                dataType:'json',
					                success:function(data){
					                    if (data!=0) {
					                    	alert("保存成功...");
					                    	$("#add-form")[0].reset();
					                    	$("#id").val(0);
					                    	qry(true);
					                    	$(".add-panel").hide();
					                    }else{
					                    	alert("保存出错...");
					                    };
					                }
					            });
							}
						});




//删除

	window.del = function(id){
		$(".del-id").html(id);
		jQuery('#modal-1').modal('show', {backdrop: 'fade'});
	}

	$(".del-confirm-btn").click(function(){
		var $id = $(".del-id").html();
			$.ajax({
                url:'article/delete?id='+$id,
                type:'post',
                dataType:'json',
                success:function(data){
                	if (data==true) {
                    	alert("删除成功...");
                   		qry(true);
                    }else{
                    	alert("无法删除...");

                    }

                }
            });
	});


//关闭新增商店面板
	$(".close-panel").click(function(){
		$(".add-panel").hide();
	});
//打开新增商店面板
	$(".open-panel").click(function(){
		$("#add-form")[0].reset();
		$(".add-panel .panel-title").html("新增文章");
		$("#content").val("");
		$(".wangEditor-textarea").html("");
		$("#add-btn").show();
		$("#update-btn").hide();
		$(".add-panel").show();
	});

//编辑
	window.edit = function(id){
		$("#add-form")[0].reset();
		$(".add-panel .panel-title").html("更新文章");

		$("#add-btn").hide();
		$("#update-btn").show();

		$.ajax({
                url:'article/get-one?id='+id,
                type:'post',
                dataType:'json',
                success:function(data){
                	$("#id").val(data.id);
                	$("#title").val(data.title);
                	$("#brief").val(data.brief);
                	$("#content").val(data.content);
                	$(".wangEditor-textarea").html(data.content);
                	$("#type option[value = "+data.type+"]").attr("selected","true");
                }
            });

		$(".add-panel").show();
	}//333


});

	</script>
</body>
</html>
