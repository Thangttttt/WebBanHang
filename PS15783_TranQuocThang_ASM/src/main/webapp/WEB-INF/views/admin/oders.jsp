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

		<div class="col-md-12">
			<!--   Kitchen Sink -->
			<div class="panel panel-default">
				<div class="panel-heading">Danh Sách Order</div>
				<div class="panel-body">
					<div style="overflow-y: scroll; max-height: 460px;" class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>Username</th>
									<th>CreateDate</th>
									<th>Address</th>
									<th>SDT</th>
									<th>Paid</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${items}">
							<tbody>
								<tr>
									<td>${item.id}</td>
									<td>${item.account.username}</td>
									 <td>${item.createDate}</td>
									 <td>${item.address}</td>
									  <td>${item.sdt}</td>
									  <td>${item.paid}</td>
										<%-- <td><a href="/category/edit/${item.id}">Edit</a></td> --%>
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
