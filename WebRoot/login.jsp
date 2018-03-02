<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>灵微网登录界面</title>
    <script src="https://cdn.jsdelivr.net/npm/vue"></script><!--vue核心库-->
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.0.11/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui@2.0.11/lib/index.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js">
</script>
    <style>
        .el-row {
            margin-bottom: 20px;}
        .last-child {
            margin-bottom: 0;
        }


        .login-box {
            margin-top:20%;
            margin-left:50%;
        }
        body{
            background: #d6e5ff;
        }

    </style>
</head>
<body>
<div class="login-box" id="app" >
    <el-row>
        <el-col :span="10">
            <el-input id="name"  v-model="name" placeholder="请输入帐号">
                <template slot="prepend">帐号</template>
            </el-input>
        </el-col>
    </el-row>
    <el-row>
        <el-col :span="10">
            <el-input id="password" v-model="password" type="password" placeholder="请输入密码">
                <template slot="prepend">密码</template>
            </el-input>
        </el-col>
    </el-row>
    <el-row>
        <el-col :span="10">
            <el-button id="login" v-on:click="check" style="width:100%" type="primary">登录</el-button>
        </el-col>
    </el-row>
    <el-button type="text" class="last-child">注册</el-button>
</div>
</body>

<script>
    new Vue({
        el : '#app',
        data : {
            name : '',
            password : ''
        },
        methods : {
            check : function(event){
                //获取值  
                var name = this.name;
                var password = this.password;
                if(name == '' || password == ''){
                    this.$message({
                        message : '账号或密码为空！',
                        type : 'error'
                    })
                    return;
                }
                $.ajax({
                    url : '/microsoul/buyer/login.do',
                    type : 'post',
                    data : {
                    	accountName : name,
                        password : password
                    },
                    success : function(data) {
                        var result = data.code;
                        if(result == 99999|| result == true){
                            alert("登录成功");
                        }else {
                            alert("登录失败");
                        }
                    },
                    error : function(data) {
                        alert(data);
                    },
                    dataType : 'json',
                })
            }
        }
    })

</script>
</html>  