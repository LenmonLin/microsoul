<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <!-- 先引入 Vue -->
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">

    <title>购物车</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
<div class="top" id="cart" style="margin: auto;width: 1226px;">
    <el-row id="top-cart" style="width:100%;height:90px">
        <el-col :span="4">
            <a href="http://localhost:8080/mainPage.jsp" class="logo"><img style="margin-top: 30px"
                                                                           src="./static/logo1.png" width="135"
                                                                           height="45"></a>
        </el-col>
        <el-col :span="6" offset="1">
            <div class="title" style="margin-top: 55px;font-size: x-large">我的购物车</div>
        </el-col>
        <el-col :span="6" offset="7">
            <el-menu :default-active="'1'" class="el-menu-demo" mode="horizontal" size="mini"
                     active-text-color="#000000">
                <el-submenu index="1" active-text-color="#000000">
                    <template slot="title">用户名</template>
                    <el-menu-item index="1-1"><a href="http://localhost:8080/user_order.jsp"
                                                 style="text-decoration: none">用户中心</a></el-menu-item>
                    <el-menu-item index="1-2"><a @click="loginOut()"
                                                 style="text-decoration: none"><span id="loginOut">退出登录</span></a>
                    </el-menu-item>
                </el-submenu>
                <el-menu-item index="2"><a href="http://localhost:8080/user_order.jsp"
                                           style="text-decoration: none">订单管理</a></el-menu-item>
                <el-menu-item index="3"><a href="http://localhost:8080/cart.jsp"
                                           style="text-decoration: none">购物车</a></el-menu-item>
            </el-menu>
        </el-col>
    </el-row>
    <el-table
            ref="checkList"
            tooltip-effect="dark"
            style="width: 100%;margin-top:50px"
            :data="cartList"
            @selection-change="handleSelectionChange">
        <el-table-column
                type="selection"
                width="56">
        </el-table-column>
        <el-table-column
                label=""
                width="80"
                align="center">
            <template slot-scope="scope">
                <div class="img" style="width: 100%;height: 85px">
                    <a @click="toDetail(scope.row.goodsId)" class="logo"><img :src="scope.row.imageUrl" width="80"
                                                                              height="80"></a>
                </div>
            </template>
        </el-table-column>
        <el-table-column
                prop="goodsName"
                label="商品描述"
                width="354"
                align="center">
        </el-table-column>
        <el-table-column
                label="单价"
                width="184"
                align="center"
        >
            <template slot-scope="scope">
                <div v-if="scope.row.purchaseQuantity<scope.row.discountQuantity">{{scope.row.unitPrice|filterMoney}}
                </div>
                <div v-else style="color: coral"><span>优惠价&emsp;</span>{{scope.row.unitPrice*scope.row.discount/100|filterMoney}}</div>
            </template>
        </el-table-column>
        <el-table-column
                label="数量"
                width="184"
                align="center">
            <template slot-scope="scope">
                <div class="div_number">
                    <el-input-number size="small" v-model="scope.row.purchaseQuantity"
                                     @change="handleNumberChange(scope.row.goodsId,scope.row.purchaseQuantity)"
                                     :min="1"></el-input-number>
                </div>
            </template>
        </el-table-column>
        <el-table-column
                label="小计"
                width="184"
                align="center">
            <template slot-scope="scope">
                <p v-if="scope.row.purchaseQuantity<scope.row.discountQuantity">
                    ￥{{scope.row.purchaseQuantity*scope.row.unitPrice/100}}</p>
                <p v-else>￥{{scope.row.purchaseQuantity*scope.row.unitPrice*scope.row.discount/10000}}</p>
            </template>
        </el-table-column>
        <el-table-column
                label="操作"
                width="184"
                align="center">
            <template slot-scope="scope">
                <el-button type="danger" @click="handleRemove(scope.row.goodsId, scope.$index)">
                    删除<i class="el-icon-delete2 el-icon--right"></i>
                </el-button>
            </template>
        </el-table-column>
    </el-table>
    <el-row style="margin-top:35px">
        <el-col :span="6" offset="1">
            <span style="font-size: small">共 {{cartList.length}} 样商品，已选择 {{selectedNum}} 件商品</span>
        </el-col>
        <el-col :span="4" offset="8">
            <span style="font-size: large">合计：{{totalPrice | filterMoney}}</span>
        </el-col>
        <el-col :span="4" offset="1">
            <el-button type="warning" @click="submitOrder">提交订单</el-button>
        </el-col>
    </el-row>
</div>
<el-row id="site-footer">
    <div class="footer" style="height: 100px"></div>
</el-row>
</body>


