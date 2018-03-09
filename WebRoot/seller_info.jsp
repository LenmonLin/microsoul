<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <title>灵微网卖家个人中心</title>
  <script src="https://cdn.jsdelivr.net/npm/vue"></script><!--vue核心库-->
  <!-- 引入样式 -->
  <link rel="stylesheet" href="https://unpkg.com/element-ui@2.0.11/lib/theme-chalk/index.css">
  <!-- 引入组件库 -->
  <script src="https://unpkg.com/element-ui@2.0.11/lib/index.js"></script>
  <link rel='stylesheet' href='./css1/seller_center.css'>
  <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
<div id="app">
  <el-container>
    <el-header><myheader></myheader></el-header>
    <el-container>
      <el-aside width="200px"><myaside></myaside></el-aside>
      <el-main><person_info></person_info></el-main>
    </el-container>
    <el-footer><myfooter></myfooter></el-footer>
  </el-container>
</div>
</body>

<script type="text/x-template" id='aside'>
  <el-row>
    <el-col :span="24">
      <el-menu default-active="1"
               class="el-menu-vertical-demo"
               :unique-opened="true"
               @open="handleOpen"
               @close="handleClose">
        <el-submenu index="1">
          <template slot="title">
            <i class="el-icon-location"></i>
            <span>订单管理</span>
          </template>
          <el-menu-item index="1-1"><a href="./seller_unpaid_order.jsp" >未付款订单</a></el-menu-item>
          <el-menu-item index="1-2"><a href="./seller_payoff_order.jsp" >已付款订单</a></el-menu-item>
          <el-menu-item index="1-3"><a href="./seller_delivery_order.jsp" >配送中订单</a></el-menu-item>
          <el-menu-item index="1-4"><a href="./seller_completed_order.jsp" >已完成订单</a></el-menu-item>
        </el-submenu>
        <el-submenu index="2">
          <template slot="title">
            <i class="el-icon-menu"></i>
            <span>商品管理</span>
          </template>
          <el-menu-item index="2-1"><a href="./goods_issue.jsp" >商品发布</a></el-menu-item>
          <el-menu-item index="2-2"><a href="./goods_manege.jsp" >商品管理</a></el-menu-item>
        </el-submenu>
        <el-submenu index="3">
          <template slot="title">
            <i class="el-icon-setting"></i>
            <span>设置</span>
          </template>
          <el-menu-item index="3-1"><a href="./seller_info.jsp">个人信息</a></el-menu-item>
        </el-submenu>
      </el-menu>
    </el-col>
  </el-row>
</script>
<script type="text/x-template" id='header1'>
  <div class="header">灵微网
    <el-button class="dd" size="mini" >注册</el-button>
    <el-button size="mini" >登录</el-button>
  </div>
</script>
<script type="text/x-template" id="seller_info">
  <div>
    <h1>个人信息</h1>
    <el-button size="medium" @click="dialogVisible=true">修改密码</el-button>
    <el-dialog width="30%" title="密码修改"
               :visible.sync="dialogVisible"
    center="true">
      <el-form>
        <el-form-item><el-input v-model="password" placeholder="请输入旧密码"></el-input></el-form-item>
        <el-form-item><el-input  v-model="password1" placeholder="请输入新密码"></el-input></el-form-item>
        <el-form-item><el-input v-model="password2"  placeholder="请再次输入新密码"></el-input></el-form-item>
      </el-form>
      <el-row>
        <el-col offset="9"><span><el-button type="primary" @click="changePassword()">确认</el-button></el-input></span></el-col>
      </el-row>

    </el-dialog>
<el-row>
  <el-col :span="12" offset="4">
    <el-form :model="form" label-width="150px" size="medium">
      <el-form-item label="用户名" prop="accountName">
        {{form.accountName}}
      </el-form-item>
      <el-form-item label="手机号" prop="telephone">
        <el-input v-model="form.telephone"></el-input>
      </el-form-item>
      <el-form-item label="地区">
        <el-input v-model="form.district"></el-input>
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input v-model="form.email"></el-input>
      </el-form-item>
      <el-form-item label="易宝账号">
        <el-input v-model="form.merid"></el-input>
      </el-form-item>
      <el-form-item label="易宝密钥">
        <el-input v-model="form.merkey"></el-input>
      </el-form-item>
      <el-form-item label="真实姓名">
        <el-input v-model="form.realName"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">确认修改</el-button>      
      </el-form-item>
    </el-form>
  </el-col>
</el-row>
  </div>
</script>
<script>
  Vue.component('myaside',{
    template:'#aside',
    data() {
      return {
        isCollapse: true
      }
    },
    methods: {
      handleOpen(key, keyPath) {
        console.log(key, keyPath);
      },
      handleClose(key, keyPath) {
        console.log(key, keyPath);
      }
    }
  });
  Vue.component('person_info',{
    template:'#seller_info',
    data(){
      return {
        password:'',
        password1:'',
        password2:'',
        dialogVisible:false,
        form:{
          accountName:'',
          telephone:'',
          district:'',
          email:'',
          merkey:"",
          merid:'',
          realName:'',

        }
      }
    },
    methods:{
      onSubmit(){
      var info=this.form;
        this.$confirm('此操作将修改个人信息, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          $.ajax({
          url : 'http://localhost:8080/microsoul/seller/sellerInfo.do',
          type : 'post',
          data:{         
          telephone:info.telephone,
          district:info.district,
          email:info.email,
          merkey:info.merkey,
          merid:info.merid,
          realName:info.realName,
          },
          success : function(data) {
            
            var result=data.code;
            if(result == 100){
				alert('个人信息修改成功');
            }else {
              alert("信息修改失败");
            }
          },
          error : function(data) {           
            alert('发生错误')
          },
          dataType : 'json',
        })
          
        })},
      changePassword(){
      var that=this;
        var password=this.password;
        var password1=this.password1;
        var password2=this.password2;
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
          url : 'http://localhost:8080/microsoul/seller/sellerChangePassword.do',
          type : 'post',
          data:{
          accountName:that.form.accountName,
            password:password,
            newPassword:password1  
          },
          success : function(data) {          
            var result=data.code;
            if(result == 100){
				alert('密码修改成功');
				that.dialogVisible=false;
	
            }else {
              alert("密码修改失败");
            }
          },
          error : function(data) {
            alert('666');
          },
          dataType : 'json',
        })
          }

    },
    mounted:function(){
        var that=this;
        $.ajax({
          url : 'http://localhost:8080/microsoul/seller/showSeller.do',
          type : 'post',
          data:{
       
          },
          success : function(data) {
            that.form=data.extend.sellerModel;
            var result=data.code;
            if(result == 100){

            }else {
              alert("信息加载失败");
            }
          },
          error : function(data) {
            alert(data);
          },
          dataType : 'json',
        })
      }
  });
  Vue.component('myheader',{
    template:'#header1',
    data() {
      return {

      }
    },
    methods:{

    }
  });


  new Vue({
    el:'#app',
   

  });
</script>
</html>

