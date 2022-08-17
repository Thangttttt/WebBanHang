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
			<h1 class="page-head-line">ACCOUNT</h1>
			<h1 class="page-subhead-line">${message}</h1>

		</div>
	</div>
		  <div class="row">
			<div class="col-md-12  ">
				<div class="panel panel-info">
					<div class="panel-heading">Thông Tin ACCOUNT</div>
					<form:form action="/account/create" modelAttribute="ac">
						<div class="panel-body">
							<div class="form-group">
								<form:input class="form-control" path="username" placeholder="Username?"/>
							</div>
							<div class="form-group">
								<form:input class="form-control" path="password" placeholder="Password?"/>
							</div>
							<div class="form-group">
								<form:input class="form-control" path="fullname" placeholder="Fullname?"/>
							</div>
							<div class="form-group">
								<form:input class="form-control" path="email" placeholder="Email?"/>
							</div>
							<div class="form-group">
								<form:input class="form-control" path="admin" placeholder="Role?"/>
							</div>
							
							
						</div>
						<!-- <button style="margin-bottom: 10px;margin-left: 20px;" type="submit" class="btn btn-info">Lưu</button> -->
						<button class="btn btn-success" formaction="/account/create">Create</button>
				<button class="btn btn-info" formaction="/account/update">Update</button>
				<a href="/account/delete/${ac.username}">Delete</a>
				<a href="/admin/accounts">Reset</a>
					</form:form>
				</div>
			</div>
		</div> 

		<div class="col-md-12">
			<!--   Kitchen Sink -->
			<div class="panel panel-default">
				<div class="panel-heading">Danh Sách Account</div>
				<div class="panel-body">
					<div style="overflow-y: scroll; max-height: 500px;" class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>Username</th>
									<th>Password</th>
									<th>Fullname</th>
									<th>Email</th>
									<th>Admin</th>
									<th></th>
								</tr>
							</thead>
							<c:forEach var="item" items="${items}">
							<tbody>
								<form action="">
								<tr>
									<td>${item.username}</td>
									<td>${item.password}</td>
									<td>${item.fullname}</td>
									<td>${item.email}</td>
									<td>${item.admin}</td>
									<td><a href="/account/edit/${item.username}">Edit</a></td>
								</tr>
								</form>
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
