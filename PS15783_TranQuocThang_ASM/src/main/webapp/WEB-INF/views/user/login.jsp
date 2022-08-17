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
	<!-- Top bar Start -->
	<jsp:include page="menu.jsp" />
	<!-- Bottom Bar End -->

	<!-- Breadcrumb Start -->
	<div class="breadcrumb-wrap">
		<div class="container-fluid">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Products</a></li>
				<li class="breadcrumb-item active">Login</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Login Start -->
	<div class="login">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 m-auto">
					<form action="/account/login" method="post">
					${message}
						<div class="login-form">
							<div class="row">
								<div class="col-md-6">
									<label>Username</label> <input class="form-control" value="${u}" 
										name="username" type="text" placeholder="Nhập Username">
								</div>
								<div class="col-md-6">
									<label>Password</label> <input class="form-control" value="${p}" 
										name="password" type="text" placeholder="Nhập Password">
								</div>
								<div class="col-md-12">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" name="remember" value="true" ${check}
											class="custom-control-input" id="newaccount"> <label
											class="custom-control-label" for="newaccount">Keep me
											signed in</label>
									</div>
								</div>
								<div class="col-md-12">
									<button class="btn">Submit</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Login End -->

	<!-- Footer Start -->
	<jsp:include page="footer.jsp" />
	<!-- Footer End -->

	<!-- Footer Bottom Start -->
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6 copyright">
					<p>
						Copyright &copy; <a href="https://htmlcodex.com">HTML Codex</a>.
						All Rights Reserved
					</p>
				</div>

				<div class="col-md-6 template-by">
					<p>
						Template By <a href="https://htmlcodex.com">HTML Codex</a>
					</p>
				</div>
			</div>
		</div>
	</div>
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
