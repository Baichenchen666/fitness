<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

    <!-- Bootstrap Core CSS -->
    <link href="/static/hou/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/static/hou/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/static/hou/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/static/hou/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
						<h3 class="panel-title" style="display: inline; width:20%;">登录</h3>
                	</div>
                    <div class="panel-body">
                        <form role="form" method="post" id="login_form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="账号" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" name="password" type="password" value="">
                                </div>
                                <div class="form-group">
                            		<a href="javascript:void(0)" class="btn btn-lg btn-success" style="width:100%;" onclick="login();">登录</a> 
                            	</div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
    function login() {
        $.ajax({
            url:"/graduate/dologin",
            type:"POST",
            data:$("#login_form").serialize(),
            success:function (result) {
                if(result.code == 100){
            		window.location.href="/graduate/coach/list";
                }else {
                    alert(result.extendInfo.login_error);
                }
            }

        });
    };
	</script>

    <!-- jQuery -->
    <script src="/static/hou/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/static/hou/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/static/hou/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/static/hou/dist/js/sb-admin-2.js"></script>

</body>
</html>
