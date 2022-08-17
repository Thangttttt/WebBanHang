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
				<h1 class="page-head-line">PRODUCTS</h1>
				<h1 class="page-subhead-line">Em mới load được danh sách - Chưa
					CRUD - Sắp Hoàn Thiện :((</h1>

			</div>
		</div>
		<div class="row">
			<div class="col-md-12  ">
				<div class="panel panel-info">
					<div class="panel-heading">Thông Tin Product</div>
					<form:form action="/product/create" modelAttribute="item" enctype="multipart/form-data">
						<div class="panel-body">
							<div class="form-group">
								    <form:select path="category" cssClass="form-control">
									<form:options items="${listcategory}" itemValue="id"
										itemLabel="name" />
								</form:select>   
								
							</div>
							  <div class="form-group">
								<%-- <form:input class="form-control" path="category.id"
									placeholder="Product Name?" /> --%>
							</div>  
							<div class="form-group">
								<form:input class="form-control" path="name"
									placeholder="Product Name?" />
							</div>
							<div class="form-group">
								<form:input class="form-control" path="price"
									placeholder="Product Price?" />
							</div>
							<%-- <div class="form-group">
								<form:input class="form-control" path="createDate"
									placeholder="Product CreateDate?" />
							</div> --%>

							<div class="form-group">
								<label>Chọn Ảnh</label>
								<div class="">
									<div class="fileupload fileupload-new"
										data-provides="fileupload">
										<div id="displayImg">
											<img width="200px" height="150px" id="image" src="/us/img/${loadanh}" >
											
										</div>
										<div>
											<!-- <input onchange="up()"onchange="getNameImg()"  type="file" id="upload" name="saveimg"/> -->
											<input type="file" id="upload" name="saveimg" onchange="up()"/>
											<form:input type="hidden" path="image" id="nameImg"/>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- <button style="margin-bottom: 10px;margin-left: 20px;" type="submit" class="btn btn-info">Lưu</button> -->
						<button class="btn btn-success" formaction="/product/create">Create</button>
						<button class="btn btn-info" formaction="/product/update/${item.id}">Update</button>
						<a href="/product/delete/${item.id}">Delete</a>
						<a href="/admin/products">Reset</a>
					</form:form>
				</div>
			</div>
		</div>

		<div class="col-md-12">
			<!--   Kitchen Sink -->
			<div class="panel panel-default">
				<div class="panel-heading">Danh Sách Products</div>
				<div class="panel-body">
					<div style="overflow-y: scroll; max-height: 420px;"
						class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>Tên</th>
									<th>Ảnh</th>
									<th>Giá</th>
									<th>Ngày Tạo</th>
									<th>ID Danh Mục</th>
									<th></th>
								</tr>
							</thead>
							<c:forEach var="item" items="${items}">
								<tbody>
									<tr>
										<td>${item.id}</td>
										<td>${item.name}</td>
										<td><img width="100px" height="auto"
											src="/us/img/${item.image}"></td>
										<td>${item.price}</td>
										<td>${item.createDate}</td>
										<td>${item.category.name}</td>
										<td><a href="/product/edit/${item.id}" onclick="edit(this)">Edit</a></td>
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
	<script>
		function edit(obj) {
			let tr = obj.parentNode.parentNode;
			let img = tr.childNodes[5].childNodes[0];
			let imgSplit = img.src.split("/");
			let nameImg = imgSplit[imgSplit.length - 1];

			let idFillImg = document.getElementById("image");
			idFillImg.src = "/us/img/"+ nameImg;
			console.log(nameImg);
		}
		
		function up(){
            let file = document.getElementById('upload').files;
            if(file.length > 0){
               
                    let fileLoad = file[0];
                    let fileRender = new FileReader();
                    fileRender.onload = function(fileLoaderEvent){
                        let srcData = fileLoaderEvent.target.result;
                        
                        let newImage = document.getElementById('image');
                        newImage.src = srcData;
                        document.getElementById('displayImg').innerHTML = newImage.outerHTML;//lấy ra 1 ảnh
                        
                    }
                    fileRender.readAsDataURL(fileLoad);
               
            }
            
            let imgFile = document.getElementById("upload");
            let imgFileSplit = imgFile.value.split("\\");
            let nameImg = imgFileSplit[imgFileSplit.length - 1];
            console.log(nameImg);
            document.getElementById("nameImg").value = nameImg;
        }
	</script>

</body>
</html>
