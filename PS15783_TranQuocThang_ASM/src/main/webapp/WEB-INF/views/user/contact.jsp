<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
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
	<!-- Bottom Bar End -->

	<!-- Breadcrumb Start -->
	<div class="breadcrumb-wrap">
		<div class="container-fluid">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Products</a></li>
				<li class="breadcrumb-item active">Contact</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Contact Start -->
	<div class="contact">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4">
					<div class="contact-info">
						<h2>Cửa Hàng Tại TP.HCM</h2>
						<h3>
							<i class="fa fa-map-marker"></i>Tô Ký - Q.12 - TP.HCM 
						</h3>
						<h3>
							<i class="fa fa-envelope"></i>estorehcm@gmail.com
						</h3>
						<h3>
							<i class="fa fa-phone"></i>+84-328-162-039
						</h3>
						<div class="social">
							<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
								class="fab fa-facebook-f"></i></a> <a href=""><i
								class="fab fa-linkedin-in"></i></a> <a href=""><i
								class="fab fa-instagram"></i></a> <a href=""><i
								class="fab fa-youtube"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="contact-info">
						<h2>Cửa Hàng Tại Hà Nội</h2>
						<h3>
							<i class="fa fa-map-marker"></i>Hoàng Kiếm - Hà Nội
						</h3>
						<h3>
							<i class="fa fa-envelope"></i>estorehn@gmail.com
						</h3>
						<h3>
							<i class="fa fa-phone"></i>+84-376-759-654
						</h3>
						<div class="social">
							<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
								class="fab fa-facebook-f"></i></a> <a href=""><i
								class="fab fa-linkedin-in"></i></a> <a href=""><i
								class="fab fa-instagram"></i></a> <a href=""><i
								class="fab fa-youtube"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="contact-form">
						<form>
							<div class="row">
								<div class="col-md-6">
									<input type="text" class="form-control" placeholder="Tên Của Bạn" />
								</div>
								<div class="col-md-6">
									<input type="email" class="form-control"
										placeholder="Email" />
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Chủ Đề" />
							</div>
							<div class="form-group">
								<textarea class="form-control" rows="5" placeholder="Nội Dung"></textarea>
							</div>
							<div>
								<button class="btn" type="submit">Gửi</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="contact-map">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3305.733248043701!2d-118.24532098539802!3d34.05071312525937!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c648fa1d4803%3A0xdec27bf11f9fd336!2s123%20S%20Los%20Angeles%20St%2C%20Los%20Angeles%2C%20CA%2090012%2C%20USA!5e0!3m2!1sen!2sbd!4v1585634930544!5m2!1sen!2sbd"
							frameborder="0" style="border: 0;" allowfullscreen=""
							aria-hidden="false" tabindex="0"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->

	<!-- Footer Start -->
	<jsp:include page="footer.jsp"/>
	<!-- Footer Bottom End -->

	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/slick/slick.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