<!--组件实例化############################################################-->
<script>
    function Order(sellerId, goodsIdList, numberList, totalPrice) {
        this.sellerId = sellerId;
        this.goodsIdList = goodsIdList;
        this.numberList = numberList;
        this.totalPrice = totalPrice;
    }

    new Vue({
        el: '#cart',
        data() {
            return {
                cartList: [],
                checkList: [],
            }
        },
        Mounted() {
            let that = this;
            $.ajax({
                type: 'Post',
                url: '/microsoul/cart/cartList.do',
                data: {},
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    let result = data.code;
                    if(result == 66666){
                        window.location.href = '/login.jsp'
                    }
                    else if(result == 99999) {
                        that.cartList = data.extend.goodsModelList;
                        console.log(that.cartList);
                    }
                }
            })
        },
        methods: {
            loginOut() {
                $.ajax({
                    url: '/user/buyer/exit.do',
                    type: "Post",
                    data: {},
                    success(data) {
                        let result = data.code;
                        if (result == 99999) {
                            window.location.href = 'http://localhost:8080/mainPage.jsp'
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
            },
            toDetail(goodsId) {
                window.location.href = 'http://localhost:8080/goods_info.jsp?goodsId=' + goodsId;
            },
            handleNumberChange(id, num) {        /*to server*/
                $.ajax({
                    url: '/microsoul/cart/update.do',
                    type: 'post',
                    data: {
                        goodsId: id,
                        purchaseQuantity: num
                    },
                    success: (data) => {
                    },
                    error: (data) => {
                        alert("操作失败");
                    },
                    dataType: 'json',
                })
            },
            handleSelectionChange(val) {
                this.checkList = val;
            },
            handleRemove(id, index) {
                if (confirm("确定移除该商品？")) {
                    let that = this;
                    $.ajax({
                        url: '/microsoul/cart/delete.do',
                        type: 'post',
                        data: {
                            goodsId: id,
                        },
                        success: function (data) {
                            let result = data.code;
                            if (result == 99999 || result == true) {
                                that.cartList.splice(index, 1)
                            } else {
                                alert("删除失败！");
                            }
                        },
                        error: function (data) {
                            alert(data);
                        },
                        dataType: 'json',
                    })
                }
            },
            submitOrder() {
                let that = this;
                that.selectList = that.checkList;
                let len = that.selectList.length;
                let index = [];
                let i = len;
                while (i) {
                    index.push('0');
                    i--;
                }
                while (1) {
                    let j = 0;
                    for (; index[j] == '1'; j++) ;
                    if (j == len)
                        break;
                    let id = that.checkList[j].sellerId;
                    let sellerOrder = new Order(id, [], [], 0);
                    for (; j < len; j++) {
                        if (index[j] == '0' && that.checkList[j].sellerId == id) {
                            sellerOrder.goodsIdList.push(that.checkList[j].goodsId);
                            sellerOrder.numberList.push(that.checkList[j].purchaseQuantity);
                            if (that.checkList[j].purchaseQuantity < that.checkList[j].discountQuantity)
                                sellerOrder.totalPrice += (that.checkList[j].purchaseQuantity * that.checkList[j].unitPrice);
                            else
                                sellerOrder.totalPrice +=
                                    (that.checkList[j].purchaseQuantity * that.checkList[j].unitPrice * that.checkList[j].discount / 100);
                            index[j] = '1';
                        }
                    }
                    console.log(sellerOrder);
                    $.ajax({
                        url: '/microsoul/order/create.do',
                        type: 'post',
                        async: false,
                        traditional: true,
                        data: {
                            sellerId: sellerOrder.sellerId,
                            goodsId: sellerOrder.goodsIdList,
                            nums: sellerOrder.numberList,
                            totalPrice: sellerOrder.totalPrice
                        },
                        success: function (data) {
                            let result = data.code;
                            console.log(result);
                        },
                        error: function (data) {
                            alert(data.code);
                        },
                        dataType: 'json',
                    });
                }
//                window.location.href = 'http://localhost:8080/user_order.jsp';
            },
        },
        computed: {
            selectedNum: function () {
                let num = 0;
                this.checkList.forEach((item) => {
                    num += item.purchaseQuantity
                });
                return num;
            },
            totalPrice: function () {
                let num = 0;
                this.checkList.forEach((item) => {
                    if (item.purchaseQuantity < item.discountQuantity)
                        num += (item.purchaseQuantity * item.unitPrice);
                    else
                        num += (item.purchaseQuantity * item.unitPrice * item.discount / 100);
                });
                return parseFloat(num).toFixed(2);
            },
            discountPrice: function () {
                let num = 0;
                this.checkList.forEach((item) => {
                    num += item.purchaseQuantity * item.unitPrice
                });
                return num;
            }
        },
        filters: {
            filterMoney: function (value) {
                let num = parseFloat(value).toFixed(2);
                return '￥' + num / 100;
            }
        }
    })
</script>
</html>
