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
        <h1>未付款订单</h1>
        <el-table :data="info" :stripe="true" style="width: 100%">
          <el-table-column prop="orderId" label="订单号" width="180px"></el-table-column>
          <el-table-column prop="buyerId" label="买家ID" width="180px"></el-table-column>
          <el-table-column label="收货人" width="180px">
        <template slot-scope="scope">
          <span  >{{scope.row.buyer.realName}}</span>
        </template>
        </el-table-column>
          <el-table-column prop="totalPrice/100" label="总价格" width="180px"></el-table-column>
          
          <el-table-column label="操作">
            <template slot-scope="scope">
              <el-button
                size="mini"
                @click="handleInfo(scope.$index,scope.row)">查看详情</el-button>
              <!--订单详情弹出框-->
              <el-dialog title="订单详情" :visible.sync="dialogTableVisible">
                <el-row>
                  <el-col><span>收货人:{{buyer.realName}}</span><span>联系电话:{{buyer.telephone}}</span> <span>支付总价：{{orderdata.totalPrice/100.0+'元'}}</span></el-col>
                </el-row>
                <el-row>
                  <el-col><span>配送地址：{{buyer.address}}</span></el-col>
                </el-row>
                <el-table :data="goodsList">
                  <el-table-column prop="title" label="商品名" width="150"></el-table-column>
                  <el-table-column prop="purchaseQuantity" label="购买数量" width="100"></el-table-column>
                  <el-table-column prop="unitPrice" label="单价" formatter=></el-table-column>
                  <el-table-column label="总价">
                    <template slot-scope="scope">{{scope.row.unitPrice*scope.row.purchaseQuantity}}</template>
                  </el-table-column>
                </el-table>
              </el-dialog>
              
              <!--发货信息填写框-->
              <el-dialog title="发货" :visible.sync="dialogFormVisible">
                <el-form :model="deliverdata">
                  <el-form-item label="物流单号" :label-width="150">
                    <el-input v-model="deliverdata.delivernum" ></el-input>
                  </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                  <el-button @click="dialogFormVisible = false">取 消</el-button>
                  <el-button type="primary" @click="deliver">确 定</el-button>
                </div>
              </el-dialog>
            </template>
          </el-table-column>
        </el-table>
        <div class="block" align="center">
          <el-pagination
            layout="prev, pager, next"
            page-size="10"
            @current-change="handleCurrentChange"
            :current-page.sync="currentPage"
            :total="total">
          </el-pagination>
        </div>
      </div>
    </el-main>
  </el-container>
  <el-footer></el-footer>
</el-container>

</body>
<script type="text/x-template" id='header1'>
  <div class="header">灵微网
    <el-button size="mini" @click="exit" class='dd'>退出账号</el-button>
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
      exit(){
      this.$confirm('此操作将退出登录, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
          center: true
        }).then(() => {
        $.ajax({
          url : '/user/seller/exit.do',
          type : 'post',
          data:{
          },
          success : function(data) {
            if(data.code == 100){
              alert('退出成功');
              window.location.href='./login.jsp';
            }else {
              alert("退出失败");
              return;
            }
          },
          error : function(data) {
            alert(data);
            return;
          },
          dataType : 'json',
        });          
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消退出'
          });
        });
        
      }

    }
  });
  new Vue({
    el:'#app',
    data(){
      return{
        dialogTableVisible: false,
        dialogFormVisible: false,
        currentPage:1,
        total:0,
        index:0,
        info:[//已付款订单信息

        ],
        orderdata:
          {
           
          },
          buyer:{},
        //订单详细信息
        goodsList:[//订单商品信息
        ],
        deliverdata:{//发货信息
          delivernum:''
        }
      }
    },
    methods:{
      handleDeliver(index,row){

        this.index=index;
        this.dialogFormVisible=true;
      },
      deliver(){
        var that=this;
        $.ajax({
          url : '/microsoul/order/sellersetlogisticid.do',
          type : 'post',
          data:{
            orderId:that.info[that.index].orderId,
            logisticId:that.deliverdata.delivernum,
          },
          success : function(data) {
            var result=data.code;
            if(result == 99999){
              alert('成功');
            }else {
              alert("失败");
            }
          },
          error : function(data) {
            alert(data);
          },
          dataType : 'json',
        })
        this.dialogFormVisible = false;
      },
      handleInfo(index,row){      
         this.orderdata=this.info[index];
        this.buyer=this.info[index].buyer
        this.goodsList=this.info[index].goods;        
        this.dialogTableVisible=true;
      },

      handleCurrentChange(currentPage){//页码切换
        var that=this;
        $.ajax({
          url : '/microsoul/order/getOrderList.do',
          type : 'post',
          data:{
            state:0,
            page:currentPage,
            rows:10
          },
          success : function(data) {
            that.total=data.extend.orderList.total;
            var list=data.extend.orderList.list;
            that.info = list;
            var result=data.code;
            if(result == 100){

            }else {
              alert("商品加载失败");
            }
          },
          error : function(data) {
            alert(data);
          },
          dataType : 'json',
        })

      },
    },
    mounted:function(){//挂载数据
      var that=this;
      $.ajax({
        url : '/microsoul/order/getOrderList.do',
        type : 'post',
        data:{
          page:1,
          state:0,
          rows:10
        },
        success : function(data) {
          that.total=data.extend.orderList.total;
          var list=data.extend.orderList.list;
          that.info = list;
          var result=data.code;
          if(result == 100){

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
  });
</script>
</html>
