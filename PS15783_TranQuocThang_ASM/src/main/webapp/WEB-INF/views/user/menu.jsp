<%@ page pageEncoding="utf-8"%>
<base href="${pageContext.servletContext.contextPath}/"/>
<div class="top-bar">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6">
					<i class="fa fa-envelope"></i> estoresupport@email.com
				</div>
				<div class="col-sm-6">
					<i class="fa fa-phone-alt"></i> +012-345-6789
				</div>
			</div>
		</div>
	</div>
	<!-- Top bar End -->

	<!-- Nav Bar Start -->
	<div class="nav">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-md bg-dark navbar-dark">
				<a href="#" class="navbar-brand">MENU</a>
				<button type="button" class="navbar-toggler" data-toggle="collapse"
					data-target="#navbarCollapse">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse justify-content-between"
					id="navbarCollapse">
					<div class="navbar-nav mr-auto">
						<a href="/estore/index" class="nav-item nav-link active">TRANG CHỦ</a> 
						<!-- <a href="" class="nav-item nav-link">YÊU THÍCH</a>  -->
						<a href="/estore/contact"
							class="nav-item nav-link">GIỚI THIỆU</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-toggle="dropdown">CÀI ĐẶT</a>
							<div class="dropdown-menu">
								<a href="/estore/login" class="dropdown-item">ĐĂNG NHẬP</a> 
								<a href="/estore/register"
									class="dropdown-item">ĐĂNG KÝ</a> 
									<!-- <a href="#" class="dropdown-item">QUÊN MẬT KHẨU</a> -->
									<a href="/estore/forgotpass" class="dropdown-item">QUÊN MẬT KHẨU</a> 
							</div>
						</div>
					</div>
					<div class="navbar-nav ml-auto">
						<a href="/estore/myaccount" class="nav-item nav-link">TÀI KHOẢN</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- Nav Bar End -->

	<!-- Bottom Bar Start -->
	<div class="bottom-bar">
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-md-3">
					<div class="logo">
						<a href="index.html"> <img src="/us/img/logo.png" alt="Logo">
						</a>
					</div>
				</div>
				<div class="col-md-6">
				<form action="/product/search" method="post">
					<div class="search">
						<input type="text" name="keywords" placeholder="Search">
						<button type="submit">
							<i class="fa fa-sea rch"></i>
						</button>
					</div>
					</form>
				</div>
				<div class="col-md-3">
					<div class="user">
						<a href="wishlist.html" class="btn wishlist"> <i
							class="fa fa-heart"></i> <span>(0)</span>
						</a> <a href="/estore/cart" class="btn cart"> <i
							class="fa fa-shopping-cart"></i> <span>(${Tonghang})</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>