<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<meta http-equiv="Access-Control-Allow-Origin" content="*" />
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
  <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">

  </script>

</head>
<body>
<div id="app">
  <el-container>
    <el-header><myheader></myheader></el-header>
    <el-container>
      <el-aside width="200px"><myaside></myaside></el-aside>
      <el-main><goods_manage></goods_manage></el-main>
    </el-container>
    <el-footer></el-footer>
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
    <el-button size="mini" @click="exit" class='dd'>退出账号</el-button>
  </div>
</script>
<script type="text/x-template" id="goods_manage">
  <div>
    <h1>商品管理</h1>
    <el-table :data="goods_info" :stripe="true" style="width: 100%">
      <el-table-column prop="goodsName" label="商品名称" width="150px"></el-table-column>
      <el-table-column prop="unitPrice" label="单价" width="150px"></el-table-column>
      <el-table-column prop="store" label="库存" width="150px"></el-table-column>
      <el-table-column prop="status" label="上架状态" width="150px"></el-table-column>
      <el-table-column label="总价" width="150px">
        <template slot-scope="scope">
          <p>{{scope.row.unitPrice*scope.row.store}}</p>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
            size="mini"
            @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-dialog title="编辑" width="60%"
                     :visible.sync="dialogVisible">
            <el-row>
              <!--action为上传地址-->
              <el-col :span="10">
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
              <el-col :span="8" :offset='4'>
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
              <el-col :span="20" :offset="2">
                <el-input lable="商品描述" v-model="info.describe" placeholder="填写商品描述"></el-input>
              </el-col>
            </el-row>
            <el-row>
              <el-col :offset="18">
                <el-button  @click='goodsEdit' type="primary">确定</el-button>
              </el-col>
            </el-row>
          </el-dialog>
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row,goods_info)">删除</el-button>
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
      },}

  });
  Vue.component('goods_manage',{
      template:'#goods_manage',
      data(){
        return{
          dialogVisible:false,
          currentPage:1,
          total:0,
          index:0,
          goods_info:[//需要传入的数据

          ],
          options:[//商品类别
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
        handleEdit(index,row){
          this.info=JSON.parse(JSON.stringify(this.goods_info[index]));
          if(this.info.status=='是')
            this.info.status=true;
          else this.info.status=false;
          this.dialogVisible=true;
          this.index=index;
        },
        goodsEdit(){
          if(this.info.status==true)
            this.info.status='1';
          else this.info.status='2';
          var info=this.info;  
          var index=this.index;
          var that=this;
          $.ajax({
            url :'http://localhost:8080/microsoul/goods/updateGoodsModel.do',
            type :'post',            
            data:{goodsId:info.goodsId,
            goodsName:info.goodsName,
            unitPrice:info.unitPrice,
            category:info.category,
            store:info.store,
            purchaseQuantity:info.purchaseQuantity,
            status:info.status,
            detail:info.detail           
            },
            success : function(data) {
              var result=data.code;
              if(result == 100){
                alert('商品修改成功');
               if(info.status==1)
            	   info.status='是';
               else info.status='否';
               that.goods_info.splice(index,1,info);
              }else {
                alert("商品修改失败");
              }
            },
            error : function(data) {
              alert(data);
            },
            dataType : 'json',
          }) 
          this.dialogVisible=false;
        },
        handleCurrentChange(currentPage){//页码切换
        	var that=this;       
          $.ajax({
            url : 'http://localhost:8080/microsoul/goods/showGoodsList.do',
            type : 'post',
            data:{
              sellerId:1,
              page:currentPage,
              rows:10
            },
            success : function(data) {
              that.total=data.extend.goodsModelList.total;
              var list=data.extend.goodsModelList.list;
              for (var i=0;i<list.length;i++)
              {
                if(list[i].status==1)
                  list[i].status='是';
                else list[i].status='否';
              }
             that.goods_info = list;
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
      handleDelete(index,row,rows){
    	  var that=this;
    	  var goodsId=row.goodsId;    	
        this.$confirm('此操作将会删除商品，是否继续？','警告',{
          confirmButtonText:'确定',
          cancelButtonText:'取消',
          type:'warning'
        }).then(()=>{
        	$.ajax({
        	      url : 'http://localhost:8080/microsoul/goods/deleteGoodsModel.do',
        	      type : 'post',
        	      data:{
        	    	  goodsId:goodsId
        	      },
        	    success : function(data) {
        	      if(data.code==100)  {
        	    	  alert('删除成功！');
        	    	  rows.splice(index,1);      	    	
        	      }     	
        	      else alert('删除失败！');
        	    },
        	    error : function(data) {
        	      alert(data);
        	    },
        	    dataType : 'json',
        	  })
        	 
        })
      }
    },
    mounted:function(){
 var that=this;
    $.ajax({
      url : 'http://localhost:8080/microsoul/goods/showGoodsList.do',
      type : 'post',
      data:{
        sellerId:1,
        rows:10,
     },
    success : function(data) {
      that.total=data.extend.goodsModelList.total;
      var list=data.extend.goodsModelList.list;
      for (var i=0;i<list.length;i++)
      {
        if(list[i].status==1)
          list[i].status='是';
        else list[i].status='否';
      }
      that.goods_info = list;
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
          url : 'http://localhost:8080/microsoul/goods/showGoodsList.do',
          type : 'post',
          data:{
          },
          success : function(data) {
            if(data.code == 100){
              alert('退出成功');
              window.location.href='http://localhost:8080/login.jsp';
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
    created:function(){//挂载数据
      // axios.get()
    }
  });
</script>
</html>

