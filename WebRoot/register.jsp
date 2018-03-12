<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>注册</title>
  <script src="https://cdn.jsdelivr.net/npm/vue"></script><!--vue核心库-->
  <!-- 引入样式 -->
  <link rel="stylesheet" href="https://unpkg.com/element-ui@2.0.11/lib/theme-chalk/index.css">
  <!-- 引入组件库 -->
  <script src="https://unpkg.com/element-ui@2.0.11/lib/index.js"></script>
  <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
  </script>
  
  <style>
    .login-box{
      margin-top: 0%;
      margin-right: 30%;
      margin-left: 30%;
    }
    body{
      background: #d8eeff;
    }

  </style>

</head>
<body>
<div class="login-box" id="app">
  <el-row>
    <el-col offset="2"><h1>灵微网注册</h1></el-col>
  </el-row>

  <el-form ref="form" :model="form"  :rules="rules" label-width="80px">
    <el-form-item label="用户名"  prop=name>
      <el-input v-model="form.name"></el-input>
    </el-form-item>
    <el-form-item label="手机号" prop=phone>
      <el-input v-model="form.phone"></el-input>
    </el-form-item>
    <el-form-item label="邮箱" prop=email>
      <el-input v-model="form.email"></el-input>
    </el-form-item>
    <el-form-item label="密码" prop=password1>
      <el-input v-model="form.password1" type=password></el-input>
    </el-form-item>
    <el-form-item label="密码" prop=password2>
      <el-input v-model="form.password2" placeholder="请再次输入密码" type=password></el-input>
      
    </el-form-item>
  <el-form-item><p>注册完成后请及时去个人中心完善信息</p></el-form-item>
   <el-form-item>
      <el-row>
        <el-col span="6" offset="5"><el-button id="login1" @click="check1" style="width:100%" type="primary">买家注册</el-button></el-col>
        <el-col :span="6" offset="2">
          <el-button id="login2" @click="check2" style="width:100%" type="success">卖家注册</el-button>
        </el-col>
      </el-row>
    </el-form-item>
  </el-form>
</div>

</body>
<script>
  new Vue({
    el:'#app',
    data (){
	var validatePass2 = (rule, value, callback) => {
        if (value == '') {
          callback(new Error('请再次输入密码'));
        } else if (value != this.form.password1) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return{
        form:{
          name:'',
          phone:'',
          email:'',
          password1:'',
          password2:''
        },
        rules:{
          name: [
            { required: true, message: '请输入用户名', trigger: 'blur' },
            { min: 3, max: 9, message: '长度在 3 到 9 个字符', trigger: 'blur' }
          ],
          phone: [
            { required: true, message: '请填入手机号', trigger: 'blur' },
            { min:10,max:11, message: '请填入11位手机号', trigger: 'blur' }
          ],
          email: [
            { type: 'email', required: true, message: '请填写正确邮箱地址', trigger: 'blur' }
          ],
          password1: [
            { required: true, message: '密码为空', trigger: 'blur' }
          ],
          password2: [
            { validator: validatePass2, trigger: 'blur' }
          ],
        }
      }
    },
    methods : {
      check1: function(event){//买家注册
        //获取值
        var name = this.form.name;
        var password = this.form.password1;
        var phone=this.form.phone;
        var email=this.form.email;
        if(name == '' || password == ''||phone==''||email==''){
          this.$message({
            message : '存在未填项，请填写完整！',
            type : 'error'
          });
          return;
        }
        $.ajax({
          url : '/microsoul/buyer/register.do',
          type : 'post',
          data : {
            accountName : name,
            password : password,
            telephone:phone,
            email:email,
          },
          success : function(data) {
            var result = data.code;
            if(result == '99999'){
              alert("注册成功 将跳转至登录界面");
              window.location.href='./login.jsp';
            }else {
              alert("注册失败 用户名已被注册");
            }
          },
          error : function(data) {
            alert(data);
          },
          dataType : 'json',
        })
      },
      check2:function () {//卖家注册
        var name = this.form.name;
        var password = this.form.password1;
        var phone=this.form.phone;
        var email=this.form.email;
        if(name == '' || password == ''||phone==''||email==''){
          this.$message({
            message : '存在未填项，请填写完整！',
            type : 'error'
          });
          return;
        }
        $.ajax({
          url : '/microsoul/seller/register.do',
          type : 'post',
          data : {
            accountName : name,
            password : password,
            telephone:phone,
            email:email,
          },
          success : function(data) {
            var result = data.code;
            if(result == '99999'){
              alert("注册成功 将跳转至登录界面");
			window.location.href='./login.jsp';
            }else {
              alert("注册失败，用户名已被注册");
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
