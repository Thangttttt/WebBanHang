<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<base href="${pageContext.servletContext.contextPath}/" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Responsive Bootstrap Advance Admin Template</title>

<!-- BOOTSTRAP STYLES-->
<link href="/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="/assets/css/font-awesome.css" rel="stylesheet" />
<!-- PAGE LEVEL STYLES -->
<link href="/assets/css/bootstrap-fileupload.min.css" rel="stylesheet" />
<!--CUSTOM BASIC STYLES-->
<link href="/assets/css/basic.css" rel="stylesheet" />
<!--CUSTOM MAIN STYLES-->
<link href="/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />

</head>
<body>
	<div id="page-inner">
	<div class="row">
		<div class="col-md-12">
			<h1 class="page-head-line">ORDERDETAIL</h1>
			<h1 class="page-subhead-line"></h1>

		</div>
	</div>
		 

		<div class="col-md-12">
			<!--   Kitchen Sink -->
			<div class="panel panel-default">
				<div class="panel-heading">Danh Sách Oderdetail</div>
				<div class="panel-body">
					<div style="overflow-y: scroll; max-height: 460px;" class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>OderID</th>
									<th>ProductID</th>
									<th>Price</th>
									<th>Quantity</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${items}">
							<tbody>
								<tr>
									<td>${item.id}</td>
									<td>${item.order.id}</td>
									<td>${item.product.id}</td>
									<td>${item.price}</td>
									<td>${item.quantity}</td>
									<%-- <td><img width="100px" height="auto" src="/us/img/${item.image}"></td>
									<td><a href="/category/edit/${item.id}">Edit</a></td> --%>
								</tr>
							</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<!-- End  Kitchen Sink -->
		</div>
	</div> 
	</div>
	<!-- JQUERY SCRIPTS -->
	<script src="/assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="/assets/js/bootstrap.js"></script>
	<!-- PAGE LEVEL SCRIPTS -->
	<script src="/assets/js/bootstrap-fileupload.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="/assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="/assets/js/custom.js"></script>


</body>
</html>
