<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
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
        if ('ontouchstart' in document.documentElement) document.write("<script src='<%=basePath%>/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
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
            <li class="active">
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
                    <form class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <%--实时订单的显示表格--%>
                        <div class="col-xs-12">
                            <div class="page-header">
                                <h1>历史订单</h1>
                            </div>
                        </div>

                        <div class="row col-xs-12">
                            <form class="form-inline">
                                <div class="form-group-lg width-30" >
                                    <label for="OrderID_search_input" style="Float:left;height:20px">订单号：</label>
                                    <input type="text" class="form-control" id="OrderID_search_input" style="Float:left;height:40px">
                                </div>
                                &nbsp
                                <button class="btn btn-success btn-white" id="search_btn" type="button" style="Float:left;height:40px">
                                    <span class="glyphicon glyphicon-globe">查询</span>
                                </button>
                                &nbsp&nbsp
                                <button class="btn btn-white btn-primary" id="clear_input_btn" type="button" style="Float:left;height:40px">
                                    <span class="glyphicon glyphicon-scissors">清除输入</span>
                                </button>
                            </form>
                        </div>
                        <div class="col-xs-12">
                            <table id="order-table" class="table  table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>订单号</th>
                                    <th>会员名</th>
                                    <th>菜品总数</th>
                                    <th>总金额</th>
                                    <th>创建时间</th>
                                    <th>完成时间</th>
                                    <th>修改时间</th>
                                    <th width="30">操作</th>
                                    <th width="50">订单详情</th>
                                </tr>
                                </thead>
                                <tbody id="order-table-tbody"></tbody>
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
                <h4 class="modal-title">登出</h4>
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
<jsp:include page="commonMethod.jsp"/>
<script type="text/javascript">
    $(function () {
        toPage();
    });

    function get_goods_list(orderID) {
        $.ajax({
            url: "<%=basePath%>/seller/order/detail/"+orderID,
            type: "GET",
            success: function (result) {
                console.log(result);
                show_goods_list(result);
            }
        })
    }

    function show_goods_list(result) {
        var orderGoodsList = result.infoMap.OrderMasterDTO.orderDetailList;
        $.each(orderGoodsList, function (index, item) {
            var goodsID = $('<td></td>').append(item.productId);
            var goodsName = $('<td></td>').append(item.productName);
            var goodsPrice = $('<td></td>').append(item.productPrice);
            var goodsNum = $('<td></td>').append(item.productQuantity);
            var tr = $('<tr></tr>').append(goodsID).append(goodsName).append(goodsPrice).append(goodsNum);
            $('.ordergoods-tbody').append(tr);
        });
    }

    //显示订单列表
    function show_order_list(result) {
        var orderList = result.infoMap.pageInfo.list;
        $.each(orderList, function (index, item) {
            var orderId = $('<td></td>').append(item.orderId);
            var userName = $('<td></td>').append(item.buyerName);
            var totalNum = $('<td></td>').append(item.totalAmount + "件");
            var totalMoney = $('<td></td>').append(item.consumptionMoney + "元");
            var createTime = $('<td></td>').append(item.stringCreateTime);
            var finishTime = $('<td></td>').append(item.stringFinishTime);
            var modifyTime = $('<td></td>').append(item.stringUpdateTime);
            var tempa = $('<a href="#" class="green bigger-140 " id="show-details-btn"></a>').attr("currentID", item.orderId).append('<i class="ace-icon fa fa-angle-double-down"></i>');
            var tempdiv = $('<div class="action-buttons"></div>').append(tempa);
            var detail = $('<td class="center"></td>').append(tempdiv);
            var button = $('<div class="hidden-sm hidden-xs btn-group">\n' +
                '                <button class="btn btn-xs btn-danger delete_btn">\n' +
                '                    <i class="ace-icon fa fa-trash-o bigger-120"></i>\n' +
                '                </button>\n' +
                '            </div>');
            var detailtable = $('<tr class="detail-row">\n' +
                '                                <td colspan="8">\n' +
                '                                    <div class="table-detail">\n' +
                '                                        <div class="row">\n' +
                '                                                <div class="col-xs-12">\n' +
                '                                                    <table class="table  table table-striped" id="order_goods_table">\n' +
                '                                                        <thead>\n' +
                '                                                        <tr>\n' +
                '                                                            <th>菜品号</th>\n' +
                '                                                            <th>菜品名</th>\n' +
                '                                                            <th>单价</th>\n' +
                '                                                            <th>数量</th>\n' +
                '                                                        </tr>\n' +
                '                                                        </thead>\n' +
                '                                                        <tbody class="ordergoods-tbody">\n' +
                '                                                        </tbody>\n' +
                '                                                    </table>\n' +
                '                                                </div>\n' +
                '                                            </div>\n' +
                '                                        </div>\n' +
                '                                </td>\n' +
                '                            </tr>');
            var tr = $('<tr></tr>').append(orderId).append(userName).append(totalNum).append(totalMoney).append(createTime).append(finishTime).append(modifyTime).append(button).append(detail);
            $('#order-table-tbody').append(tr).append(detailtable);
        })

    }

    // 显示pn页码所有内容
    function toPage(pn) {
        $.ajax({
            url: "<%=basePath%>/seller/order/list",
            type: "GET",
            data: "pn" + pn,
            success: function (result) {
                console.log(result);
                clearAll();
                show_order_list(result);
                show_page_info(result);
                show_page_nav(result)
            }
        })
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

    // 清空显示
    function clearAll() {
        $('#order-table tbody').empty();
        $('#page_info_area').empty();
        $('#page_nav_area').empty();
    }

    // 查询 用ajax请求
    function search(pn) {
        $.ajax({
            url: "<%=basePath%>/seller/order/search",
            data: JSON.stringify({
                orderId: $('#OrderID_search_input').val(),
                pn: pn
            }),
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (failCheck(result)) {
                    clearText()
                    return;
                }
                clearAll();
                show_order_list(result);
                show_page_info(result);
                show_page_nav(result, 2);
            }
        });
    }

    // 清除文本框内容
    function clearText() {
        $('#OrderID_search_input').val("");
    }

    // 按钮事件监控
    $(document).on("click", '#show-details-btn', function (e) {
        e.preventDefault();
        if ($(this).closest('tr').next().hasClass('open')) {
            $('.detail-row').removeClass('open');
            $('.ordergoods-tbody').empty();
        } else {
            $('.detail-row').removeClass('open');
            $('.ordergoods-tbody').empty();
            $(this).closest('tr').next().addClass('open');
        }
        // $('#detail-row-tr').toggleClass('open');
        $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
        get_goods_list($(this).attr("currentID"));
    });
    $('#search_btn').click(function () {
        search(1);
    });
    $('#clear_input_btn').click(function () {
        clearText();
        toPage(1);
    });
</script>
</html>