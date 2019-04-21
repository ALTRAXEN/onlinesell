<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    System.out.println(basePath);
    String loginstatus=(String) request.getSession().getAttribute("loginstatus");
%>
<script type="text/javascript">
    $(function () {
        getNewOrder();
        // setInterval(function () {
        //     getNewOrder();
        // }, 10000);
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

    // 显示分页信息
    function show_page_info(result) {
        var pageInfo = result.infoMap.pageInfo;
        $('#page_info_area').append("当前为第").append(pageInfo.pageNum)
            .append("页，共有").append(pageInfo.pages)
            .append("页，共有").append(pageInfo.total).append("条数据");
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


    // 查询有几条新订单并且显示在右上角
    function getNewOrder() {
        $.ajax({
            url: "<%=basePath%>/seller/order/currentSize",
            type: "GET",
            success: function (result) {
                console.log(result);
                var orderSize = result.infoMap.OrderSize;
                $('#bell-area').removeClass("icon-animated-bell");
                $('.badge-important').empty();
                if (orderSize !== 0) {
                    $('#bell_background').removeClass("light-blue");
                    $('#bell_background').addClass("red");
                    $('#bell-area').addClass("icon-animated-bell");
                    $('.badge-important').append(orderSize);
                }
            }
        })
    }

    // 点击右上角小铃消除角标
    function clearIconText() {
        $.ajax({
            url:"<%=basePath%>/seller/order/seen",
            type:"POST",
            success:function (result) {
                console.log(result);
                window.location.href = "<%=basePath%>/adminIndex";
            }
        })
    }

    // 登出系统
    function logout() {
        window.location.href = "<%=basePath%>/logout";
        alert("已登出，谢谢使用");
    }

    function failCheck(result) {
        if (result.idCode === 200) {
            alert("操作失败！失败原因：" + result.message);
            return true;
        }
        console.log(result);
        return false;
    }

    // 按钮事件监控
    $('#logout_submit_btn').click(function () {
        logout();
    });
    $('#bell-btn').click(function () {
        clearIconText();
    });
</script>
