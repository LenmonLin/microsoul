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
        <el-main><goods_issue></goods_issue></el-main>
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
          <el-menu-item index="1-1"><a href="./seller_unpaid_order.html" >未付款订单</a></el-menu-item>
          <el-menu-item index="1-2"><a href="./seller_payoff_order.html" >已付款订单</a></el-menu-item>
          <el-menu-item index="1-3"><a href="./seller_delivery_order.html" >配送中订单</a></el-menu-item>
          <el-menu-item index="1-4"><a href="./seller_completed_order.html" >已完成订单</a></el-menu-item>
        </el-submenu>
        <el-submenu index="2">
          <template slot="title">
            <i class="el-icon-menu"></i>
            <span>商品管理</span>
          </template>
          <el-menu-item index="2-1"><a href="./goods_issue.html" >商品发布</a></el-menu-item>
          <el-menu-item index="2-2"><a href="./goods_manege.html" >商品管理</a></el-menu-item>
        </el-submenu>
        <el-submenu index="3">
          <template slot="title">
            <i class="el-icon-setting"></i>
            <span>设置</span>
          </template>
          <el-menu-item index="3-1"><a href="./seller_info.html">个人信息</a></el-menu-item>
        </el-submenu>
      </el-menu>
    </el-col>
  </el-row>
</script>
<script type="text/x-template" id='header1'>
	<div class="header">灵微网
          <el-button class="dd" size="mini" @click="dialogVisible1=true">注册</el-button>
          <el-button size="mini" @click="dialogVisible = true">登录</el-button>

      </div>
</script>
<script type="text/x-template" id="goods_issue">
    <div>

        <h1>商品发布</h1>

        <el-row>
          <!--action为上传地址-->
            <el-col :span="8">
                <el-upload
                        class="upload-demo"
                        drag
                        action="http://localhost:8080/static/"
                        multiple>
                    <i class="el-icon-upload"></i>
                    <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
                    <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </el-col>
            <el-col :span="10" :offset='2'>
                <el-form :model="info" label-width="100px">
                    <el-form-item label="商品名称">
                        <el-input v-model="info.goodsName"></el-input>
                    </el-form-item>

                    <el-form-item label="商品单价">
                        <el-input v-model="info.unitPrice"></el-input>
                    </el-form-item>
                    <el-form-item label="商品类别">
                        <el-select v-model="info.category" placeholder="请选择商品类别">
                            <el-option v-for="item in options" :label="item.label" :value="item.value"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="商品库存" >
                        <el-input-number v-model="info.store"></el-input-number>
                    </el-form-item>

                    <el-form-item label="最小批发数量">
                        <el-input-number v-model="info.purchaseQuantity"></el-input-number>
                    </el-form-item>
                    <el-form-item label="是否上架">
                        <el-switch v-model="info.status"></el-switch>
                    </el-form-item>
                </el-form>
            </el-col>
        </el-row>
        <el-row>
            <el-col :span="20">
                <el-input lable="商品描述" v-model="info.detail" placeholder="填写商品描述"></el-input>
            </el-col>
        </el-row>
        <div> <p></p></div>
        <el-row>
            <el-col :span="4" :offset="16">
                <el-button type="primary" @click="">确定发布</el-button>
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
  Vue.component('myheader',{
    template:'#header1',
    data() {
      return {

      }
    },
    methods:{

    }
  });

  Vue.component('goods_issue',{
    template:'#goods_issue',
    data(){
      return{
        options:[
          {
            value:1,
            label:'女装'
          },{
            value:2,
            label:'男装'
          },
          {
            value:3,
            label:'个护美妆'
          },{
          value:4,
            label:'手机数码'
          },
          {
            value:5,
            label:'母婴玩具'
          },{
          value:6,
            label:'零食茶酒'
          },{
          value:7,
            label:'生活家电'
          },
          {
            value:8,
            label:'汽车配件用品'
          },{
          value:9,
            label:'图书音像'
          },{
          value:10,
            label:'其他'
          }

        ],
        info:{
          goodsName:'',
          unitPrice:'',
          category:'',
          store:0,
          purchaseQuantity:1,
          status:false,
          detail:''
        }

      }
    },
    methods:{
      issue:function () {
        $.ajax({
          url : 'http://localhost:8080/microsoul/goods/insertGoodsModel.do',
          type : 'post',
          data : { 
                sellerId:;
                goodsName:;
                unitPrice:;
                category:;
                store:;
                status:;
           
          },
          success : function(data) {
            var result = data.result;
            if(result == '99999'){
              alert("发布成功");
            }else {
              alert("发布失败");
            }
          },
          error : function(data) {
            alert(data);
          },
          dataType : 'json',
        })

      }
    }
  });
  new Vue({
    el:'#app'

  });
</script>
</html>
