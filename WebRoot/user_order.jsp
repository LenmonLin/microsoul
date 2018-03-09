<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <!-- 先引入 Vue -->
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <title>个人中心</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        .tabs_left .el-tabs--left .el-tabs__header.is-left {
            margin-top: 100px;
            margin-right: 110px;
        }

        .el-menu--horizontal {
            border-bottom: none;
        }

        a:link {
            color: #5c5c5c;
        }

        /* 未访问链接*/
        a:visited {
            color: #5c5c5c;
        }

        /* 已访问链接 */
        a:hover {
            color: #000000;
        }

        /* 鼠标移动到链接上 */
        a:active {
            color: #5c5c5c;
        }

        /* 鼠标点击时 */
        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        a:active {
            text-decoration: none;
        }
    </style>
</head>

<body>
<div class="top" id="center" style="margin: auto;width: 1226px;">
    <el-row id="top-cart" style="width:100%;height:100px">
        <el-col :span="4">
            <a href="#" class="logo"><img src="../img/logo.png" width="90" height="90"></a>
        </el-col>
        <el-col :span="6" offset="1">
            <div class="title" style="margin-top: 65px;font-size: x-large">订单管理</div>
        </el-col>
        <el-col :span="6" offset="7">
            <el-menu :default-active="'1'" class="el-menu-demo" mode="horizontal" size="mini"
                     active-text-color="#000000">
                <el-submenu index="1" active-text-color="#000000">
                    <template slot="title">用户名</template>
                    <el-menu-item index="1-1"><a href="https://www.ele.me" target="_blank"
                                                 style="text-decoration: none">用户中心</a></el-menu-item>
                    <el-menu-item index="1-2"><a href="#" style="text-decoration: none">退出登录</a></el-menu-item>
                </el-submenu>
                <el-menu-item index="2"><a href="https://www.ele.me" target="_blank"
                                           style="text-decoration: none">订单管理</a></el-menu-item>
                <el-menu-item index="3"><a href="https://www.ele.me" target="_blank"
                                           style="text-decoration: none">购物车</a></el-menu-item>
            </el-menu>
        </el-col>
    </el-row>
    <el-row style="margin-top: 50px">
        <el-col :span="3">
            <div class="nav_left" style="margin-top: 100px;">
                <div style="height: 8%;width:50%;margin: 30px 0px;text-align: center">
                    <a href="http://localhost:8080/user_order.jsp" style="color: #409EFF">订单管理</a>
                </div>
                <div style="height: 8%;width:50%;margin: 30px 0px;text-align: center">
                    <a href="http://localhost:8080/user_collection.jsp">收藏管理</a>
                </div>
                <div style="height: 8%;width:50%;margin: 30px 0px;text-align: center">
                    <a href="http://localhost:8080/user_address.jsp">地址管理</a>
                </div>
                <div style="height: 8%;width:50%;margin: 30px 0px;text-align: center">
                    <a href="http://localhost:8080/user_info.jsp">用户信息</a>
                </div>
            </div>
        </el-col>
        <el-col :span="20" offset="1">
            <el-tabs type="card" v-model="status" @tab-click="handleTabClick">
                <el-tab-pane label="待付款" name="0">
                </el-tab-pane>
                <el-tab-pane label="待发货" name="1">
                </el-tab-pane>
                <el-tab-pane label="待收货" name="2">
                </el-tab-pane>
                <el-tab-pane label="已完成" name="3">
                </el-tab-pane>
                <el-tab-pane label="已取消" name="8">
                </el-tab-pane>
            </el-tabs>
            <el-row v-for="item in list">
                <div>
                    <span>{{item.orderTime}}</span>
                    <span>{{item.orderId}}</span>
                    <span>{{item.sellerName}}</span>
                    <span>￥{{item.totalPrice}}</span>
                    <el-button v-if="item.state == 0">付款</el-button>
                    <el-button v-if="item.state == 2" @click="confirmGoods(item)">确认收货</el-button>
                    <el-button v-if="item.state == 0" @click="handleCancel(item)">取消订单</el-button>
                    <span v-if="item.state == 8">已取消</span>
                    <span v-if="item.state == 8">已完成</span>
                </div>
                <el-table
                        style="width: 100%;margin-top:50px"
                        :data="item.goods">
                    <el-table-column
                            label=""
                            width="90">
                        <template slot-scope="scope">
                            <div class="img" style="width: 100%;height: 80px">
                                <a href="#" class="logo"><img src="scope.row.imageUrl" width="80"
                                                              height="80"></a>
                            </div>
                        </template>
                    </el-table-column>
                    <el-table-column
                            prop="goodsName"
                            width="261"
                            align="center">
                    </el-table-column>
                    <el-table-column
                            prop="unitPrice"
                            width="261"
                            align="center">
                    </el-table-column>
                    <el-table-column
                            prop="purchaseQuantity"
                            width="102"
                            align="center">
                    </el-table-column>
                </el-table>
            </el-row>

            <div class="page" style="margin-top: 30px; margin-left: 30%;">
                <el-pagination
                        @current-change="handlePageChange"
                        :current-page.sync="currentPage"
                        :page-size="5"
                        layout="total, prev, pager, next"
                        :total="total">
                </el-pagination>
            </div>
        </el-col>
    </el-row>

