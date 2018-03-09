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
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <title>收藏管理</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/font-awesome.min.css">

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
            <a href="#" class="logo"><img src="../img/logo.png" width="90" height="90"></a>
        </el-col>
        <el-col :span="6" offset="1">
            <div class="title" style="margin-top: 65px;font-size: x-large">收藏管理</div>
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
            <el-row style="margin-top: 20px">
                <el-col :span="4" v-for="(item, index) in 10" :key="index" :offset="(index%5) > 0 ? 1 : 0">
                    <div class="card" style="margin-top: 10px">
                        <el-card :body-style="{ padding: '0px'}">
                            <a href="#" style="height: 80%">
                                <img src="../img/gift.png" style="width: 100%;height: 100%">
                            </a>
                            <div style="text-align: center">
                                <a herf="#">name</a>
                            </div>
                            <div style="text-align: center;margin: 10px 20px 20px 20px">
                                <span>price</span>
                            </div>
                        </el-card>
                    </div>
                </el-col>
            </el-row>
        </el-col>
    </el-row>
</div>
</body>

<script>
    new Vue({
        el: '#center',
        data() {
            return {
                activeName: 'first',
                goodsList: [],
            }
        },
        methods: {
            handleClick(tab, event) {
                console.log(tab, event);
            }
        },
        computed:{

        }
    })
</script>
</html>

