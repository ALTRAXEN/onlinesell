<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    //Important！！！！！！！！！！！！
    //设置项目路径!!!!!!!!!!!!!!!!
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    System.out.println(basePath);
    String loginstatus = (String) request.getSession().getAttribute("loginstatus");
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>无线点餐管理系统</title>
    <!-- Bootstrap -->
    <link href="<%= basePath %>/static/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.min.css"
          rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="<%= basePath %>/static/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-------------------------------------------------------------------------------------->
<!-------------------------------------------------------------------------------------->
<!-------------------------------------------------------------------------------------->

<div class="container">

    <%--标题--%>
    <div class="row">
        <div class="page-header">
            <h1>用户登录
                <small>欢迎使用本餐厅管理系统</small>
            </h1>
        </div>
    </div>

    <div class="row ">
        <div class="col-md-6" >
            <form class="form-horizontal col-sm-offset-2" style="width: 220px;">
                <div class="form-group">
                    <label for="manager_IdCode">工号</label>
                    <input type="text" class="form-control" id="manager_IdCode" placeholder="请输入您的工号">
                </div>
                <div class="form-group">
                    <label for="manager_Password">密码</label>
                    <input type="password" class="form-control" id="manager_Password" placeholder="请输入您的密码">
                </div>
            </form>
        </div>
    </div>

    <div class="row ">
        <div class="col-md-offset-3">
            <button type="button" class="btn btn-primary" id="login_submit_button">登录</button>
        </div>
    </div>
</div>
<!-------------------------------------------------------------------------------------->
<!-------------------------------------------------------------------------------------->
<!-------------------------------------------------------------------------------------->

<script type="text/javascript">
    $(function () {
        var loginstatus=<%=loginstatus%>;
        if (loginstatus!=null) {
            window.location.replace("<%=basePath%>/adminIndex");
            alert("请勿重复登录");
            <%--window.location.href = "<%=basePath%>/adminIndex";--%>
        }
        userNameShow();
    });


    function logIn() {
        $.ajax({
            url: "<%=basePath%>/seller/doLogin",
            type: "POST",
            data: {
                userID: $('#manager_IdCode').val(),
                password: $('#manager_Password').val()
            },
            success: function (result) {
                console.log(result);
                if (result.idCode === 100&&result.infoMap.user.employeeRank===0) {
                    alert("欢迎管理员: " + result.infoMap.user.employeeName + " 登录！");
                    window.location.href = "<%=basePath%>/adminIndex";
                    sessionStorage.setItem("userName", JSON.stringify(result.infoMap.user.employeeName));
                } else {
                    alert("登录失败，请检查员工号和密码是否输入正确");
                }
            }
        })
    }

    $('#login_submit_button').click(function () {
        logIn();
    })
</script>
</body>
</html>