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

    <title>用户信息</title>
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
            <a href="http://localhost:8080/mainPage.jsp" class="logo"><img style="margin-top: 30px" src="./static/logo1.png" width="135"
                                                                           height="45"></a>
        </el-col>
        <el-col :span="6" offset="1">
            <div class="title" style="margin-top: 65px;font-size: x-large">用户信息</div>
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
                    <a href="http://localhost:8080/user_address.jsp">地址管理</a>
                </div>
                <div style="height: 8%;width:50%;margin: 30px 0px;text-align: center">
                    <a href="http://localhost:8080/user_info.jsp" style="color: #409EFF">用户信息</a>
                </div>
            </div>
        </el-col>
        <el-col :span="18" offset="3">
            <div style="width:50%; margin-top: 90px">
                <el-form :model="userInfo" status-icon :rules="rules" ref="userInfo" label-width="100px"
                         class="demo-ruleForm">
                    <el-form-item label="用户名:" prop="accountName">
                        <span>{{userInfo.accountName}}</span>
                    </el-form-item>
                    <el-form-item label="手机号" prop="telephone">
                        <el-input v-model="userInfo.telephone" auto-complete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="邮箱" prop="email">
                        <el-input v-model="userInfo.email" auto-complete="off"></el-input>
                    </el-form-item>
                    <el-button size="mini" @click="dialogVisible=true" type="warning" plain>修改密码</el-button>
                    <el-dialog width="30%" title="密码修改"
                               :visible.sync="dialogVisible"
                               center="true">
                        <el-form :model="userInfo" status-icon :rules="rules" ref="userInfo" label-width="10px">
                            <el-form-item>
                                <el-input type="password" v-model="password" placeholder="请输入旧密码" auto-complete="off"></el-input>
                            </el-form-item>
                            <el-form-item>
                                <el-input type="password" v-model="password1" placeholder="请输入新密码" auto-complete="off"></el-input>
                            </el-form-item>
                            <el-form-item>
                                <el-input type="password" v-model="password2" placeholder="请再次输入新密码" auto-complete="off"></el-input>
                            </el-form-item>
                        </el-form>
                        <el-row>
                            <el-col offset="9"><span><el-button type="primary" @click="changePassword()">确认</el-button>
                                </span></el-col>
                        </el-row>

                    </el-dialog>

                    <el-form-item style="margin-left: 30%; margin-top: 50px">
                        <el-button type="primary" @click="submitForm(userInfo)">保存</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-col>
    </el-row>
</div>
</body>

<script>
    function changePassword() {
        window.location.href = 'http://localhost:8080/microsoul/buyer/modifypsw.do'
    }

    new Vue({
        el: '#center',
        data() {
            return {
                dialogVisible:false,
                userInfo: {
                    telephone: '',
                    email: '',
                    password:'',
                    password1:'',
                    password2:'',
                },
                rules1: {
                    telephone: [
                        {required: true, message: '请输入收货人手机号', trigger: 'blur'},
                        {min: 11, max: 11, message: '请输入有效的11位手机号', trigger: 'blur'}
                    ],
                    password: [
                        {required: true, min: 8, max: 16, message: '请输入8-16位密码', trigger: 'blur'},
                    ],
                    password1: [
                        {required: true, min: 8, max: 16, message: '请输入8-16位密码', trigger: 'blur'},
                    ],
                    password2: [
                        {required: true, min: 8, max: 16, message: '请输入8-16位密码', trigger: 'blur'},
                    ]
                },
            };
        },
        mounted() {
            let that = this;
            $.ajax({
                type: 'Post',
                url: 'http://localhost:8080/microsoul/buyer/getbuyerinfo.do',
                data: {},
                dataType: 'json',
                success: function (data) {
                        that.userInfo = data;
                        console.log(that.userInfo)///////
                }
            })
        },
        methods: {
            submitForm(userInfo) {
                this.$refs[userInfo].validate((valid) => {
                    if (valid) {
                        alert('submit!');
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
//                let that = this;
//                $.ajax({
//                    url: '/microsoul/buyer/updateinfo.do',
//                    type: 'post',
//                    data: {
//                        telephone: userInfo.telephone,
//                        email: userInfo.email,
//                    },
//                    success: function (data) {
//                        let result = data.code;
//                        console.log(data);
//                        if (result == 99999 || result == true) {
//                            alert("保存成功");
//                        }
//                    },
//                    error: function () {
//                        alert('操作失败');
//                    },
//                    dataType: 'json',
//                })
            },
            changePassword(){
                let that=this;
                let password=this.password;
                let password1=this.password1;
                let password2=this.password2;
                if(password==''||password2==''|| password1==''){
                    this.$message({
                        message : '密码为空！',
                        type : 'error'
                    });
                    return;}
                if(password2!=password1) {
                    this.$message({
                        message: '两次密码输入不一致！',
                        type: 'error'
                    });
                    return;}
                $.ajax({
                    url : 'http://localhost:8080/microsoul/buyer/modifypsw.do',
                    type : 'post',
                    data:{
                        oldpsw:that.password,
                        newpsw:that.password1,
                    },
                    success : function(data) {
                        let result=data.code;
                        if(result == 100){
                            alert('密码修改成功');
                            that.dialogVisible=false;
                        }else {
                            alert("操作失败，请重试！");
                        }
                    },
                    error : function() {
                        alert('操作失败，请重试！');
                    },
                    dataType : 'json',
                })
            }
        }
    })
</script>
</html>

