    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>灵微网广告管理</title>
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <!--vue核心库-->
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.0.11/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui@2.0.11/lib/index.js"></script>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
        </script>

</head>

<body>
    <div id="app">
        <el-container>

            <el-container>
                <el-aside width="300px">
                    <myaside></myaside>
                </el-aside>
                <el-main>
                    <goods_issue></goods_issue>
                </el-main>
            </el-container>
            <el-footer>
                <myfooter></myfooter>
            </el-footer>
        </el-container>
    </div>
</body>

<script type="text/x-template" id='aside'>
    <el-row>
        <el-col :span="24">
            <el-menu default-active="1" class="el-menu-vertical-demo" :unique-opened="true" @open="handleOpen" @close="handleClose" :router='true'>
                <el-submenu index="1">
                    <template slot="title">
            <i class="el-icon-location"></i>
            <span>用户管理</span>
          </template>
                    <el-menu-item index="2-1"><a href="/admin_buyers.jsp">买家管理</a></el-menu-item>
                    <el-menu-item index="2-2"><a href="/admin_seller.jsp">卖家管理</a></el-menu-item>
                    </el-menu-item>
                </el-submenu>
                <el-submenu index="2">
                    <template slot="title">
            <i class="el-icon-menu"></i>
            <span>广告管理</span>
          </template>
                    <el-menu-item index="2-1"><a href="/admin_advertise.jsp">广告管理</a></el-menu-item>
                </el-submenu>


            </el-menu>
        </el-col>
    </el-row>
</script>


<script type="text/x-template" id="goods_issue">
  <div>
    <h1>广告管理</h1>
    <el-button @click='dialogVisible=true'>添加广告</el-button>
    <el-table :data="goods_info" :stripe="true" style="width: 100%">
      <el-table-column prop="subtitle" label="底部标题" width="150px"></el-table-column>
      <el-table-column prop="title" label="标题" width="150px"></el-table-column>
      <el-table-column prop="contentId" label="ID" width="150px"></el-table-column>
      <el-table-column prop="contentPrice" label="单价" width="150px"></el-table-column>
       <el-table-column prop="url" label="链接" width="150px"></el-table-column>
       <el-table-column prop="pic" label="图片" width="150px"></el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
            size="mini"
            @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-dialog title="编辑" width="60%"
                     :visible.sync="dialogVisible">
            <el-row>
              <!--action为上传地址-->
               <el-col :span="8" >
               <el-col :span="8">

                			 <input type="file" id = "imgUrl" />
                			 <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>

                           </el-col>
                 </el-col>
              <el-col :span="10" :offset='6'>
                <el-form :model="info" label-width="100px">

                  <el-form-item label="底部标题">
                    <el-input v-model="info.subtitle"></el-input>
                  </el-form-item>

                  <el-form-item label="标题">
                     <el-input v-model="info.title"></el-input>
                  </el-form-item>
                  <el-form-item label="商品单价">
                    <el-input v-model="info.contentPrice"></el-input>
                  </el-form-item>
                  <el-form-item label="类别">
                   <el-input v-model="info.categoryId"></el-input>
                  </el-form-item>
                  <el-form-item label="链接">
                   <el-input v-model="info.url"></el-input>
                  </el-form-item>
                </el-form>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="16" :offset="2">
                <el-input label="url" v-model="info.describe" placeholder="填写商品url"></el-input>
              </el-col>
            </el-row>
            <el-row>
              <el-col :span="8" :offset="6">
                <el-button  @click='goodsEdit' type="primary">确定</el-button>
              </el-col>
              <el-col :span="8">
                <el-button  @click='goods_issue' type="primary">发布</el-button>
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

  </div>

</script>
<script>
    Vue.component('myaside', {
        template: '#aside',
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

    Vue.component('goods_issue',{
          template:'#goods_issue',
          data(){
            return{
              dialogVisible:false,


              index:0,
              goods_info:[//需要传入的数据

              ],

              info:{
                contentId:'',
                categoryId:'',
                title:'',
                subtitle:'',
                url:'',
                pic:'',
                contentPrice:'',
                content:'',
              }
            }
          },
          methods:{
            handleEdit(index,row){
              this.info=JSON.parse(JSON.stringify(this.goods_info[index]));
              this.dialogVisible=true;
              this.index=index;
            },
            goods_issue(){
            var info=this.info;
            var index=this.goods_info.length;
            var file = document.getElementById("imgUrl").files[0];
            var that=this;
             var formData = new FormData();
                           formData.append('upLoadedImgUrl', file);

                           formData.append('categoryId', info.categoryId);
                           formData.append('title', info.title);
                           formData.append('subtitle', info.subtitle);
                           formData.append('contentPrice', info.contentPrice);
                           formData.append('content', info.content);
                           formData.append('url', info.url);
            $.ajax({
               url :'/microsoul/content/insert.do',
               type :'post',


                   data:formData,

                            contentType: false,
                             processData: false,
                             mimeType: "multipart/form-data",
                            success : function(data) {
                              var result=data.code;
                              if(result == 100){
                                alert('广告发布成功');

                               that.goods_info.splice(index,1,info);
                              }else {
                                alert("广告发布失败");
                              }
                            },
                            error : function(data) {
                              alert(data);
                            },
                            dataType : 'json',
                          })
                          this.dialogVisible=false;

            },
            goodsEdit(){

              var info=this.info;
              var index=this.index;
              var that=this;
              $.ajax({
                url :'/microsoul/content/update.do',
                type :'post',
                data:{
                contentId:info.contentId,
                title:info.title,
                subtitle:info.subtitle,
                pic:info.pic,
                contentPrice:info.contentPrice,
                content:info.content,
                url:info.url,
                },
                success : function(data) {
                  var result=data.code;
                  if(result == 100){
                    alert('商品修改成功');

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

          handleDelete(index,row,rows){
        	  var that=this;
        	  var goodsId=row.contentId;
            this.$confirm('此操作将会删除商品，是否继续？','警告',{
              confirmButtonText:'确定',
              cancelButtonText:'取消',
              type:'warning'
            }).then(()=>{
            	$.ajax({
            	      url : '/microsoul/content/delete.do',
            	      type : 'post',
            	      data:{
            	    	  contentId:goodsId
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
          url : 'http://localhost:8080/microsoul/content/showsList.do',
          type : 'post',
          data:{
            rows:20,
         },
        success : function(data) {

          var list=data.extend.contentsList.list;


          that.goods_info = list;
          var result=data.code;
          if(result == 100){

          }else {
            alert("广告加载失败");
          }
        },
        error : function(data) {
          alert(data);
        },
        dataType : 'json',
      })
      }
      });
    new Vue({
        el: '#app'

    });
</script>

</html>