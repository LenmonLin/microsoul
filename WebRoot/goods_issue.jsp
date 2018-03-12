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
<script type="text/x-template" id="goods_issue">
    <div>

        <h1>商品发布</h1>

        <el-row>
          <!--action为上传地址-->
            <el-col :span="8">
                
 			 <input type="file" id = "imgUrl" />
 			 <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>

            </el-col>
            <el-col :span="10" :offset='2'>
                <el-form :model="info" :rules='rules' label-width="100px">
                    <el-form-item label="商品名称" prop='goodsName'>
                        <el-input v-model="info.goodsName"></el-input>
                    </el-form-item>
					<el-form-item label="商品title" prop='goodsName'>
                        <el-input v-model="info.title"></el-input>
                    </el-form-item>
                    <el-form-item label="商品单价" prop='unitPrice'>
                        <el-input v-model="info.unitPrice"></el-input>
                    </el-form-item>
                    <el-form-item label="商品类别" prop='category'>
                        <el-select v-model="info.category" placeholder="请选择商品类别">
                            <el-option v-for="item in options" :label="item.label" :value="item.value"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="商品库存" prop='store'>
                        <el-input-number v-model="info.store"></el-input-number>
                    </el-form-item>

                    <el-form-item label="最小批发数量">
                        <el-input-number v-model="info.purchaseQuantity"></el-input-number>
                    </el-form-item>
                    <el-form-item label="是否上架" prop='status'>
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
                <el-button type="primary" @click="issue">确定发布</el-button>
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

  Vue.component('goods_issue',{
    template:'#goods_issue',
    data(){
      return{
      fileList2:[],
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
          unitPrice:0,
          category:10,
          store:0,
          purchaseQuantity:1,
          status:false,
          detail:'',
          title:'',
        },
        rules:{
      goodsName: [
            { required: true, message: '请输入商品名称', trigger: 'blur' },
            { min: 3, max: 40, message: '长度在 3 到 40 个字符', trigger: 'blur' }
          ],
          unitPrice: [
            { type:'number',required: true, message: '请输入单价' }
          ],
         category: [
            {  required: true, message: '请选择类别', trigger: 'change' }
          ],
		store: [
            {  required: true, message: '请输入库存', trigger: 'change' }
          ],
          status:[
          {required:true}
          ]
 
      }}
    },
    methods:{
      issue:function () {
      var file = document.getElementById("imgUrl").files[0];
      
      if(this.info.status==true)
            this.info.status='1';
          else this.info.status='2';
          var info=this.info;  
          var that=this;
          var formData = new FormData();
   			formData.append('upLoadedImgUrl', file);
          	formData.append('goodsName', info.goodsName);
          	formData.append('title', info.title);
          	formData.append('unitPrice', info.unitPrice);
          	formData.append('category', info.category);
          	formData.append('purchaseQuantity', info.purchaseQuantity);
          	formData.append('status', info.status);
          	formData.append('detail', info.detail);
          	formData.append('store', info.store);
          $.ajax({
            url :'/microsoul/goods/insertGoodsModel.do',
            type :'post',            
            data:formData,
            contentType: false,
            processData: false,
            mimeType: "multipart/form-data",
            success : function(data) {
              var result=data.code;
              if(result == 100){
                alert('商品发布成功');
               if(info.status==1)
            	   info.status=true;
               else info.status=false;
              }else {
                alert("商品发布失败");
              }
            },
            error : function(data) {
              alert(data.code);
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
