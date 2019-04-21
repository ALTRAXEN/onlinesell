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
                <li class=" dropdown-modal " id="bell_background">
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
            <li class="active">
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
                        <!-------------------------------------------------------------------------------------->
                        <!-------------------------------------------------------------------------------------->
                        <!-------------------------------------------------------------------------------------->
                        <%--标题--%>
                        <div class="col-xs-12">
                            <div class="page-header">
                                <h1>餐厅菜品列表</h1>
                            </div>
                        </div>

                        <div class="col-xs-12">
                            <form class="form-inline">
                                <div class="form-group ">
                                    <label for="Goods_name">菜品名称：</label>
                                    <input type="text" class="form-control" id="Goods_name">
                                    <label for="Goods_low_price">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp价格范围：</label>
                                    <input type="text" class="form-control" id="Goods_low_price">
                                    <label for="Goods_high_price"> ~</label>
                                    <input type="text" class="form-control" id="Goods_high_price">
                                </div>
                                <button class="btn btn-success btn-white" id="search_btn"
                                        type="button">
                                    <span class="glyphicon glyphicon-globe">查询</span>
                                </button>
                                &nbsp&nbsp&nbsp
                                <button class="btn btn-white btn-primary" id="clear_input_btn"
                                        type="button">
                                    <span class="glyphicon glyphicon-scissors">清除输入</span>
                                </button>
                                &nbsp&nbsp&nbsp
                                <button class="btn btn-white btn-pink" id="goods_add_btn"
                                        type="button"
                                        data-toggle="modal"
                                        data-target="#goods_add_Modal">
                                    <span class="glyphicon glyphicon-floppy-disk"> 新增菜品</span>
                                </button>
                            </form>
                        </div>
                        <!-- 菜品列表-->
                        <div class="col-xs-12">
                            <table class="table  table-bordered table-hover" id="goods_list_table">
                                <thead>
                                <tr>
                                    <th>菜品号</th>
                                    <th>菜品名称</th>
                                    <th>菜品价格</th>
                                    <th>菜品类型</th>
                                    <th>菜品描述</th>
                                    <th>图片URL</th>
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

<!--菜品添加模态框 -->
<div class="modal fade" id="goods_add_Modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">菜品添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal col-sm-offset-1" style="width: 370px;">
                    <div class="form-group">
                        <label for="goodsName_input_add">菜品名称</label>
                        <input type="text" class="form-control "
                               id="goodsName_input_add"
                               placeholder="请输入菜品名称">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label for="goodsPrice_input_add">菜品价格</label>
                        <input type="text" class="form-control"
                               id="goodsPrice_input_add"
                               placeholder="请输入菜品价格">
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group">
                        <label>菜品类型
                            <select class="form-control"
                                    id="goodtype_select">
                                <option>热菜</option>
                                <option>冷菜</option>
                                <option>饮料</option>
                                <option>汤类</option>
                                <option>甜点</option>
                            </select>
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="productDescription_input_add">菜品描述
                            <textarea class="form-control" rows="3" id="productDescription_input_add"
                                      style="width: 400px"></textarea>
                        </label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary"
                        id="add_submit_btn">提交
                </button>
            </div>
        </div>
    </div>
</div>

<!--菜品修改模态框 -->
<div class="modal fade" id="goods_modify_Modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">菜品修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal col-sm-offset-1" style="width: 370px;">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">菜品ID</label>
                        <div class="col-sm-10" id="goodsId_static_show">
                            <h4></h4>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="goodsName_input_modify">菜品名称</label>
                        <input type="text" class="form-control"
                               id="goodsName_input_modify">
                    </div>
                    <div class="form-group">
                        <label for="goodsPrice_input_modify">菜品价格</label>
                        <input type="text" class="form-control"
                               id="goodsPrice_input_modify">
                    </div>
                    <div class="form-group">
                        <label for="productDescription_input_modify">菜品描述
                            <textarea class="form-control" rows="3" id="productDescription_input_modify"
                                      style="width: 400px"></textarea>
                        </label>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary"
                        id="modify_submit_btn">提交
                </button>
            </div>
        </div>
    </div>
</div>

<%--菜品删除模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="goods_delete_Modal">
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
                <h4>确认要删除此条菜品信息吗？删除后数据将无法恢复！！</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">取消
                </button>
                <button type="button" class="btn btn-primary"
                        id="delete_submit_btn">确定删除
                </button>
            </div>
        </div>
    </div>
