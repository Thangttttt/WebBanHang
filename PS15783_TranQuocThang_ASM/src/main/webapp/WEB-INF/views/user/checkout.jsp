<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	<jsp:include page="menu.jsp" />
	<!-- Bottom Bar End -->

	<!-- Breadcrumb Start -->
	<div class="breadcrumb-wrap">
		<div class="container-fluid">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Products</a></li>
				<li class="breadcrumb-item active">Checkout</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Checkout Start -->
	<div class="checkout">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<div class="checkout-inner">
						 <div class="billing-address">
							<h2>Vui Lòng Điền Thông Tin Để Đặt Hàng</h2>
							<h4>${message}</h4>
							 <form:form action="/estore/orderp" modelAttribute="oder">
								<div class="row">
									<div class="col-md-12">
										<form:input path="sdt"  class="form-control" type="text"
											placeholder="Số Điện Thoại"/>
									</div>
									<div class="col-md-12">
										<!-- <input class="form-control" type="text" placeholder="Address"> -->
										<form:textarea path="address"   class="form-control" rows="5" placeholder="Address"/>
									</div>
								</div>
								<div class="checkout-payment">
									<div class="checkout-btn">
										<button type="submit">Đặt Hàng</button>
									</div>
								</div>
							</form:form> 
						</div>  

					</div>
				</div>
				<div class="col-lg-4">
					<div class="checkout-inner">
						<div class="checkout-summary">
							<div class="cart-content">
								<h1>Tóm Tắt Giỏ Hàng</h1>
								<p>
									Tổng Tiền Hàng<span>$ ${Tongtien}</span>
								</p>
								<%-- <c:forEach var="item" items="${thangdeptrai}">
								<p>
									${item.name}
									
								</p>
								<p>
									
									<span>${item.qty}</span>  
									
								</p>
								<p>
									 
									<span>${item.price}</span>
								</p>
								</c:forEach> --%>
								
								<h2>
									Tổng Tiền<span>$ ${Tongtien}</span>
								</h2>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Checkout End -->

	<!-- Footer Start -->
	<jsp:include page="footer.jsp" />
	<!-- Footer End -->

	 
	<!-- Footer Bottom End -->

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
