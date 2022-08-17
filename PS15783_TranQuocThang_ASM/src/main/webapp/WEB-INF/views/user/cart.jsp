<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>PS15783 - Tran Quoc Thang</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="eCommerce HTML Template Free Download" name="keywords">
<meta content="eCommerce HTML Template Free Download" name="description">

<!-- Favicon -->
<!-- <link href="/us/img/favicon.ico" rel="icon"> -->

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link href="/us/lib/slick/slick.css" rel="stylesheet">
<link href="/us/lib/slick/slick-theme.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/us/css/style.css" rel="stylesheet">
</head>

    <body>
        <jsp:include page="menu.jsp"/>
        <!-- Bottom Bar End -->
        
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                    <li class="breadcrumb-item active">Cart</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        <!-- Cart Start -->
        <div class="cart-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="cart-page-inner">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                        	<th>Ảnh</th>
                                            <th>Sản Phẩm</th>
                                            <th>Giá</th>
                                            <th>Số Lượng</th>
                                            <th>Tổng Tiền</th>
                                            <th>Xóa</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
                                    <c:forEach var="item" items="${cart.items}">
                                        <form action="/cart/update" method="post">
                                        <input type="hidden" name="id" value="${item.id}">
                                        <tr>
                                            <td>
                                                <div class="img">
                                                    <a href="#"><img src="/us/img/${item.anh}" alt="Image"></a>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="img">
                                                    <p>${item.name}</p>
                                                </div>
                                            </td>
                                            <td>$ ${item.price}</td>
                                            <td>
                                                <div class="qty">
                                                    <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="btn-minus"><i class="fa fa-minus"></i></button>
                                                    <input type="number" name="qty" value="${item.qty}" onblur="this.form.submit()" >
                                                    <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="btn-plus"><i class="fa fa-plus"></i></button>
                                                </div>
                                            </td>
                                            
                                            <td>$ ${item.price * item.qty}</td>
                                            <td><a href="/cart/remove/${item.id}"><i class="fa fa-trash"></i></a></td>
                                        </tr>                                       
                                        </form>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="user" style="margin-top: 20px;">
									<a href="/cart/clear" class="btn wishlist"><span>Clear Cart</span></a> 
									<a href="/estore/index" class="btn cart"><span>Add more</span></a>
								</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart-page-inner">
                            <div class="row">
                            <form action="/estore/order">
                                <div class="col-md-12">
                                    <div class="coupon">
                                        <input type="text" placeholder="Mã Giảm Giá">
                                        <button>Sử Dụng</button>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="cart-summary">
                                        <div class="cart-content">
                                            <h1>Tóm Tắt Giỏ Hàng</h1>
                                            <p>Tổng Tiền Hàng<span>$ ${Tongtien}</span></p>
                                            <p>Phí Vận Chuyển<span>Free</span></p>
                                            <h2>Tổng Tiền<span>$ ${Tongtien}</span></h2>
                                        </div>
                                        <div class="cart-btn">
                                            <!-- <button>Update Cart</button> -->
                                            <button type="submit">Đặt Hàng</button>
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->
        
        <jsp:include page="footer.jsp"/>      
        
        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="/us/lib/easing/easing.min.js"></script>
        <script src="/us/lib/slick/slick.min.js"></script>
        
        <!-- Template Javascript -->
        <script src="/us/js/main.js"></script>
    </body>
</html>