</div>

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
    // 全局变量设置
    var goodsNameAddFlag;
    var goodsPriceAddFlag;
    // 初始执行$function
    $(function () {
        toPage(1);
    });

    // 显示pn页码所有内容
    function toPage(pn) {
        $.ajax({
            url: "<%=basePath%>/seller/product/list",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                if (failCheck(result)) {
                    return;
                }
                clearAll();
                show_goods_list(result);
                show_page_info(result);
                show_page_nav(result, 1);
            }
        })
    }

    // 清空显示
    function clearAll() {
        $('#goods_list_table tbody').empty();
        $('#page_info_area').empty();
        $('#page_nav_area').empty();
    }

    // 清除文本框内容
    function clearText() {
        $('#Goods_name').val("");
        $('#Goods_low_price').val("");
        $('#Goods_high_price').val("");
    }

    // 清空添加模态框内的输入值
    function clearAddModal() {
        $('#goodsName_input_add').val("");
        $('#goodsPrice_input_add').val("");
        $('#productDescription_input_add').val("");
        $('#goodsName_input_add').parent().removeClass("has-success has-error");
        $('#goodsPrice_input_add').parent().removeClass("has-success has-error");
    }

    // 显示菜品列表
    function show_goods_list(result) {
        var goodslist = result.infoMap.pageInfo.list;
        $.each(goodslist, function (index, item) {
            var productId = $("<td></td>").append(item.productId);
            var productName = $("<td></td>").append(item.productName);
            var productPrice = $("<td></td>").append(item.productPrice).append("元");
            var categoryType;
            switch (item.categoryType) {
                case (0):
                    categoryType = $("<td></td>").append("热菜");
                    break;
                case (1):
                    categoryType = $("<td></td>").append("冷菜");
                    break;
                case (2):
                    categoryType = $("<td></td>").append("饮料");
                    break;
                case (3):
                    categoryType = $("<td></td>").append("汤类");
                    break;
                case (4):
                    categoryType = $("<td></td>").append("甜点");
                    break;
            }
            var productDescription = $("<td></td>").append(item.productDescription);
            var productIcon = $("<td></td>").append(item.productIcon);
            var modify_btn = $('<button></button>').addClass("btn btn-white btn-info btn-xs").attr("data-toggle", "modal")
                .attr("data-target", "#goods_modify_Modal")
                .attr("id", "modify_btn").attr("currentid", item.productId)
                .append($('<span></span>').addClass("glyphicon glyphicon-edit").append("修改"));
            var delete_btn = $('<button></button>').addClass("btn btn-white btn-warning btn-xs")
                .attr("data-toggle", "modal").attr("data-target", "#goods_delete_Modal")
                .attr("id", "delete_btn").attr("currentid", item.productId)
                .append($('<span></span>').addClass("glyphicon glyphicon-erase").append("删除"));
            var button_area = $("<td></td>").append(modify_btn).append("\xa0\xa0\xa0\xa0\xa0\xa0\xa0\xa0").append(delete_btn);
            $('<tr></tr>').append(productId).append(productName).append(productPrice).append(categoryType).append(productDescription).append(productIcon).append(button_area).appendTo($('#goods_list_table tbody'));
        });
    }

    // 在菜品修改模态框中显示选中的菜品信息
    function getGoodsModify(productId) {
        $.ajax({
            url: "<%=basePath%>/seller/product/" + productId,
            type: "GET",
            success: function (result) {
                if (failCheck(result)) {
                    return;
                }
                $('#goodsName_input_modify').val(result.infoMap.productInfo.productName);
                $('#goodsPrice_input_modify').val(result.infoMap.productInfo.productPrice);
                $('#productDescription_input_modify').val(result.infoMap.productInfo.productDescription);
            }
        });
    }

    //将修改完成的信息提交完成update
    function putGoodsModify(productId) {
        $.ajax({
            url: "<%=basePath%>/seller/product/modify/" + productId,
            type: "PUT",
            data: JSON.stringify({
                productName: $('#goodsName_input_modify').val(),
                productPrice: $('#goodsPrice_input_modify').val(),
                productDescription: $('#productDescription_input_modify').val()
            }),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (failCheck(result)) {
                    return;
                }
                $('#goods_modify_Modal').modal('hide');
                toPage(1);
                alert("更新信息成功！");
            }
        })
    }

    // 查询 用ajax请求
    function search(pn) {
        $.ajax({
            url: "<%=basePath%>/seller/product/search",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                productName: $('#Goods_name').val(),
                lowPrice: $('#Goods_low_price').val(),
                highPrice: $('#Goods_high_price').val(),
                pn: pn
            }),
            type: "POST",
            success: function (result) {
                if (failCheck(result)) {
                    return;
                }
                clearAll();
                show_goods_list(result);
                show_page_info(result);
                // clearText();
                show_page_nav(result, 2);
            }
        });
    }

    // 添加菜品 ajax请求
    function addGoods() {
        $.ajax({
            url: "<%=basePath%>/seller/product/add",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                productName: $('#goodsName_input_add').val(),
                productPrice: $('#goodsPrice_input_add').val(),
                categoryType: $('#goodtype_select option:selected').text(),
                productDescription: $('#productDescription_input_add').val()
            }),
            type: "POST",
            success: function (result) {
                if (failCheck(result)) {
                    return;
                }
                $('#goods_add_Modal').modal('hide');
                clearAddModal();
                toPage(1);
                goodsNameAddFlag = false;
                goodsPriceAddFlag = false;
            }
        })
    }

    // 删除菜品ajax请求
    function deleteGoods(productId) {
        $.ajax({
            url: "<%=basePath%>/seller/product/delete/" + productId,
            type: "POST",
            data: {
                _method: "DELETE"
            },
            dataType: "json",
            success: function (result) {
                if (failCheck(result)) {
                    return;
                }
                $('#goods_delete_Modal').modal('hide');
                toPage(1);
                alert("删除成功！");
            }
        });
    }


    // 显示校验信息
    function show_validate_message(ele, status, msg) {
        if (status === "success") {
            $(ele).parent().removeClass("has-success has-error");
            $(ele).parent().addClass("has-success");
            $(ele).next().text(msg);
        } else if (status === "error") {
            $(ele).parent().removeClass("has-success has-error");
            $(ele).parent().addClass("has-error");
            $(ele).next().text(msg);
        }
    }

    // 实现菜品添加时菜品价格动态检查
    function checkgoodsPrice(goodsPrice) {
        if (goodsPrice <= 0 || goodsPrice >= 1000) {
            show_validate_message(goodsPrice_input_add, "error", "菜品价格呢 只允许0~2000之间的定价哦");
            goodsPriceAddFlag = false;
        } else {
            show_validate_message(goodsPrice_input_add, "success", "");
            goodsPriceAddFlag = true;
        }
    }

    // 实现菜品添加时菜品名动态检查
    function checkgoodsName(val) {
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,10})/;
        if (!regName.test(val)) {
            show_validate_message(goodsName_input_add, "error", "菜品名呢 只支持3~16位的英文和2~10位的中文");
            goodsNameAddFlag = false;
        } else {
            show_validate_message(goodsName_input_add, "success", "");
            goodsNameAddFlag = true;
        }
        if (goodsNameAddFlag === true) {
            $.ajax({
                url: "<%=basePath%>/seller/product/check",
                type: "POST",
                data: "goodsName=" + val,
                success: function (result) {
                    if (result.idCode === 100) {
                        show_validate_message(goodsName_input_add, "success", "此菜名可以使用");
                        goodsNameAddFlag = true;
                    } else {
                        show_validate_message(goodsName_input_add, "error", "菜名已被使用！");
                        goodsNameAddFlag = false;
                    }
                }
            });
        }
    }

    // 按钮事件监视器
    $('#search_btn').click(function () {
        search(1);
    });
    $('#clear_input_btn').click(function () {
        clearText();
        toPage(1);
    });
    $('#add_submit_btn').click(function () {
        if (goodsNameAddFlag === false || goodsPriceAddFlag === false) {
            alert("请检查您的输入！");
        } else {
            addGoods();
        }
    });
    $('#delete_submit_btn').click(function () {
        deleteGoods($(this).attr("currentid"));
    });
    $('#modify_submit_btn').click(function () {
        putGoodsModify($(this).attr("currentid"));
    });
    $(document).on("click", '#delete_btn', function () {
        $('#delete_submit_btn').attr("currentid", $(this).attr("currentid"));
    });
    $(document).on("click", '#modify_btn', function () {
        $('#goodsId_static_show h4').text($(this).attr("currentid"));
        $('#modify_submit_btn').attr("currentid", $(this).attr("currentid"));
        getGoodsModify($(this).attr("currentid"));
    });
    $('#goodsName_input_add').change(function () {
        var goodsPrice = this.value;
        checkgoodsName(goodsPrice);
    });
    $('#goodsPrice_input_add').change(function () {
        var goodsName = this.value;
        checkgoodsPrice(goodsName);
    });
</script>

</html>