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
    <%--<script src="<%= basePath %>/static/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>--%>
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
            <li class="active">
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
                    <div class="col-xs-10">
                        <!-- PAGE CONTENT BEGINS -->

                        <%--实时订单的显示表格--%>
                        <h1>实时订单</h1>
                        <a id="no_more"></a>
                        <table id="order-table" class="table  table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>桌号</th>
                                <th>会员名</th>
                                <th>订单号</th>
                                <th>菜品总数</th>
                                <th>总金额</th>
                                <th>创建时间</th>
                                <th width="50">订单详情</th>
                            </tr>
                            </thead>
                            <tbody id="order-table-tbody"></tbody>
                        </table>
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
        var orderList = result.infoMap.orderMasterDTOList;
        $.each(orderList, function (index, item) {
            var tableNum = $('<td></td>').append(item.tableId + "号桌");
            var userName = $('<td></td>').append(item.buyerName);
            var orderId = $('<td></td>').append(item.orderId);
            var totalNum = $('<td></td>').append(item.totalAmount + "件");
            var totalMoney = $('<td></td>').append(item.consumptionMoney + "元");
            var createTime = $('<td></td>').append(item.stringCreateTime);
            var tempa = $('<a href="#" class="green bigger-140 " id="show-details-btn"></a>').attr("currentID", item.orderId).append('<i class="ace-icon fa fa-angle-double-down"></i>');
            var tempdiv = $('<div class="action-buttons"></div>').append(tempa);
            var detail = $('<td class="center"></td>').append(tempdiv);
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
            var tr = $('<tr></tr>').append(tableNum).append(userName).append(orderId).append(totalNum).append(totalMoney).append(createTime).append(detail);
            $('#order-table-tbody').append(tr).append(detailtable);
        })

    }

    // 显示pn页码所有内容
    function toPage() {
        $.ajax({
            url: "<%=basePath%>/seller/order/current",
            type: "GET",
            success: function (result) {
                if (result.infoMap.orderMasterDTOList.length === 0) {
                    $('#no_more').append('<h3>暂无</h3>');
                    $('#order-table').hide();
                }
                console.log(result);
                clearAll();
                show_order_list(result);
            }
        })
    }


    // 清空显示
    function clearAll() {
        $('#order-table tbody').empty();
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
        $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
        get_goods_list($(this).attr("currentID"));
    });
</script>


</html>