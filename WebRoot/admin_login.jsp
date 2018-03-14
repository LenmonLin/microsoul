<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>灵微网广告管理</title>
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <!--vue核心库-->
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.0.11/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui@2.0.11/lib/index.js"></script>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
    </script>
</head>

<body>
    <div id="app">
        <el-container>
            <el-header>
                <myheader></myheader>
            </el-header>

            <el-footer>
                <myfooter></myfooter>
            </el-footer>
        </el-container>
    </div>
</body>



<script type="text/x-template" id='header1'>
    <div class="header">管理登陆

        <el-button size="mini" @click="dialogVisible = true">登录</el-button>
        <el-dialog title="登录" :visible.sync="dialogVisible" width="30%">
            <login></login>
        </el-dialog>

</script>
<script type="text/x-template" id='login'>
    <div class="login-box">
        <el-row>
            <el-col :span="20">
                <el-input id="acountName" v-model="acountName" placeholder="请输入帐号">
                    <template slot="prepend">帐号</template>
                </el-input>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="20">
                <el-input id="password" v-model="password" type="password" placeholder="请输入密码">
                    <template slot="prepend">密码</template>
                </el-input>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="8" offset="4">
                <el-button id="login2" v-on:click="check" style="width:100%" type="success">登录</el-button>
            </el-col>
        </el-row>
    </div>
</script>

<script>
    Vue.component('myheader', {
        template: '#header1',
        data() {
            return {
                dialogVisible: false,
                dialogVisible1: false,
                dialogVisible2: false,
                dialogVisible3: false
            }
        },
        methods: {

        }
    });
    Vue.component('login', {
        template: '#login',
        data() {
            return {
                acountName: '',
                password: ''
            }
        },
        methods: {
            check: function(event) {
                //获取值
                var acountName = this.acountName;
                var password = this.password;
                if (acountName == '' || acountName == '') {
                    this.$message({
                        message: '账号或密码为空！',
                        type: 'error'
                    });
                    return;
                }
                $.ajax({
                    url: 'http://localhost:8080/microsoul/admin/adminlogin.do',
                    type: 'post',
                    data: {
                        acountName: acountName,
                        password: password
                    },
                    success: function(data) {
                        var result = data.code;
                        if (result == '99999') {
                            alert("登录成功");
                            window.location.href = '/admin_advertise.jsp';
                        } else {
                            alert("登录失败");
                        }
                           },
                           error: function(data) {
                               alert(data);
                           },
                           dataType: 'json',
                       })


                   }
               }
           });

           new Vue({
               el: '#app'

           });
       </script>

       </html>