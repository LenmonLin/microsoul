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

    <title>地址管理</title>
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
            <a href="http://localhost:8080/mainPage.jsp" class="logo"><img src="./static/logo.png" width="90"
                                                                           height="90"></a>
        </el-col>
        <el-col :span="6" offset="1">
            <div class="title" style="margin-top: 65px;font-size: x-large">地址管理</div>
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
    <el-row style="margin-top: 50px">
        <el-col :span="3">
            <div class="nav_left" style="margin-top: 100px;">
                <div style="height: 8%;width:50%;margin: 30px 0px;text-align: center">
                    <a href="http://localhost:8080/user_order.jsp">订单管理</a>
                </div>
                <div style="height: 8%;width:50%;margin: 30px 0px;text-align: center">
                    <a href="http://localhost:8080/user_collection.jsp">收藏管理</a>
                </div>
                <div style="height: 8%;width:50%;margin: 30px 0px;text-align: center">
                    <a href="http://localhost:8080/user_address.jsp"  style="color: #409EFF">地址管理</a>
                </div>
                <div style="height: 8%;width:50%;margin: 30px 0px;text-align: center">
                    <a href="http://localhost:8080/user_info.jsp">用户信息</a>
                </div>
            </div>
        </el-col>

        <el-col :span="18" offset="3">
            <div style="width:50%; margin-top: 70px">
                <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px"
                         class="demo-ruleForm">
                    <el-form-item label="姓名" prop="realName">
                        <el-input v-model="ruleForm.realName" auto-complete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="手机号" prop="telephone">
                        <el-input v-model="ruleForm.telephone" auto-complete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="收货地址" prop="address">
                        <el-input type="textarea" v-model="ruleForm.address"></el-input>
                    </el-form-item>
                    <el-form-item style="margin-left: 30%; margin-top: 50px">
                        <el-button type="primary" @click="submitForm()">提交</el-button>
                    </el-form-item>
                </el-form>
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
                ruleForm: {
                },
                rules: {
                    realName: [
                        {required: true, message: '请输入收货人姓名', trigger: 'blur'},
                    ],
                    telephone: [
                        {required: true, message: '请输入收货人手机号', trigger: 'blur'},
                        {min: 11, max: 11, message: '请输入有效的11位手机号', trigger: 'blur'}
                    ],
                    address: [
                        {required: true, message: '请输入收货地址', trigger: 'blur'},
                    ]
                }
            };
        },
        mounted(){
            let that = this;
            $.ajax({
                type: 'Post',
                url: 'http://localhost:8080/microsoul/buyer/getbuyerinfo.do',
                data: {},
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    that.ruleForm = data;
                    console.log(that.ruleForm);
                }
            })
        },
        methods: {
            submitForm() {
                let that = this;
                $.ajax({
                    type: 'Post',
                    url: '/microsoul/buyer/selectinfo.do',
                    data: {
                        name: that.name,
                        phone: that.phone,
                        address: that.address
                    },
                    dataType: 'json',
                    success: function (data) {
                        let result = data.result;
                        if (result == 99999 || result == true) {
                            console.log(data);
//                        that.ruleForm = data.extend.pageInfo.list;     ///////
                        }
                        else{
                            alert(data);
                        }
                    }
                })
            }
        }
    })
</script>
</html>
