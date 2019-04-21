<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    System.out.println(basePath);
    String loginstatus=(String) request.getSession().getAttribute("loginstatus");
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>无线点餐管理系统</title>
    <link href="<%= basePath %>/static/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/assets/css/fonts.googleapis.com.css"/>
    <link rel="stylesheet" href="<%=basePath%>/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>
    <link rel="stylesheet" href="<%=basePath%>/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/assets/css/ace-rtl.min.css"/>
    <script src="<%=basePath%>/assets/js/ace-extra.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script type="text/javascript">
        if('ontouchstart' in document.documentElement) document.write("<script src='<%=basePath%>/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
    <script src="<%=basePath%>/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>/assets/js/ace-elements.min.js"></script>
    <script src="<%=basePath%>/assets/js/ace.min.js"></script>
</head>
<body class="no-skin">
<%--最上面的导航栏--%>
<div id="navbar" class="navbar navbar-default ace-save-state col-sm-12">
    <div class="navbar-container ace-save-state " id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left">
            <a class="navbar-brand" href="<%=basePath%>/adminIndex">
                <small>
                    无线点餐后台管理系统
                </small>
            </a>
        </div>
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav ">
                <li class="light-blue dropdown-modal " id="bell_background">
                    <a data-toggle="dropdown" class="dropdown-toggle " id="bell-btn" href="<%=basePath%>/adminIndex">
                        <i class="ace-icon fa fa-bell" id="bell-area"></i>
                        <span class="badge badge-important"></span>
                    </a>
                </li>
                <li class="light-blue dropdown-modal ">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <span class="user-info" id="username_show">
									<small>现用户：</small>
								</span>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>
                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#">
                                <i class="ace-icon fa fa-cog"></i>
                                重置密码
                            </a>
                        </li>
                        <li class="divider"></li>

                        <li>
                            <a href="#" id="logout_btn" data-toggle="modal" data-target="#logout_Modal">
                                <i class="ace-icon fa fa-power-off"></i>
                                登出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>


<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.loadState('main-container')
        } catch (e) {
        }
    </script>
    <%--左边的sidebar--%>
    <div id="sidebar" class="sidebar responsive ace-save-state">
        <script type="text/javascript">
            try {
                ace.settings.loadState('sidebar')
            } catch (e) {
            }
        </script>
        <ul class="nav nav-list">
            <li class="">
                <a href="<%=basePath%>/adminIndex">
                    <i class="menu-icon fa fa-tachometer"></i>
                    <span class="menu-text"> 实时订单 </span>
                </a>
                <b class="arrow"></b>
            </li>
            <li class="">
                <a href="<%=basePath%>/orderIndex">
                    <i class="menu-icon glyphicon glyphicon-book"></i>
                    <span class="menu-text"> 订单管理 </span>
                </a>
                <b class="arrow"></b>
            </li>
            <li class="">
                <a href="<%=basePath%>/productIndex">
                    <i class="menu-icon fa  fa-cutlery"></i>
                    <span class="menu-text"> 菜品管理 </span>
                </a>
                <b class="arrow"></b>
            </li>
            <li class="">
                <a href="<%=basePath%>/employeeIndex">
                    <i class="menu-icon fa fa-tasks"></i>
                    <span class="menu-text"> 员工管理 </span>
                </a>
                <b class="arrow"></b>
            </li>
            <li class="">
                <a href="<%=basePath%>/userIndex">
                    <i class="menu-icon fa  fa-users"></i>
                    <span class="menu-text"> 注册用户管理 </span>
                </a>
                <b class="arrow"></b>
            </li>
            <li class="">
                <a href="#">
                    <i class="menu-icon glyphicon glyphicon-list"></i>
                    <span class="menu-text"> 库存管理 </span>
                </a>
                <b class="arrow"></b>
            </li>
            <li class="">
                <a href="#">
                    <i class="menu-icon fa  fa-hdd-o"></i>
                    <span class="menu-text"> 统计数据 </span>
                </a>
                <b class="arrow"></b>
            </li>
        </ul>
    </div>

    <%--主内容--%>
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <!-- PAGE CONTENT ENDS -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--页脚--%>
    <div class="footer">
        <div class="footer-inner">
            <div class="footer-content">
						<span class="smaller-20 col-sm-offset-11">
							version 1.1.14
						</span>
            </div>
        </div>
    </div>
</div>

<%--模态框展示区域--%>

<%--登出模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="logout_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">菜品删除</h4>
            </div>
            <div class="modal-body">
                <h4>确认要登出本系统吗</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary"
                        id="logout_submit_btn">退出本系统
                </button>
            </div>
        </div>
    </div>
</div>
</body>

<%--页面jquery方法区--%>
<%--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
<%--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
<%--页面jquery方法区--%>

<script type="text/javascript">
    $(function () {
        getNewOrder();
        // setInterval(function () {
        //     getNewOrder();
        // }, 3000);
        var loginstatus=<%=loginstatus%>;
        if (loginstatus==null) {
            alert("请先登录本系统！");
            window.location.href = "<%=basePath%>/login";
        }
        userNameShow();
    });

    // 显示右上角登录用户信息
    function userNameShow() {
        var JSONuserName = sessionStorage.getItem("userName");
        var userName = JSON.parse(JSONuserName);
        $('#username_show').append(userName);
    }

    // 查询有几条新订单并且显示在右上角
    function getNewOrder() {
        $.ajax({
            url: "<%=basePath%>/currentordersize",
            type: "GET",
            success: function (result) {
                console.log(result);
                var orderSize = result.infoMap.OrderSize;
                $('#bell-area').removeClass("icon-animated-bell");
                $('.badge-important').empty();
                if (orderSize !== 0) {
                    $('#bell-area').addClass("icon-animated-bell");
                    $('.badge-important').append(orderSize);
                }
            }
        })
    }

    // 点击右上角小铃消除角标

    function clearIconText() {
        $.ajax({
            url:"<%=basePath%>/clearicontext",
            type:"POST",
            success:function (result) {
                console.log(result);
            }
        })
    }

    // 登出系统
    function logout() {
        window.location.href = "<%=basePath%>/logout";
        alert("已登出，谢谢使用");
    }

    // 按钮事件监控
    $('#logout_submit_btn').click(function () {
        logout();
    });
    $('#bell-btn').click(function () {
        clearIconText();
    });
</script>
</html>