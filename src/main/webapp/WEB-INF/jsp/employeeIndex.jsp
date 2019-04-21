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
            <li class="active">
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
                        <!-------------------------------------------------------------------------------------->
                        <!-------------------------------------------------------------------------------------->
                        <!-------------------------------------------------------------------------------------->
                        <%--标题--%>
                        <div class="col-xs-12">
                            <div class="page-header">
                                <h1>餐厅员工列表</h1>
                            </div>
                        </div>

                        <div class="col-xs-12">
                            <form class="form-inline">
                                <div class="form-group ">
                                    <label for="ManagerName_search_input">员工名称：</label>
                                    <input type="text" class="form-control" id="ManagerName_search_input">
                                </div>
                                <button class="btn btn-success btn-white" id="search_btn" type="button">
                                    <span class="glyphicon glyphicon-globe">查询</span>
                                </button>
                                <button class="btn btn-white btn-primary" id="clear_input_btn" type="button">
                                    <span class="glyphicon glyphicon-scissors">清除输入</span>
                                </button>
                                <div class="col-xs-4 col-md-offset-8">
                                    <button class="btn btn-white btn-pink" id="manager_add_btn" type="button"
                                            data-toggle="modal"
                                            data-target="#manager_add_Modal">
                                        <span class="glyphicon glyphicon-floppy-disk"> 新增员工</span>
                                    </button>
                                </div>
                            </form>
                        </div>
                        <!-- 员工列表-->
                            <div class="col-xs-12">
                                <table class="table table-striped table-bordered " id="manager_list_table">
                                    <thead>
                                    <tr>
                                        <th>员工号</th>
                                        <th>员工名称</th>
                                        <th>电子邮箱</th>
                                        <th>电话</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>

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
                <%--分页条部分--%>
                <%--页码信息--%>
                <div class="col-md-6 col-md-offset-5" id="page_info_area"></div>
                <%--分页条--%>
                <div class="col-md-6 col-md-offset-5" id="page_nav_area"></div>
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

<!--员工添加模态框 -->
<div class="modal fade" id="manager_add_Modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新建员工</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="ManagerName_input_add">员工名称</label>
                        <input type="text" class="form-control " id="ManagerName_input_add" placeholder="请输入员工名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="email_input_add">电子邮箱</label>
                        <input type="email" class="form-control" id="email_input_add" placeholder="请输入员工邮箱">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="ManagerPhone_input_add">电话</label>
                        <input type="text" class="form-control" id="ManagerPhone_input_add" placeholder="请输入员工电话">
                        <span class="help-block"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="add_submit_btn">提交</button>
            </div>
        </div>
    </div>
</div>

<!--员工修改模态框 -->
<div class="modal fade" id="manager_modify_Modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工信息修改</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工号</label>
                        <div class="col-xs-10" id="managerId_static_show">
                            <p class="form-control-static"></p>
                        </div>
                        <div class="form-group">
                            <label for="managerName_input_modify">员工姓名</label>
                            <input type="email" class="form-control" id="managerName_input_modify">
                        </div>
                        <div class="form-group">
                            <label for="email_input_modify">电子邮箱</label>
                            <input type="email" class="form-control" id="email_input_modify">
                        </div>
                        <div class="form-group">
                            <label for="managerPhone_input_modify">联系电话</label>
                            <input type="text" class="form-control" id="managerPhone_input_modify">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="modify_submit_btn">提交</button>
            </div>
        </div>
    </div>
</div>

<%--员工删除模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="manager_delete_Modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工删除</h4>
            </div>
            <div class="modal-body">
                <h4>确认要删除此条员工信息吗？删除后数据将无法恢复！！</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="delete_submit_btn">确定删除</button>
            </div>
        </div>
    </div>
</div>

</body>


