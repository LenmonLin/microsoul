<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>灵微网：商品详情</title>
  <script src="https://cdn.jsdelivr.net/npm/vue"></script><!--vue核心库-->
  <!-- 引入样式 -->
  <link rel="stylesheet" href="https://unpkg.com/element-ui@2.0.11/lib/theme-chalk/index.css">
  <!-- 引入组件库 -->
  <script src="https://unpkg.com/element-ui@2.0.11/lib/index.js"></script>
  <link rel='stylesheet' href='./css1/goods_info.css'>
  <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
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
<div id="app">

    <el-row id="top-cart" style="width:100%;height:100px">
        <el-col :span="4">
            <a href="#" class="logo"><img src="./static/logo.png" width="50px" height="50px"></a>
        </el-col>      
        <el-col :span="6" offset="14">
            <el-menu :default-active="'1'" class="el-menu-demo" mode="horizontal" size="mini"
                     active-text-color="#000000">
                <el-submenu index="1" active-text-color="#000000">
                    <template slot="title">用户名</template>
                    <el-menu-item index="1-1"><a href="./user_order.jsp"
                                                 style="text-decoration: none">用户中心</a></el-menu-item>
                    <el-menu-item index="1-2"><a href="javascript:void(0);" onclick="loginOut()"
                                                 style="text-decoration: none"><span id="loginOut">退出登录</span></a>
                    </el-menu-item>
                </el-submenu>
                <el-menu-item index="2"><a href="./user_order.jsp"
                                           style="text-decoration: none">订单管理</a></el-menu-item>
                <el-menu-item index="3"><a href="./cart.jsp"
                                           style="text-decoration: none">购物车</a></el-menu-item>
            </el-menu>
        </el-col>
    </el-row>
    

      <el-row>
        <el-col :span="9" :offset="2">
          <div style="margin-top: 10%">
              <img :src="info.imageUrl" width="300px">
          </div>
        </el-col>
        <el-col :span="10">
            <el-row>
              <el-col><h2>{{info.goodsName}}</h2>
              <p>{{info.title}}</p></el-col>
            </el-row>
            <el-row>
              <el-col :offset="2">
                <p>单价：{{info.unitPrice|filterMoney}}</p>
                <p>类别：{{info.category}}</p>
                <p>剩余库存：{{info.store}}</p>
                <p>最小购买数量：{{info.purchaseQuantity}}</p>
                <p>商品详情：{{info.detail}}</p>
              </el-col>
            </el-row>
           <el-row>
             <el-col offset="2">
               <el-button type="danger" @click="add_cart">加入购物车</el-button>
               <el-button type="warning" icon="el-icon-star-off" @click="add_collection">收藏</el-button>
             </el-col>
           </el-row>
        </el-col>
      </el-row>
  <h1></h1>
  <div class="seller">
    <el-row>
      <div id="abc"></div>

    </el-row>
  </div>




</div>
</body>
<script>
  new Vue({
    el:'#app',
    data(){
      return{
      goodsId:'',
        info:{
          goodsName:'',
        },
      }
    },
    methods:{
      add_cart:function(){//加入购物车
        var that=this;        
        $.ajax({
          url : '/microsoul/cart/addCartItem.do',
          type : 'post',
          data:{
            goodsId: that.goodsId,
            purchaseQuantity:1,
          },
          success : function(data) {
  			  var result=data.code;
            if(result == 100){
             alert('加入购物车成功');
            }else {
              alert("加入购物车失败，请登录");
            }
          },
          error : function(data) {
            alert(data);
          },
          dataType : 'json',
        }) 
      },
      add_collection:function(){//加入收藏夹
        var that=this;
        $.ajax({
          url : '/microsoul/buyer/addcollection.do',
          type : 'post',
          data:{
            goodsID:that.goodsId,
          },
          success : function(data) {
            var result=data.code;
            if(result == 99999){
              alert('收藏成功')
            }else {
              alert("收藏失败,请先登录");
            }
          },
          error : function(data) {
            alert(data.info);
          },
          dataType : 'json',
        })
  }
 
    },
     filters: {
            filterMoney: function (value) {
                return '￥' + value/100;
            }
        },
    mounted:function(){
      var that=this;
      var reg = new RegExp("(^|&)"+ 'goodsId' +"=([^&]*)(&|$)");
　　     var r = window.location.search.substr(1).match(reg);
　    　 if(r!=null)  
		this.goodsId=unescape(r[2]);
      $.ajax({
        url : '/microsoul/goods/goodDesc.do',
        type : 'post',
        data:{
          goodsId:that.goodsId,
        },
        success : function(data) {

          var list=data.extend.goodsModel;
          var doc=data.extend.goodsDescById.goodDesc;

          that.info = list;
          var result=data.code;
          if(result == 100){
            $("#abc").append(doc);
          }else {
            alert("商品加载失败");
          }
        },
        error : function(data) {
          alert(data);
        },
        dataType : 'json',
      })
    }
  })

 function loginOut() {
        $.ajax({
            url: '/microsoul/buyer/exit.do',
            type: "Post",
            data: {},
            success(data) {
                let result = data.code;
                if (result == 99999) {
                    window.location.href = './mainPage_unLogin.jsp'
                }
                else{
                    alert('操作失败，请重试');
                }
            },
            error() {
                alert('操作失败，请重试');
            },
            dataType: 'json'
        })
    }
</script>
</html>
