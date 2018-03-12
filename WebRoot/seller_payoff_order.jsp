<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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

  <el-container id="app">
    <el-header><myheader></myheader></el-header>
    <el-container>
      <el-aside width="200px"><myaside></myaside></el-aside>
      <el-main>
        <div>
          <h1>已付款订单</h1>
          <el-table :data="payoff_info" :stripe="true" style="width: 100%">
            <el-table-column prop="id" label="订单号" width="180px"></el-table-column>
            <el-table-column prop="name" label="买家" width="180px"></el-table-column>
            <el-table-column prop="price" label="总价格" width="180px"></el-table-column>
            <el-table-column prop="num" label="商品种类数" width="180px"></el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  @click="handleInfo(scope.$index)">查看详情</el-button>
                <!--订单详情弹出框-->
                <el-dialog title="订单详情" :visible.sync="dialogTableVisible">
                  <el-table :data="orderdata">
                    <el-table-column property="name" label="商品名" width="200"></el-table-column>
                    <el-table-column property="num" label="数量" width="100"></el-table-column>
                    <el-table-column property="price" label="单价"></el-table-column>
                  </el-table>
                </el-dialog>
                <el-button
                  size="mini"
                  type="primary"
                  @click="handleDeliver(scope.$index)">发货</el-button>
                <!--发货信息填写框-->
                <el-dialog title="发货" :visible.sync="dialogFormVisible">
                  <el-form :model="deliverdata">
                    <el-form-item label="物流单号" :label-width="150">
                      <el-input v-model="deliverdata.delivernum" auto-complete="off"></el-input>
                    </el-form-item>
                  </el-form>
                  <div slot="footer" class="dialog-footer">
                    <el-button @click="dialogFormVisible = false">取 消</el-button>
                    <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
                  </div>
                </el-dialog>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </el-main>
    </el-container>
    <el-footer></el-footer>
  </el-container>

  </body>
<script type="text/x-template" id='header1'>
  <div class="header">灵微网
    <el-button class="dd" size="mini" >注册</el-button>
    <el-button size="mini" >登录</el-button>
  </div>
</script>
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
  new Vue({
    el:'#app',
    data(){
      return{
        dialogTableVisible: false,
        dialogFormVisible: false,
        payoff_info:[//已付款订单信息
          {
            name:'',
            id:''
          }
        ],
        orderdata:[
          {
            num:'',
            price:"",
            name:''
          }
        ]//订单详细信息
        ,
        deliverdata:{//发货信息
        delivernum:''
        }
      }
    },
    methods:{
      handleDeliver(index){
        this.dialogFormVisible=true;
      },
      handleInfo(index){
        this.dialogTableVisible=true;
      }
    },
    created:function(){//挂载数据

    }
  });
</script>
</html>
