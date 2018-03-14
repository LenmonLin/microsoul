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

    <title>收藏管理</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">

    <style>
        .tabs_left .el-tabs--left .el-tabs__header.is-left{
            margin-top: 100px;
            margin-right: 110px;
        }
        .el-menu--horizontal{
            border-bottom: none;
        }

        a:link {color: #5c5c5c;}      /* 未访问链接*/
        a:visited {color: #5c5c5c;}  /* 已访问链接 */
        a:hover {color: #000000;}  /* 鼠标移动到链接上 */
        a:active {color: #5c5c5c;}  /* 鼠标点击时 */
        a:link {text-decoration:none;}
        a:visited {text-decoration:none;}
        a:hover {text-decoration:none;}
        a:active {text-decoration:none;}

    </style>
</head>

<body>
<div class="top" id="center" style="margin: auto;width: 1226px;">
    <el-row id="top-cart" style="width:100%;height:100px">
        <el-col :span="4">
            <a href="http://localhost:8080/mainPage.jsp" class="logo"><img style="margin-top: 30px" src="./static/logo1.png" width="135"
                                                                           height="45"></a>
        </el-col>
        <el-col :span="6" offset="1">
            <div class="title" style="margin-top: 65px;font-size: x-large">收藏管理</div>
        </el-col>
        <el-col :span="6" offset="7">
            <el-menu :default-active="'1'" class="el-menu-demo" mode="horizontal" size="mini"
                     active-text-color="#000000">
                <el-submenu index="1" active-text-color="#000000">
                    <template slot="title">用户名</template>
                    <el-menu-item index="1-1"><a href="http://localhost:8080/user_order.jsp"
                                                 style="text-decoration: none">用户中心</a></el-menu-item>
                    <el-menu-item index="1-2"><a @click="loginOut()"
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
    <el-row style="margin-top: 50px">
        <el-col :span="3">
            <div class="nav_left" style="margin-top: 100px;">
                <div style="height: 8%;width:50%;margin: 30px 0px;text-align: center">
                    <a href="http://localhost:8080/user_order.jsp">订单管理</a>
                </div>
                <div style="height: 8%;width:50%;margin: 30px 0px;text-align: center">
                    <a href="http://localhost:8080/user_collection.jsp" style="color: #409EFF">收藏管理</a>
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
            <el-row style="margin-top: 50px">
                <el-col :span="4" v-for="(item, index) in goodsList" :offset="(index%5) > 0 ? 1 : 0">
                    <div class="card" style="margin-top: 10px">
                        <el-card :body-style="{ padding: '0px'}">

                            <a v-on:click="toDetail(item.goodsId)" style="height: 80%">

                                <img :src="item.imageUrl" style="width: 100%;height: 100%">
                            </a>
                            <div style="text-align: center">
                                <a v-on:click="toDetail(item.goodsId)">{{item.goodsName}}</a>
                            </div>
                            <div style="text-align: center;margin: 10px 20px 10px 20px">
                                <span style="color: crimson">{{item.unitPrice | filterMoney}}</span>
                                <div><i @click="dislike(item.goodsId,index)" class="fa fa-heart" style="font-size:20px;color:red;float: right;margin-bottom:9px"></i></div>
                            </div>
                        </el-card>
                    </div>
                </el-col>
            </el-row>
            <div class="block" style="margin-top: 30px; margin-left: 35%">
                <el-pagination
                        background
                        @current-change="handlePageChange"
                        :current-page.sync="currentPage"
                        :page-size="30"
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
                currentPage: 1,
                total:'0',
                goodsList: [],
            }
        },
        mounted() {
            let that = this;
            $.ajax({
                type: 'Post',
                url: '/microsoul/buyer/showcollectionlist.do',
                dataType: 'json',
                data: {
                    page: 1,
                },
                success: function (data) {
                    console.log(data);
                    that.goodsList = data.extend.collectionList.list;
                    that.total = data.extend.collectionList.total;
                },
                error: function (data) {
                    alert(data);
                }
            })
        },
        methods: {
            loginOut() {
                $.ajax({
                    url: '/microsoul/buyer/exit.do',
                    type: "Post",
                    data: {},
                    success(data) {
                        let result = data.code;
                        if (result == 99999) {
                            window.location.href = 'http://localhost:8080/mainPage_unLogin.jsp'
                        }
                        else{
                            alert('操作失败，请重试');
                        }
                    },
                    error() {
                        alert('操作失败，请重试');
                    },
                    dataType: 'json'
                })
            },
            toDetail(goodsId) {
                window.location.href = '/goods_info.jsp?goodsId=' + goodsId;
            },
            dislike(goodsId,index){
                console.log(goodsId,index);
                if (confirm("取消收藏？")) {
                    let that = this;
                    $.ajax({
                        url: '/microsoul/buyer/deletecollection.do',
                        type: 'post',
                        data: {
                            goodsId: goodsId,
                        },
                        success: function (data) {
                            let result = data.code;
                            console.log(data);
                            if (result == 99999 || result == true) {
                                that.goodsList.splice(index, 1);
                                that.total -=1;
                            } else {
                                alert("操作失败！");
                            }
                        },
                        error: function (data) {
                            alert('操作失败');
                        },
                        dataType: 'json',
                    })
                }

            },
            handlePageChange() {
                let that = this;
                    $.ajax({
                        url: '/microsoul/buyer/showcollectionlist.do',
                        type: 'post',
                        data: {
                            page: that.currentPage,
                        },
                        success: function (data) {
                            that.goodsList = data.extend.collectionList.list;

                        },
                        error: function (data) {
                            alert(data);
                        },
                        dataType: 'json',
                    })
                }
        },
        filters: {
            filterMoney: function (value) {
                return '￥' + value;
            }
        }
    })
</script>
</html>

