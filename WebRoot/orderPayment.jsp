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

    <title>订单结算</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/font-awesome.min.css">

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
            <div class="title" style="margin-top: 65px;font-size: x-large">订单结算</div>
        </el-col>
        <el-col :span="6" offset="7">
            <el-menu :default-active="'1'" class="el-menu-demo" mode="horizontal" size="mini"
                     active-text-color="#000000">
                <el-submenu index="1" active-text-color="#000000">
                    <template slot="title">用户名</template>
                    <el-menu-item index="1-1"><a href="http://localhost:8080/user_order.jsp"
                                                 style="text-decoration: none">用户中心</a></el-menu-item>
                    <el-menu-item index="1-2"><a href="javascript:void(0);" onclick="loginOut()"
                                                 style="text-decoration: none"><span id="loginOut">退出登录</span></a>
                    </el-menu-item>
                </el-submenu>
                <el-menu-item index="2"><a href="http://localhost:8080/user_order.jsp"
                                           style="text-decoration: none">订单管理</a></el-menu-item>
                <el-menu-item index="3"><a href="http://localhost:8080/cart.jsp"
                                           style="text-decoration: none">购物车</a></el-menu-item>
            </el-menu>
        </el-col>
    </el-row>
    <div style="margin-top: 50px;font-size: larger">收货人信息</div>
    <div style="margin-top: 20px">
        <span style="margin-left: 50px">姓名 </span>
        <span> 手机号 </span>
        <span> 收货地址</span>
    </div>
    <div style="margin-top: 50px;margin-bottom: 30px; font-size: larger">配送清单</div>
    <el-row v-for="item in orderList" style="margin-top: 20px;margin-bottom: 30px">
        <div style="height: 30px;">
            <span>{{item.sellerName}}</span><span>{{item.totalPrice}}</span>
        </div>
        <el-table
                :show-header="false"
                tooltip-effect="dark"
                style="width: 100%;margin-left: 5%"
                :data="item.goods">
            <el-table-column
                    width="80"
                    align="center">
                <template slot-scope="scope">
                    <div class="img" style="width: 100%;height: 80px">
                        <a href="#" class="logo"><img src="scope.row.imageUrl" width="70" height="70"></a>
                    </div>
                </template>
            </el-table-column>
            <el-table-column
                    prop="goodsName"
                    width="354"
                    align="center">
            </el-table-column>
            <el-table-column
                    prop="unitPrice"
                    :formatter="filterMoney"
                    width="184"
                    align="center">
            </el-table-column>
            <el-table-column
                    prop="purchaseQuantity"
                    width="184"
                    align="center">
            </el-table-column>
        </el-table>
    </el-row>
    <div style="margin-top: 50px;margin-bottom: 20px; font-size: larger">发票信息</div>
    <div style="margin-left: 50px">普通发票 个人 商品明细</div>
    <div style="margin-left: 80%">订单总额：</div>
    <div style="margin-left: 80%">优惠：</div>
    <div style="margin-left: 80%">运费：</div>
    <div style="margin-left: 80%">应付总额：</div>
    <el-button @click="handlePay" style="margin-left: 80%;margin-top: 20px">付款</el-button>
</div>
</body>

<script>
    new Vue({
        el: '#center',
        data() {
            return {
                totalPrice: 0,
                orderId: [],
                sellerId: [],
                pd_FrpId: '',
                orderList: []
            }
        },
        mounted() {
            <%--<% let orderId = session.getAttribute("orderId"); %>--%>
            console.log(this.orderId);
            let that = this;
            $.ajax({
                type: 'Post',
                url: '/microsoul/order/payOrder.do',
                data:{
                  orderId:that.orderId,
                },
                dataType: 'json',
                success: function (data) {
                    that.orderList = data.extend.pageInfo.list;
                }
            })
        },
        methods: {
            handlePay(){
                let that = this;
                $.ajax({
                    type: 'Post',
                    url: '/microsoul/order/payOrder.do',
                    data:{
                        orderIds:that.orderId,
                        totalPrice:that.totalPrice,
                        idSeller: that.sellerId,
                        pd_FrpId:that.pd_FrpId
                    },
                    dataType: 'json',
                    success: function (data) {
                        let result = data.result;
                        if (result == 99999 || result == true) {
                            //跳转第三方
                        }
                    }
                })
            },
            filterMoney(row, column) {
                return '￥' + row[column.property];
            }
        }
    })
</script>
</html>
