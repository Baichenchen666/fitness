<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>六健身教学网</title>

    <!-- Bootstrap Core CSS -->
    <link href="/static/hou/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/static/hou/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/static/hou/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/static/hou/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- DataTables CSS -->
    <link href="/static/hou/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/static/hou/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
	<style>
		.panel-body table{
			margin-bottom: 0px;
		}
	</style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">健身教学管理系统</a>
            </div>
            
             <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>${currentUser.name }<i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="/graduate/logout"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-static-side -->
            <div class="navbar-default sidebar col-sm-2" role="navigation">
		        <div class="sidebar-nav navbar-collapse">
		            <ul class="nav" id="side-menu">
		            	<c:if test="${currentUser.auth == 0 }">
                        <li>
		                	<a href="/graduate/coach/list">健身教练团队</a>
		                </li>
		                <li>
		                	<a href="/graduate/plan/list">健身方案管理</a>
		                </li>
		                <li>
		                	<a href="/graduate/video/list">健身视频管理</a>
		                </li>
		                <li>
		                	<a href="/graduate/food/list">食物三大元素对照信息</a>
		                </li>
		                <li>
		                	<a href="/graduate/word/list">留言板管理</a>
		                </li>
		                <li>
		                	<a href="/graduate/total">客户分析模块</a>
		                </li>
		                <li>
                            <a href="#"> 用户管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/graduate/user/list?auth=0">管理员信息</a>
                                </li>
                                <li>
                                    <a href="/graduate/user/list?auth=1">普通会员信息</a>
                                </li>
                                <li>
                                    <a href="/graduate/user/list?auth=2">VIP会员信息</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
		                	<a href="/graduate/index">前台</a>
		                </li>
		                <li>
		                	<a href="/graduate/logout">退出</a>
		                </li>
		                </c:if>
		            </ul>
		        </div>
		        <!-- /.sidebar-collapse -->
		    </div>
        </nav>
    </div>
    <!-- jQuery -->
    <script src="/static/hou/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/static/hou/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/static/hou/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="/static/hou/vendor/raphael/raphael.min.js"></script>
    <script src="/static/hou/vendor/morrisjs/morris.min.js"></script>
    <script src="/static/hou/data/morris-data.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="/static/hou/dist/js/sb-admin-2.js"></script>
	<script src="/static/hou/js/common.js"></script>
	<script src ="/static/hou/js/jquery-1.10.2.js"> </script>
    <script src ="/static/hou/js/jquery-migrate-1.2.1.js"> </script>
	<script src="/static/hou/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/static/hou/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/static/hou/vendor/datatables-responsive/dataTables.responsive.js"></script>
    <script src="/static/hou/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
	    $(document).ready(function() {
	        $('#dataTables-example').DataTable({
	            responsive: true,
	            language: {
		             "sProcessing": "处理中...",
		             "sLengthMenu": "显示 _MENU_ 项结果",
		             "sZeroRecords": "没有匹配结果",
		             "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
		             "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
		             "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
		             "sInfoPostFix": "",
		             "sSearch": "搜索:",
		             "sUrl": "",
		             "sEmptyTable": "表中数据为空",
		             "sLoadingRecords": "载入中...",
		             "sInfoThousands": ",",
		             "oPaginate": {
		                 "sFirst": "首页",
		                 "sPrevious": "上页",
		                 "sNext": "下页",
		                 "sLast": "末页"
		             },
		             "oAria": {
		                 "sSortAscending": ": 以升序排列此列",
		                 "sSortDescending": ": 以降序排列此列"
		             }
		         }
	        });
	    });
		//删除方法
	    function confirmx(message, href) {
	        if (confirm(message)){
	        	window.location.href = href;
	        }
	        return false;
	    }; 
	</script>
</body>

</html>
