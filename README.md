# microsoul
灵微网

商品首页显示模块：

    查看首页内容：
                    http://localhost:8080/microsoul/contentIndex/index.do


商品首页显示管理员后台模块：



    添加内容选项：
                   http://localhost:8080/microsoul/content/insert.do
                   必须参数：categoryId ；广告位id=89，商品展示id=90
    删除内容选项：
                     http://localhost:8080/microsoul/content/delete.do
                     必须参数：contentId
    修改内容选项：
                    http://localhost:8080/microsoul/content/update.do
                       必须参数：contentId
    查看内容选项：
                   http://localhost:8080/microsoul/content/showsList.do              
        
                     
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

	删除商品：http://localhost:8080/microsoul/goods/deleteGoodsModel.do
			必须参数：goodsId

	修改商品：http://localhost:8080/microsoul/goods/updateGoodsModel.do
			必须参数：goodsId

	添加商品：http://localhost:8080/microsoul/goods/insertGoodsModel.do
			必须参数：goodsName ; unitPrice  ; category  ; store   ; status  ; sellerId
			
卖家模块：

	登录：http://localhost:8080/microsoul/seller/login.do
		必须参数：accountName  	;	password
	退出：http://localhost:8080/microsoul/seller/exit.do
	
	注册：http://localhost:8080/microsoul/seller/register.do
			必须参数：accountName	；password
	更新卖家信息：http://localhost:8080/microsoul/seller/sellerInfo.do
			必须参数：idSeller
			
	修改旧密码：http://localhost:8080/microsoul/seller/sellerChangePassword.do
			必须参数：idSeller  ； password ；newPassword