</div>
</body>

<script>
    new Vue({
        el: '#center',
        data() {
            return {
                pageSize: 5,
                status: 0,
                currentPage: 1,
                total: 0,
                list: [],
            }
        },
        mounted() {
            let that = this;
            $.ajax({
                url: '/microsoul/order/getOrderList.do',
                type: 'post',
                data: {
                    state: '0',
                    page: '1',
                },
                success: function (data) {
                    console.log(data);
                    that.list = data.extend.orderList.list;
                    that.total = data.extend.orderList.total;

                },
                error: function (data) {
                    alert(data);
                },
                dataType: 'json',
            })
        },
        methods: {
            handleTabClick() {
                let that = this;
                $.ajax({
                    url: '/microsoul/order/getOrderList.do',
                    type: 'post',
                    data: {
                        state: that.status,
                        page: that.currentPage,
                    },
                    success: function (data) {
                        let result = data.code;
                        if (result == 100 || result == true) {
                            that.list = data.extend.orderList.list;
                            that.total = data.extend.orderList.total;
                        }
                    },
                    error: function (data) {
                        alert(data);
                    },
                    dataType: 'json',
                })
            },
            handlePageChange() {
                let that = this;
                $.ajax({
                    url: '/microsoul/order/getOrderList.do',
                    type: 'post',
                    data: {
                        state: that.status,
                        page: that.currentPage,
                    },
                    success: function (data) {
                        let result = data.code;
                        if (result == 100 || result == true) {
                            that.list = data.extend.orderList.list;
                        }
                    },
                    error: function (data) {
                        alert(data);
                    },
                    dataType: 'json',
                })
            },
            handleCancel(item){
                $.ajax({
                    url: '/microsoul/order/cancelOrder.do',
                    type: 'post',
                    data: {
                        orderId:item.orderId
                    },
                    success: function (data) {
                        let result = data.code;
                        if (result == 100 || result == true) {
                            if (confirm("确定取消该订单？")) {
                                item.state = 8
                            }
                        } else {
                            alert("操作失败 请稍后重试");
                        }
                    },
                    error: function (data) {
                        alert("操作失败 请稍后重试");
                    },
                    dataType: 'json',
                })
            },
            confirmGoods(item){
                $.ajax({
                    url: '/microsoul/order/buyerconfirmreceived.do',
                    type: 'post',
                    data: {
                        orderId:item.orderId
                    },
                    success: function (data) {
                        console.log(data);
                        let result = data.code;
                        if (result == 99999 || result == true) {
                            if (confirm("确认已收货？")) {
                                item.state = 3
                            }
                        } else {
                            alert("操作失败 请稍后重试");
                        }
                    },
                    error: function (data) {
                        alert("操作失败 请稍后重试");
                    },
                    dataType: 'json',
                })
            }
        },
    })
</script>
</html>

