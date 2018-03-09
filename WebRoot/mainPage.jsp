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
            <a href="#" class="logo"><img src="../img/logo.png" width="90" height="90"></a>
        </el-col>
        <el-col :span="9" offset="1">
            <el-input v-model="input" style="margin-top: 50px"></el-input>
        </el-col>
        <el-col :span="2">
            <el-button style="margin-top: 50px" @click="handleSearch">搜索</el-button>
        </el-col>
        <el-col :span="6" offset="2">
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
    <el-row style="width: 100%;margin-top: 20px">
        <el-col :span="6" class="cata-nav">
            <div class="cata" style="height: 500px;background-color: #d1d0d0;">
                <div class="blank" style="height: 50px;"></div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="#" class="cata-1" style="margin: auto">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="#" class="cata-1" style="margin: auto">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="#" class="cata-1" style="margin: auto">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="#" class="cata-1" style="margin: auto">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="#" class="cata-1" style="margin: auto">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="#" class="cata-1" style="margin: auto">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="#" class="cata-1" style="margin: auto">品类1</a>
                </div>
                <div style="height: 8%;width:50%;margin: auto;text-align: center">
                    <a href="#" class="cata-1" style="margin: auto">品类1</a>
                </div>
            </div>

        </el-col>
        <el-col :span="18" class="cata-nav">
            <a href="#"><img src="https://i1.mifile.cn/a4/xmad_15167141245145_iYBQn.jpg" width="100%" height="500"></a>
        </el-col>
    </el-row>
    <el-row style="margin-top: 50px">
        <el-col :span="4" v-for="(item, index) in goodsList" :offset="(index%5) > 0 ? 1 : 0">
            <div class="card" style="margin-top: 10px">
                <el-card :body-style="{ padding: '0px'}">
                    <a href="#" style="height: 80%">
                        <img src="../img/gift.png" style="width: 100%;height: 100%">
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
                input: '',
                goodsList: []
            }
        },
        mounted() {
            let that = this;
            $.ajax({
                url: '/microsoul/contentIndex/index.do',
                type: "Post",
                data: {},
                success(data) {
                    let result = data.code;
                    if (result == 100) {
                        that.goodsList = data.extend.goodNodes;
                    }
                },
                error(data) {
                    alert(data);
                },
                dataType: 'json'
            })
        },
        methods:
            {
                handleSearch() {
                        window.location.href='http://localhost:8080/searchResult.jsp?title='+this.input;
                }
            }
    })
</script>
</html>
