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
    <el-row id="page-top" style="width:100%;height:100px">
        <el-col :span="4">
            <a href="#" class="logo"><img src="../img/logo.png" width="90" height="90"></a>
        </el-col>
        <el-col :span="6" offset="13">
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
    <el-row id="page-middle" style="width: 100%;margin-top: 60px">
        <el-col :span="4" id="cata-nav">
            <div class="cata" style="height: 500px">
                <div class="blank" style="height: 50px;"></div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="#" style="">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="#" style="">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="#" style="">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="#" style="">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="#" style="">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="#" style="">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin-left: 20%;">
                    <a href="#" style="">品类1</a>
                </div>
            </div>
        </el-col>
        <el-col :span="20">
            <el-row>
                <el-col :span="4" v-for="(item, index) in goodsList" :offset="(index%5) > 0 ? 1 : 0">
                    <div class="card" style="margin-top: 10px">
                        <el-card :body-style="{ padding: '0px'}">
                            <a href="#" style="height: 80%">
                                <img :src="item.imageUrl" style="width: 100%;height: 100%">
                            </a>
                            <div style="text-align: center">
                                <a herf="#">{{item.goodsName}}</a>
                            </div>
                            <div style="text-align: center;margin: 10px 20px 20px 20px">
                                <span>{{item.unitPrice}}</span>
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
                        layout="prev, pager, next"
                        :total="total">
                </el-pagination>
            </div>
        </el-col>
    </el-row>
</div>
<el-row id="site-footer" style="height: 40px;">
    <div class="footer">这里要改</div>
</el-row>
</body>


<script>

    // 组件实例化############################################################
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
                url: '/microsoul/goods/search.do',
                type: "post",
                data: {
                    title: that.input
                },
                success: function (data) {
                    console.log(data);
                    let result = data.code;
                    if (result == 100) {
                        that.goodsList = data.extend.goodsModelPageInfo.list;
                        that.total = data.extend.goodsModelPageInfo.total;
                        console.log(that.goodsList);
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
            handlePageChange() {
                let that = this;
                $.ajax({
                    url: '/microsoul/goods/search.do',
                    type: 'post',
                    data: {
                        title: that.input,
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
        }
    })
</script>
</html>
