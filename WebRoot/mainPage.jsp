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

    <title>首页</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <el-row id="page-top" style="width:100%;height:100px">
        <el-col :span="4">
            <a href="http://localhost:8080/mainPage.jsp" class="logo"><img style="margin-top: 30px" src="./static/logo1.png" width="135"
                                                                           height="45"></a>
        </el-col>
        <el-col :span="9" offset="1">
            <el-input v-model="input" style="margin-top: 50px"></el-input>
        </el-col>
        <el-col :span="2">
            <el-button style="margin-top: 50px" type="primary" plain @click="handleSearch">搜索</el-button>
        </el-col>
        <el-col :span="6" offset="2">
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
    <el-row style="width: 100%;margin-top: 20px">
        <el-col :span="6" class="cata-nav">
            <div class="cata" style="height: 500px;background-color: #d1d0d0;">
                <div class="blank" style="height: 50px;"></div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="javascript:void(0);" onclick="handelSearch1()" style="margin: auto">女&emsp;&emsp;装</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="javascript:void(0);" onclick="handelSearch2()" style="margin: auto">男&emsp;&emsp;装</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="javascript:void(0);" onclick="handelSearch3()" style="margin: auto">个护美妆</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="javascript:void(0);" onclick="handelSearch4()" style="margin: auto">手机数码</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="javascript:void(0);" onclick="handelSearch5()" style="margin: auto">母婴玩具</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="javascript:void(0);" onclick="handelSearch6()" style="margin: auto">零食茶酒</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="javascript:void(0);" onclick="handelSearch7()" style="margin: auto">生活家电</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="javascript:void(0);" onclick="handelSearch8()" style="margin: auto">汽车配件</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="javascript:void(0);" onclick="handelSearch9()" style="margin: auto">图书音像</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="javascript:void(0);" onclick="handelSearch10()"
                       style="margin: auto">其&emsp;&emsp;他</a>
                </div>
            </div>

        </el-col>
        <el-col :span="18" class="cata-nav">
            <a @click="toDetail(this.goodsId)"><img :src="this.adsList[0].src" width="100%" height="500"></a>
        </el-col>
    </el-row>
    <el-row style="margin-top: 50px">
        <el-col :span="4" v-for="(item, index) in goodsList" :offset="(index%5) > 0 ? 1 : 0">
            <div class="card" style="margin-top: 20px">
                <el-card :body-style="{ padding: '0px'}">

                    <a @click="toDetail(item.goodsId)">
                        <img :src="item.imageUrl" style="width: 100%;height: 100%">
                    </a>
                    <div style="text-align: center">
                        <a  @click="toDetail(item.goodsId)">{{item.title}}</a>
                    </div>
                    <div style="text-align: center;margin: 10px 20px 20px 20px">
                        <span style="color: crimson">{{item.unitPrice | filterMoney}}</span>
                    </div>
                </el-card>
            </div>
        </el-col>
    </el-row>

</div>
<el-row id="site-footer">
    <div class="footer" style="height: 100px"></div>
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
                input: '',
                goodsList: [],
                adsList: [],
                goodsId: '',
            }
        },
        mounted() {
            let that = this;
            $.ajax({
                url: '/microsoul/contentIndex/index.do',
                type: "Post",
                data: {},
                success(data) {
                    console.log(data);
                    let result = data.code;
                    if (result == 100) {
                        that.goodsList = data.extend.goodNodes;
                        that.adsList = data.extend.ad1Nodes;
                        that.goodsId = data.extend.ad1Nodes[0].href.split('=')[1];
                        console.log(that.goodsId);
                    }
                    console.log(that.adsList);
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
            handleSearch() {
                window.location.href = 'http://localhost:8080/searchResult.jsp?title=' + this.input;
            },
        },
        filters: {
            filterMoney: function (value) {
                return '￥' + value/100;
            }
        }
    })
</script>
</html>
