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
<link href="../us/css/style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="header">
		<div class="container-fluid">
			<div class="row">
				
				<div class="col-md-12">
					<div class="header-slider normal-slider">
						<div class="header-slider-item">
							<img style="width: 100%; height: 358px;" src="/us/img/bn6.png"
								alt="Slider Image" />
						</div>
						<div class="header-slider-item">
							<img style="width: 100%; height: 358px;" src="/us/img/bn7.png"
								alt="Slider Image" />
						</div>
						<div class="header-slider-item">
							<img style="width: 100%; height: 358px;" src="/us/img/bn8.png"
								alt="Slider Image" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Main Slider End -->

	<!-- Brand Start -->
	<div class="brand">
		<div class="container-fluid">
			<div class="brand-slider">
				<div class="brand-item">
					<img src="/us/img/brand-1.png" alt="">
				</div>
				<div class="brand-item">
					<img src="/us/img/brand-2.png" alt="">
				</div>
				<div class="brand-item">
					<img src="/us/img/brand-3.png" alt="">
				</div>
				<div class="brand-item">
					<img src="/us/img/brand-4.png" alt="">
				</div>
				<div class="brand-item">
					<img src="/us/img/brand-5.png" alt="">
				</div>
				<div class="brand-item">
					<img src="/us/img/brand-6.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- Brand End -->

	<!-- Feature Start-->
	<div class="feature">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fab fa-cc-mastercard"></i>
						<h2>Thanh Toán An Toàn</h2>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fa fa-truck"></i>
						<h2>Giao Hàng Nhanh</h2>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fa fa-sync-alt"></i>
						<h2>30 Ngày Đổi Trả</h2>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 feature-col">
					<div class="feature-content">
						<i class="fa fa-comments"></i>
						<h2>Hỗ Trợ 24/7</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Feature End-->


	

	<!-- Recent Product Start -->
	<div class="recent-product product">
		<div class="container-fluid">
			<div class="section-header">
				<h1>DANHH MỤC NỔI BẬT</h1>
			</div>
			 <div class="row align-items-center product-slider product-slider-4">
				<c:forEach var="item" items="${items}">
					<div class="col-lg-3">
						<div class="product-item">
							<div class="product-title">
								<a href="#">${item.name}</a>
							</div>
							<div class="product-image">
								<a href="product-detail.html"> <img
									src="/us/img/${item.image}" alt="Product Image">
								</a>
								<div class="product-action">
									 
									<a href="/estore/product/${item.id}">XEM</a> 
									
								</div>
							</div>
							<%-- <div class="product-price">
								<h3>
									<span>$</span>${item.price}
								</h3>
								<a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy
									Now</a>
							</div> --%>
						</div>
					</div>
				</c:forEach>
			</div> 
		</div>
	</div>
	
	<!-- Newsletter Start -->
	<div class="newsletter">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<h1>Đăng Ký Bản Tin Của Chúng Tôi</h1>
				</div>
				<div class="col-md-6">
					<div class="form">
						<input type="email" value="Your email here">
						<button>Submit</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Newsletter End -->
	<!-- Recent Product End -->
	<div class="recent-product product">
		<div class="container-fluid">
			<div class="section-header">
				<h1>DÀNHH CHO BẠN</h1>
			</div>
		</div>
	</div>

	<div class="product-view">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            
                            <c:forEach var="list" items="${listsp.content}">
                            <div class="col-md-3">
                                <div class="product-item">
                                    <div class="product-title">
                                        <a href="#">${list.name}</a>
                                    </div>
                                    <div class="product-image">
                                        <a href="product-detail.html">
                                            <img src="/us/img/${list.image}" alt="Product Image">
                                        </a>
                                        <div class="product-action">
                                            <a href="/cart/add/${list.id}"><i class="fa fa-cart-plus"></i></a>
                                            <!-- <a href="#"><i class="fa fa-heart"></i></a> -->
                                            <a href="/detail/add/${list.id}"><i class="fa fa-search"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-price">
                                        <h3><span>$</span>${list.price}</h3>
                                        <a class="btn" href=""><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                        
                        <!-- Pagination Start -->
                        <div class="col-md-12">
                            <nav aria-label="Page navigation example">
                                 <ul class="pagination justify-content-center">
                                     <li class="page-item">
                                        <a class="page-link" href="/estore/index?p=0">First</a>
                                    </li>
                                     <li class="page-item">
                                        <a class="page-link" href="/estore/index?p=${listsp.number-1}"><<</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="/estore/index?p=${listsp.number+1}">>></a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="/estore/index?p=${listsp.totalPages-1}">Last</a>
                                    </li>
                                </ul> 
                            </nav>
                        </div>
                        <!-- Pagination Start -->
                    </div>           
                    
                    <!-- Side Bar Start -->
                    
                    <!-- Side Bar End -->
                </div>
            </div>
        </div>

	
	<jsp:include page="footer.jsp"/>
	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="/us/lib/easing/easing.min.js"></script>
	<script src="/us/lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="/us/js/main.js"></script>
</body>
</html>
