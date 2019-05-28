<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PHP Course</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
	input{
		font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
	}
	#demo li{
		display: none;
	}
	#content{
		padding: 25px;
	}
	#content li{
		text-align: center;
	}
	#listClass{
		z-index: 0;
		padding: 15px;
	}
	.carousel-caption{
		text-align: center;
		color: white;
	}
	
</style>
</head>
<body>
<div id="page-container">
<jsp:include page="header.jsp" />
<div id="content-wrap">
	<div align="center">
		<hr><h2><b>GIỚI THIỆU KHÓA HỌC</b></h2>			
	</div>
	<div id="content">
		<p style="-webkit-column-count:2; -moz-column-count:2; column-count:2;">Bạn muốn lập trình một trang web? Bạn chưa biết bắt đầu học từ đâu?
Thuở sơ khai của internet mọi người thường chia sẽ tài liệu văn bản cho nhau thông qua một giao thức nào đó. Người nhận sẽ tải tệp tin về máy tính và đọc tệp tin bằng chương trình tương ứng.
Đến khi <a href="#">World Wide Web</a> ra đời việc chia sẻ, xem, chỉnh sửa các tài liệu văn bản có thể thực hiện trực tuyến thông qua một phần mềm có kết nối internet gọi là trình duyệt.
Các tài liệu văn bản này sửa dụng ngôn ngữ đánh dấu <b>HTML</b> kết hợp với các đoạn văn bản (text) để xây dựng cấu trúc tài liệu, cách thức các text đó thể hiện trên trình duyệt. Và chúng được gọi là các siêu văn bản.
Cùng với sự phát triển nhanh chóng của <b>World Wide Web</b>, <b>HTML</b> dần trở thành một ngôn ngữ vô cùng hữu ích đối với các nhà phát triển browser. Nhiều trình duyệt được xây dựng và phát triển <b>HTML</b> theo hướng độc lập nhau. Điều này tạo nên nhiều rắc rối khi một website lại thể hiện khác nhau ở các browser khác nhau.
Dần nhận thấy sự phát triển tràn lan của ngôn ngữ <b>HTML</b> và những rắc rối mà nó mang lại, <b>HTML</b> đã đi đến thống nhất và phê duyệt bộ ngôn ngữ <b>HTML</b> chuẩn.

<b>HTML</b>ML là viết tắt của <a href="#">HyperText Markup Language</a> (ngôn ngữ đánh dấu siêu văn bản) dùng mô tả cấu trúc của các trang Web và tạo ra các loại tài liệu có thể xem được trong trình duyệt.
<b>HTML</b> là một tiêu chuẩn quốc tế có các thông số kỹ thuật được duy trì bởi <a href="#">World Wide Web Consortium</a>.

Chỉ với thời gian học 1 tháng, chúng tôi cam kết bạn sẽ thành thạo việc sử dụng HTML. 
</p>
		 <p>Sau khi hoàn thành khóa học, bạn có thể: </p><br>
		 <ul class="list-group">
    		<li class="list-group-item list-group-item-success">Làm quen và biết đến cắt web, thiết kế website</li>
   			<li class="list-group-item list-group-item-info">Xử lý thông tin, trình bày các nội dung trên web</li>
    		<li class="list-group-item list-group-item-warning">Sử dụng thành thao các thẻ, thuộc tính trong HTML</li>
    		<li class="list-group-item list-group-item-danger">Xây dựng một trang web cơ bản</li>
    	</ul>
	</div><hr><br>
	<div id="listClass">
		<div align="center">
			<h3><b>Danh sách lớp học PHP: </b></h3>			
		</div>	
		<div class="container" style="width:100%;" align="center">
			<div id="demo" class="carousel slide" data-ride="carousel">
  			<!-- Indicators -->
            <ul class=", s">
            	<li data-target="#demo" data-slide-to="0" class="active"></li>
          		<c:forEach var = "i" begin = "1" end = "${size}">
         			<li data-target="#demo" data-slide-to="${i}"></li>
      			</c:forEach>
            </ul>
            <!-- The slideshow -->
            <div class="carousel-inner">
            	<div class="carousel-item active">
                    	<img src="<c:url value="/resources/images/classImage1.png"/>" alt="Image" width="100%" height="450">
                    	<div class="carousel-caption">
		                 					
		             	</div>             
                </div>
            	<c:forEach items="${list}" var="c">
            		<div class="carousel-item">
                    	<a href="<c:url value="/class/${c['id']}"/>"><img src="<c:url value="/resources/images/classImage.jpg"/>" alt="Image" width="100%" height="450"></a>
                    	<div class="carousel-caption">
		                 	<div style="background-color: #f2b09b; font-size: 36px; font-family: 'Arial Black', Gadget, sans-serif;">	                 	
		                 	${c['name']}</div><hr>
         				 	<div style="background-color: #7baafc; font-size: 28px; font-family: 'Arial Black', Gadget, sans-serif;">Giảng viên: ${c['lecturer']}</div>
		                 	<div style="background-color: #7baafc;  font-size: 28px; font-family: 'Arial Black', Gadget, sans-serif;"">Ngày học: ${c['date']}</div>
		                 	<div style="background-color: #7baafc;  font-size: 28px;font-family: 'Arial Black', Gadget, sans-serif;">Số lượng đăng ký: ${c['count']}</div>
		                 	<div style="background-color: #7baafc;  font-size: 28px;font-family: 'Arial Black', Gadget, sans-serif;">Số lượng max: ${c['countMax']}</div>		
		             	</div>             
                	</div>
            	</c:forEach>
           	</div>
  			<!-- Left and right controls -->
  			<a class="carousel-control-prev" href="#demo" data-slide="prev">
    			<span class="carousel-control-prev-icon"></span>
  			</a>
  			<a class="carousel-control-next" href="#demo" data-slide="next">
   				<span class="carousel-control-next-icon"></span>
  			</a>  			
		</div>
	</div>
    </div><br><br><hr>
</div>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>