<%--页面jquery方法区--%>
<%--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
<%--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--%>
<%--页面jquery方法区--%>
<jsp:include page="commonMethod.jsp"/>
<script type="text/javascript">

    // 初始执行$function
    $(function () {
        toPage(1);
    });

    // 显示pn页码所有内容
    function toPage(pn) {
        $.ajax({
            url: "<%=basePath%>/manager",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
                clearAll();
                show_manager_list(result);
                show_page_info(result);
                show_page_nav(result, 1);
            }
        })
    }

    // 清空显示
    function clearAll() {
        $('#manager_list_table tbody').empty();
        $('#page_info_area').empty();
        $('#page_nav_area').empty();
    }

    // 清除文本框内容
    function clearText() {
        $('#manager_name').val("");
        $('#manager_low_price').val("");
        $('#manager_high_price').val("");
    }

    //清除添加员工模态框内容
    function clearAddModal() {
        $('#ManagerName_input_add').val("");
        $('#email_input_add').val("");
        $('#ManagerPhone_input_add').val("");
    }

    // 显示员工列表
    function show_manager_list(result) {
        var managerlist = result.infoMap.pageInfo.list;
        $.each(managerlist, function (index, item) {
            var managerid = $("<td></td>").append(item.id);
            var managername = $("<td></td>").append(item.username);
            var email = $("<td></td>").append(item.email);
            var phoneNumber = $('<td></td>').append(item.phonenumber);
            var modify_btn = $('<button></button>').addClass("btn btn-white btn-info btn-xs").attr("data-toggle", "modal")
                .attr("data-target", "#manager_modify_Modal")
                .attr("id", "modify_btn").attr("currentid", item.id)
                .append($('<span></span>').addClass("glyphicon glyphicon-edit").append("修改"));
            var delete_btn = $('<button></button>').addClass("btn btn-white btn-warning btn-xs")
                .attr("data-toggle", "modal").attr("data-target", "#manager_delete_Modal")
                .attr("id", "delete_btn").attr("currentid", item.id)
                .append($('<span></span>').addClass("glyphicon glyphicon-erase").append("删除"));
            var button_area = $("<td></td>").append(modify_btn).append("\xa0\xa0\xa0\xa0\xa0\xa0\xa0\xa0").append(delete_btn);
            $('<tr></tr>').append(managerid).append(managername).append(email).append(phoneNumber).append(button_area).appendTo($('#manager_list_table tbody'));
        });
    }



    // 显示分页
    function show_page_nav(result, i) {
        var pageInfo = result.infoMap.pageInfo;
        var nav = $('<nav></nav>').attr("aria-label", "Page navigation");
        var ul = $('<ul></ul>').addClass("pagination");
        var firstPage = $('<li></li>').append($('<a></a>').attr("herf", "#").append("首页"));
        var prePage = $('<li></li>').append($('<a></a>').attr("herf", "#").append("&laquo;"));
        var nextPage = $('<li></li>').append($('<a></a>').attr("herf", "#").append("&raquo;"));
        var lastPage = $('<li></li>').append($('<a></a>').attr("herf", "#").append("末页"));
        firstPage.click(function () {
            if (i === 1) {
                toPage(1);
            }
            if (i === 2) {
                search(1);
            }
        });
        prePage.click(function () {
            if (i === 1) {
                toPage(pageInfo.prePage);
            }
            if (i === 2) {
                search(pageInfo.prePage);
            }
        });
        nextPage.click(function () {
            if (i === 1) {
                toPage(pageInfo.nextPage);
            }
            if (i === 2) {
                search(pageInfo.nextPage);
            }
        });
        lastPage.click(function () {
            if (i === 1) {
                toPage(pageInfo.pages);
            }
            if (i === 2) {
                search(pageInfo.pages);
            }
        });
        if (pageInfo.hasPreviousPage) {
            ul.append(firstPage).append(prePage);
        }
        $.each(pageInfo.navigatepageNums, function (index, item) {
            var numLi = $('<li></li>').append($('<a></a>').attr("herf", "#").append(item));
            if (pageInfo.pageNum === item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                if (i === 1) {
                    toPage(item);
                }
                if (i === 2) {
                    search(item);
                }
            });
            ul.append(numLi);
        });
        if (pageInfo.hasNextPage) {
            ul.append(nextPage).append(lastPage);
        }
        nav.append(ul).appendTo($('#page_nav_area'));
    }

    // 查询 用ajax请求
    function search(pn) {
        $.ajax({
            url: "<%=basePath%>/managersearch",
            data: {
                managerName: $('#ManagerName_search_input').val(),
                pn: pn
            },
            type: "GET",
            success: function (result) {
                console.log(result);
                clearAll();
                show_manager_list(result);
                show_page_info(result);
                // clearText();
                show_page_nav(result, 2);
            }
        });
    }

    // 添加员工 ajax请求
    function addManager() {
        $.ajax({
            url: "<%=basePath%>/manageradd",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                managerName: $('#ManagerName_input_add').val(),
                email: $('#email_input_add').val(),
                managerPhone: $('#ManagerPhone_input_add').val(),
            }),
            type: "POST",
            success: function (result) {
                console.log(result);
                $('#manager_add_Modal').modal('hide');
                clearAddModal();
                toPage(1);
            }
        })
    }

    // 删除员工ajax请求
    function deleteManager(managerID) {
        $.ajax({
            url: "<%=basePath%>/managerdelete/" + managerID,
            type: "POST",
            data: {
                _method: "DELETE",
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                $('#manager_delete_Modal').modal('hide');
                toPage(1);
                alert("删除成功！");
            }
        });
    }

    // 在员工修改模态框中显示选中的信息
    function getManagerModify(managerId) {
        $.ajax({
            url: "<%=basePath%>/manager/" + managerId,
            type: "GET",
            success: function (result) {
                console.log(result);
                $('#managerName_input_modify').val(result.infoMap.User.username);
                $('#email_input_modify').val(result.infoMap.User.email);
                $('#managerPhone_input_modify').val(result.infoMap.User.phonenumber);
            }
        });
    }

    //将修改完成的信息提交完成update
    function putManagerModify(goodsId) {
        $.ajax({
            url: "<%=basePath%>/managermodify/" + goodsId,
            type: "PUT",
            data: JSON.stringify({
                managerName: $('#managerName_input_modify').val(),
                email: $('#email_input_modify').val(),
                managerPhone: $('#managerPhone_input_modify').val(),
            }),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function () {
                $('#manager_modify_Modal').modal('hide');
                toPage(1);
                alert("更新信息成功！");
            }
        })
    }

    // 按钮事件监视器
    $('#search_btn').click(function () {
        search(1);
    });
    $('#clear_input_btn').click(function () {
        clearText();
        toPage(1);
    });
    $('#delete_submit_btn').click(function () {
        deleteManager($(this).attr("currentid"));
    });
    $(document).on("click", '#delete_btn', function () {
        $('#delete_submit_btn').attr("currentid", $(this).attr("currentid"));
    });
    $(document).on("click", '#modify_btn', function () {
        $('#managerId_static_show p').text($(this).attr("currentid"));
        $('#modify_submit_btn').attr("currentid", $(this).attr("currentid"));
        getManagerModify($(this).attr("currentid"));
    });
    $('#modify_submit_btn').click(function () {
        putManagerModify($(this).attr("currentid"));
    });
    $('#add_submit_btn').click(function () {
            addManager();
            alert("新增员工成功！员工初始密码为 123 ");
    });
</script>
</html>