<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
  <script src="https://cdn.jsdelivr.net/npm/vue"></script><!--vue核心库-->
  <!-- 引入样式 -->
  <link rel="stylesheet" href="https://unpkg.com/element-ui@2.0.11/lib/theme-chalk/index.css">
  <!-- 引入组件库 -->
  <script src="https://unpkg.com/element-ui@2.0.11/lib/index.js"></script>
  <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
  </script>
  
  <style>
    .el-row {
      margin-bottom: 20px;}
    .last-child {
      margin-bottom: 0;
    }

.22{
margin-left:20%;
}
    .login-box {
      margin-top:15%;
      margin-left:50%;
      border-width: 10px;
    }
    body{
      background: #d8eeff;
    }

  </style>

</head>
<body>
<div class='22'><h1>灵微网</h1></div>
<div class="login-box" id="app">
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
    <el-col :span="4">
      <el-button id="login1" v-on:click="check1" style="width:100%" type="primary">买家登录</el-button>
    </el-col>
    <el-col :span="4" offset="2">
      <el-button id="login2" v-on:click="check2" style="width:100%" type="success">卖家登录</el-button>
    </el-col>
  </el-row>
  <a href="./register.jsp">注册</a>
</div>

</body>
<script>
  new Vue({
    el:'#app',
    data (){
      return{
        name : '',
        password : ''
      }
    },
    methods : {
      check1: function(event){//买家登录
        //获取值
        var name = this.name;
        var password = this.password;
        if(name == '' || password == ''){
          this.$message({
            message : '账号或密码为空！',
            type : 'error'
          });
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
            if(result == '99999'){
              alert("登录成功");
              window.location.href='./mainPage.jsp'
            }else {
              alert("登录失败");
            }
          },
          error : function(data) {
            alert(data);
          },
          dataType : 'json',
        })
      },
      check2:function(){//卖家登录
        var name = this.name;
        var password = this.password;
        if(name == '' || password == ''){
          this.$message({
            message : '账号或密码为空！',
            type : 'error'
          });
          return;
        }
        $.ajax({
          url : '/microsoul/seller/login.do',
          type : 'post',
          data : {
            accountName : name,
            password : password
          },
          success : function(data) {
            var result = data.code;
            if(result ==99999){
              alert("登录成功");
              window.location.href='./goods_manege.jsp';
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


  },
  
  });
</script>
</html>
