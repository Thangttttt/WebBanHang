<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<base href="${pageContext.servletContext.contextPath}/" />
<div id="page-inner">
	<div class="row">
		<div class="col-md-12">
			<h1 class="page-head-line">DASHBOARD</h1>
			<h1 class="page-subhead-line">Thống Kê</h1>

		</div>
	</div>
	<!-- /. ROW  -->
	<div class="row">
		 
		<div class="col-md-12">
			<div class="main-box mb-pink">
				<a href="#"> <i class="fa fa-dollar fa-5x"></i>
					<h3>Tổng Tiền</h3>
					<h5>${tongtien}</h5>
				</a>
			</div>
		</div>

	</div>
	<!-- /. ROW  -->
	<hr />
	

	<div class="row">
		<div class="col-md-12">
			<!--    Hover Rows  -->
			<div class="panel panel-default">
				<div class="panel-heading">Tồn kho theo loại hàng</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead class="bg-info">
								<tr>
									<th>Loại hàng</th>
									<th>Tổng giá</th>
									<th>Số sản phẩm</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="item" items="${items}">
							<thead  >
								<tr>
									<td>${item.group.name}</td>
									<td>${item.sum}</td>
									<td>${item.count}</td>
								</tr>
								</thead>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- End  Hover Rows  -->
		</div>
		
	</div>
	<!--/.ROW-->

</div>