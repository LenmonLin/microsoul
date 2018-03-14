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
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <title>结果展示</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/font-awesome.min.css">

    <style>
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
<div class="top" id="app" style=" width :1226px; margin: auto;">
    <el-row id="top-cart" style="width:100%;height:100px">
        <el-col :span="4">
            <a href="http://localhost:8080/mainPage.jsp" class="logo"><img style="margin-top: 30px" src="./static/logo1.png" width="135"
                                                                           height="45"></a>
        </el-col>
        <el-col :span="6" offset="1">
            <div class="title" style="margin-top: 65px;font-size: x-large"></div>
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
    <el-row id="page-middle" style="width: 100%;margin-top: 60px">
        <el-col :span="4" id="cata-nav">
            <div class="cata" style="height: 500px">
                <div class="blank" style="height: 50px;"></div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="javascript:void(0);" onclick="handelSearch1()" style="">女&emsp;&emsp;装</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="javascript:void(0);" onclick="handelSearch2()" style="">男&emsp;&emsp;装</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="javascript:void(0);" onclick="handelSearch3()" style="">个护美妆</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="javascript:void(0);" onclick="handelSearch4()" style="">手机数码</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="javascript:void(0);" onclick="handelSearch5()" style="">母婴玩具</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="javascript:void(0);" onclick="handelSearch6()" style="">零食茶酒</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="javascript:void(0);" onclick="handelSearch7()" style="">生活家电</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="javascript:void(0);" onclick="handelSearch8()" style="">汽车配件</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="javascript:void(0);" onclick="handelSearch9()" style="">图书音像</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="javascript:void(0);" onclick="handelSearch10()" style="">其&emsp;&emsp;他</a>
                </div>
            </div>
        </el-col>
        <el-col :span="20">
            <el-row>
                <el-col :span="4" v-for="(item, index) in goodsList" :offset="(index%5) > 0 ? 1 : 0">
                    <div class="card" style="margin-top: 10px">
                        <el-card :body-style="{ padding: '0px'}">
                            <a v-on:click="toDetail(item.goodsId)" style="height: 80%">
                                <img :src="item.imageUrl" style="width: 100%;height: 100%">
                            </a>
                            <div style="text-align: center">
                                <a v-on:click="toDetail(item.goodsId)">{{item.goodsName}}</a>
                            </div>
                            <div style="text-align: center;margin: 10px 20px 20px 20px">
                                <span>{{item.unitPrice | filterMoney}}</span>
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
<el-row id="site-footer">
    <div class="footer"  style="height: 100px"></div>
</el-row>
</body>


<script>

    // 组件实例化############################################################
    function handelSearch1() {
        window.location.href = 'http://localhost:8080/searchCategory.jsp?category=1'
    }

    function handelSearch2() {
        window.location.href = 'http://localhost:8080/searchCategory.jsp?category=2'
    }

    function handelSearch3() {
        window.location.href = 'http://localhost:8080/searchCategory.jsp?category=3'
    }

    function handelSearch4() {
        window.location.href = 'http://localhost:8080/searchCategory.jsp?category=4'
    }

    function handelSearch5() {
        window.location.href = 'http://localhost:8080/searchCategory.jsp?category=5'
    }

    function handelSearch6() {
        window.location.href = 'http://localhost:8080/searchCategory.jsp?category=6'
    }

    function handelSearch7() {
        window.location.href = 'http://localhost:8080/searchCategory.jsp?category=7'
    }

    function handelSearch8() {
        window.location.href = 'http://localhost:8080/searchCategory.jsp?category=8'
    }

    function handelSearch9() {
        window.location.href = 'http://localhost:8080/searchCategory.jsp?category=9'
    }

    function handelSearch10() {
        window.location.href = 'http://localhost:8080/searchCategory.jsp?category=10'
    }

    new Vue({
        el: '#app',
        data() {
            return {
                currentPage: 1,
                total: 0,
                input: '',
                goodsList: []
            }
        },
        mounted() {
            let url = location.search; //获取url中"?"符后的字串
            let strs = [];
            if (url.indexOf("?") != -1) {
                strs = url.split("=");
            }
            this.input = decodeURI(strs[1], "utf-8");
            let that = this;
            $.ajax({
                url: '/microsoul/goods/searchCategory.do',
                type: "post",
                data: {
                    category: that.input
                },
                success: function (data) {
                    console.log(data);
                    let result = data.code;
                    if (result == 100) {
                        that.goodsList = data.extend.goodsModelPageInfo.list;
                        that.total = data.extend.goodsModelPageInfo.total;
                    } else {
                        alert("失败！");
                    }
                },
                error(data) {
                    alert(data);
                },
                dataType: 'json'
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
                window.location.href = 'http://localhost:8080/goods_info.jsp?goodsId=' + goodsId;
            },
            handlePageChange() {
                let that = this;
                $.ajax({
                    url: '/microsoul/goods/searchCategory.do',
                    type: 'post',
                    data: {
                        category: that.input,
                        page: that.currentPage,
                    },
                    success: function (data) {
                        console.log(data);
                        that.goodsList = data.extend.goodsModelPageInfo.list;
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
                return '￥' + value/100;
            }
        }
    })
</script>
</html>

