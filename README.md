# microsoul
灵微网

商品首页显示模块：

     查看首页内容：
                    http://localhost:8080/microsoul/contentIndex/index.do
                    
     商品搜索功能：               
                    http://localhost:8080/microsoul/goods/search.do
                    必须参数：title       可选参数：page
     商品分类搜索功能：
                    http://localhost:8080/microsoul/goods/searchCategory.do
                    必须参数：category       可选参数：page
     商品详情页：http://localhost:8080/microsoul/goods/goodDesc.do
                    必须参数：goodsId
商品首页显示管理员后台模块：


    添加内容选项：
                   http://localhost:8080/microsoul/content/insert.do
                   必须参数：categoryId ；广告位id=89，商品展示id=90
                   可选参数：title，subTitle，titleDesc，content_price，content，
                   广告对应的商品详情链接：url
                   图片上传参数：upLoadedImgUrl
    删除内容选项：
                     http://localhost:8080/microsoul/content/delete.do
                     必须参数：contentId
    修改内容选项：
                    http://localhost:8080/microsoul/content/update.do
                       必须参数：contentId
                       可选参数：categoryId;title;subtitle;title;desc;url;pic;pic2;contentPrice;
                       content;
    查看内容选项：
                   http://localhost:8080/microsoul/content/showsList.do              
                    可选参数：page  ；  rows
                     
购物车模块：

    查看购物车：
            http://localhost:8080/microsoul/cart/cartList.do
           
    添加购物项：
               http://localhost:8080/microsoul/cart/addCartItem.do
               必须参数：goodsId；purchaseQuantity
    删除购物项：
                http://localhost:8080/microsoul/cart/delete.do
                必须参数：goodsId
    修改购物项：   
                http://localhost:8080/microsoul/cart/update.do
                必须参数：goodsId；purchaseQuantity

卖家商品模块：

	查看商品：http://localhost:8080/microsoul/goods/showGoodsList.do
            可选参数：page;             rows
	删除商品：http://localhost:8080/microsoul/goods/deleteGoodsModel.do
			必须参数：goodsId

	修改商品：http://localhost:8080/microsoul/goods/updateGoodsModel.do
			必须参数：goodsId
			可选参数：goodsName;title;sellpoint;unitPrice;purchaseQuantity;barcode;imageUrl;
			category;store;discount;status;sellerId;discountQuantity

	添加商品：http://localhost:8080/microsoul/goods/insertGoodsModel.do
			必须参数：goodsName ; unitPrice  ; category  ; store   ; status  ; sellerId;
			upLoadedImgUrl;goodDesc;discount;discountQuantity
			
    添加商品不添加图片：http://localhost:8080/microsoul/goods/insertGoodsModelnotImg.do
			必须参数：goodsName ; unitPrice  ; category  ; store   ; status  ; sellerId;
卖家模块：

	登录：http://localhost:8080/microsoul/seller/login.do
		必须参数：accountName  	;	password
	退出：http://localhost:8080/microsoul/seller/exit.do
	
	注册：http://localhost:8080/microsoul/seller/register.do
			必须参数：accountName	；password
	更新卖家信息：http://localhost:8080/microsoul/seller/sellerInfo.do
			
			可选参数：zhifubaoAccount；email;qqAccount;district;realName;address;
			telephone;
			merid;merkey(merid,merkey必须有才能发布商品)
			
	修改旧密码：http://localhost:8080/microsoul/seller/sellerChangePassword.do
			必须参数：accountName  ； password ；newPassword
			
	查看卖家信息：http://localhost:8080/microsoul/seller/showSeller.do
            需先登录才能查看
买家模块
      
      登录：http://localhost:8080/microsoul/buyer/login.do
          必须参数：accountName  	;	password
     
     注册：http://localhost:8080/microsoul/buyer/register.do
     必须参数：accountName  	;	password ;email ;telephone
     
     修改密码：http://localhost:8080/microsoul/buyer/modifypsw.do
     必须参数：oldpsw  ;newpsw
     
     增加/更新个人信息：http://localhost:8080/microsoul/buyer/updateinfo.do
     可选参数：zhifubaoAccount; email;qqAccount;realName;address;telephone;
     
     查看个人信息：http://localhost:8080/microsoul/buyer/getbuyerinfo.do
     无参数
     
     加入收藏夹：http://localhost:8080/microsoul/buyer/addcollection.do
     必须参数：goodsID
     
     移出收藏夹：http://localhost:8080/microsoul/buyer/deletecollection.do
     必须参数：collectionID
     
     展示收藏夹：http://localhost:8080/microsoul/buyer/showcollectionlist.do
     必须参数:buyerId
     
后台管理模块

      管理员登录：  http://localhost:8080/microsoul/admin/adminlogin.do
      必须参数：accountName  	;	password
      
      冻结买家: http://localhost:8080/microsoul/admin/disablebuyer.do
      必须参数:buyersId
      
      查看所有买家信息： http://localhost:8080/microsoul/admin/selectbuyerinfo.do
      无参数
      
      删除买家：http://localhost:8080/microsoul/admin/deletebuyer.do
      必须参数：buyerId
      
