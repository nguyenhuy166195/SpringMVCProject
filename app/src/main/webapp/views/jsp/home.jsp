<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet" type="text/css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/c-0ss/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
  /* Make the image fully responsive */
  
  #imageshow{
  	  text-align: center;
      width: 100%;
      height: 360px;
  }
  #demo li{
  	display:none; 
  }
  figcaption{
  	font-size: 30px;
  	text-align: center;
  	color: white;
  	background-color: #ed936d;
  }
  #introduction{
  	
    font-family:Book Antiqua;
  	padding: 10px;
  }
 </style>
</head>
<body>
<div id="page-container">
<jsp:include page="header.jsp" />
<div id="content-wrap">
	<hr><h1 style="text-align: center;"><b>CÁC KHÓA HỌC TẠI TRUNG TÂM</b></h1>
	<div id="imageshow" class="container">		
		<div id="demo" class="carousel slide" data-ride="carousel">
  			<!-- Indicators -->
            <ul class=", s">
               <li data-target="#demo" data-slide-to="0" class="active"></li>
               <li data-target="#demo" data-slide-to="1"></li>
               <li data-target="#demo" data-slide-to="2"></li>
               <li data-target="#demo" data-slide-to="3"></li>
               <li data-target="#demo" data-slide-to="4"></li>
            </ul>
            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="<c:url value="/html" />"><img src="<c:url value="/resources/images/Course/HTML_big.jpg"/>" alt="HTML" width="100%" height="350"></a>
                    <figcaption>
		                 <h4><strong>THIẾT KẾ WEBSITE VỚI HTML</strong></h4>
                    </figcaption>
                </div>
                <div class="carousel-item">
                     <a href="<c:url value="/css" />"><img src="<c:url value="/resources/images/Course/CSS_big.jpg"/>" alt="CSS" width="100%" height="350"></a> 
                     <figcaption>
		                 <h4><strong>THIẾT KẾ WEBSITE VỚI CSS</strong></h4>
                     </figcaption>
                </div>
    			<div class="carousel-item">
      				<a href="<c:url value="/javascript" />"><img src="<c:url value="/resources/images/Course/JavaScript_big.jpg"/>" alt="JavaScript" width="100%" height="350"></a>
       				<figcaption>
						<h4><strong>Học JavaScript cơ bản</strong></h4>
      				</figcaption>
    			</div>
    			<div class="carousel-item">
      				<a href="<c:url value="/java" />"><img src="<c:url value="/resources/images/Course/Java_big.jpg"/>" alt="Java" width="100%" height="350"></a>
      				<figcaption>
						<h4><strong>Học Java cơ bản</strong></h4>
      				</figcaption>
    			</div>
    			<div class="carousel-item">
      				<a href="<c:url value="/php" />"><img src="<c:url value="/resources/images/Course/PHP_big.jpg"/>" alt="PHP" width="100%" height="350"></a>
       				<figcaption>
						<h4><strong>Học PHP cơ bản</strong></h4>
      				</figcaption>
    			</div>
  			</div>
  			<!-- Left and right controls -->
  			<a class="carousel-control-prev" href="#demo" data-slide="prev">
    			<span class="carousel-control-prev-icon"></span>
  			</a>
  			<a class="carousel-control-next" href="#demo" data-slide="next">
   				<span class="carousel-control-next-icon"></span>
  			</a>  			
		</div>
	</div><br><hr>
	
	<div id="introduction" class="container" align="left">
		<h2>GIỚI THIỆU TRUNG TÂM</h2>
        	<p style="-webkit-column-count:2; -moz-column-count:2; column-count:2;">
        	<b>Codeman</b> tự hào là nhà cung cấp dịch vụ đào tạo Công nghệ Thông tin (CNTT) hàng đầu tại Hà Nội cấp bằng Quốc tế. Các Trung tâm Đào tạo Lập trình viên Quốc tế Codeman tại Việt Nam vinh dự là thành viên của Tập đoàn <b>Codeman</b>. <b>Codeman</b> là tập đoàn lớn về đào tạo CNTT tại Việt Nam, đang đóng vai trò quan trọng trong việc giúp các cá nhân, tổ chức và quốc gia trong việc đáp ứng những thay đổi không ngừng của xã hội tri thức. Ra đời từ năm 2005, đến nay <b>Codeman</b> đã đào tạo hơn 100.000 chuyên gia CNTT trên toàn đất nước. Các trung tâm đào tạo của Codeman đều tuân thủ theo một qui trình đào tạo thống nhất được cấp chứng chỉ ISO 9001. Qui trình đào tạo này bao gồm những thành tố như trình độ giáo viên, trang thiết bị đào tạo, qui trình quản lý và kiểm soát chất lượng đào tạo. Chương trình đào tạo của <b>Codeman</b> được cộng đồng cả nước đánh giá cao, và quan trọng hơn cả là học viên của <b>Codeman</b> được công nhận rộng rãi, đặc biệt ở những nước có nền công nghệ tiên tiến. Hàng chục ngàn lập trình viên do <b>Codeman</b> cấp bằng đã và đang làm việc tại Mỹ và các quốc gia phát triển khác.
			</p>
			<h3>Ưu Điểm Của <b>Codeman</b> !</h3>
				<ul class="list-group" style="text-align: center;">
                    <li class="list-group-item list-group-item-success">Học để làm việc</li>
    				<li class="list-group-item list-group-item-secondary">Làm việc với các chuyên gia</li>
    				<li class="list-group-item list-group-item-info">Cập nhật kiến thức, công nghệ mới nhất</li>
    				<li class="list-group-item list-group-item-warning">Có kinh nghiệm làm dự án khi đang học</li>
    				<li class="list-group-item list-group-item-danger">Thời gian học ít, chi phí ít, biết nhiều</li>
    				<li class="list-group-item list-group-item-primary">Tiếp xúc sớm với các doanh nghiệp phần mềm</li>
    				<li class="list-group-item list-group-item-dark">Tự tin khi tìm việc làm</li>
  				</ul><br>
  		<strong>Hình ảnh trung tâm - Số 1 Đại Cồ Việt</strong><br><br>
 			<img src="<c:url value="/resources/images/BKHN.jpg"/>" alt="Trung tâm" width="1000" height="450"><br>
 			<p  style="-webkit-column-count:2; -moz-column-count:2; column-count:2;">Các trung tâm đào tạo của <b>Codeman</b> tại Việt Nam là những thành viên nỗ lực của đại gia đình <b>Codeman</b> đang đáp ứng nhu cầu ngày càng tăng về đào tạo lực lượng lập trình viên chuyên nghiệp cũng như nguồn nhân lực có trình độ tin học cao cho các doanh nghiệp, tổ chức trong và ngoài Việt Nam.</p>
 			<img src="<c:url value="/resources/images/class.jpg"/>" alt="Lớp học" width="1000" height="450"><br>
 		<strong>Chương trình hiện đại và cập nhật</strong><br>
 			<p  style="-webkit-column-count:2; -moz-column-count:2; column-count:2;"><i>"We don’t keep up with technology. We stay ahead of it."</i> – <b>Codeman</b> không chạy theo công nghệ. <b>Codeman</b> luôn luôn đón đầu công nghệ. Quá trình nghiên cứu nhu cầu của hơn 600 công ty phần mềm lớn trên thế giới giúp <b>Codeman</b> thiết kế các chương trình đào tạo phù hợp với các xu hướng công nghệ lớn: <b>.NET (MicroSoft)</b> và <b>J2EE (Sun Microsystems)</b>. Chương trình đào tạo lập trình viên quốc tế ACCP i10 bắt đầu được đưa vào đào tạo từ năm 2010.</p>
 		<strong>Đối tượng đào tạo</strong><br>
 			<p  style="-webkit-column-count:2; -moz-column-count:2; column-count:2;">Đối tượng đào tạo của <b>Codeman</b> đa dạng, không phân biệt lứa tuổi, giới tính, nghề nghiệp, từ học sinh, sinh viên tới nhân viên trong các doanh nghiệp và doanh nhân – những ai mong muốn xây dựng cho mình một nghề nghiệp vững chắc và có tương lai, những ai quan tâm và cần đến tin học trong công việc và cuộc sống như một nghề nghiệp chuyên môn hay như một công cụ hỗ trợ.</p>
 		<strong>Đội ngũ giảng viên</strong><br>
 			<p  style="-webkit-column-count:2; -moz-column-count:2; column-count:2;">Đội ngũ giảng viên quy tụ những chuyên gia làm việc lâu năm trong ngành phần mềm và có nhiều kinh nghiệm trong các lĩnh vực thu hút nhân lực hiện nay. Các giáo viên hầu hết có thâm niên thực hiện dự án liên quan đến khóa học và có kinh nghiệm truyền đạt, hướng dẫn để giúp bạn dễ dàng tiếp cận các kiến thức.</p>
 		<strong>Phương pháp giảng dạy</strong><br>
 			<p  style="-webkit-column-count:2; -moz-column-count:2; column-count:2;">Phương pháp giảng dạy đa phương thức, kết hợp giữa lý thuyết, thực hành, rèn luyện kỹ năng và chia sẻ kinh nghiệm từ các chuyên gia. Với quan điểm trên chúng tôi tin tưởng sẽ giúp được nhiều bạn trẻ thành công và góp phần giải quyết những khó khăn về nhân lực cho ngành phần mềm của thành phố.</p>	
 		<br><hr>
 		<h2>Học viên ưu tú</h2>
 		<div class="row">
 		<div class="col">
 		<div class="card" style="width:300px;  height: 500px;  overflow: auto;">
    		<img class="card-img-top"src="<c:url value="/resources/images/grace.jpg"/>" alt="Card image" style="width:300px; height: 300px;">
            <div class="card-body">
               <h4 class="card-title">Ngô Thị Hoa</h4>
               <p class="card-text">
				Học viên lớp JAVA1(8/2016)<br>
               Tôi cảm thấy đi học tại Codeman thật là một lựa chọn đúng đắn. Chỉ sau 5 tháng, tôi như cảm thấy mình trở thành một con người khác. Từ một cô sinh viên IT chưa biết gì về lập trình, giờ đây t đã có thể tự làm được 1 trang web mình thích. Cám ơn trung tâm.
               </p>
           </div>
        </div></div>
        <div class="col">
        <div class="card" style="width:300px; height: 500px; overflow: auto;">
    		<img class="card-img-top"src="<c:url value="/resources/images/Chirs.jpg"/>" alt="Card image" style="width:300px; height: 300px;">
            <div class="card-body">
               <h4 class="card-title">Nguyễn Văn Huy</h4>
               <p class="card-text">
               Học viên lớp PHP2(7/2018)<br>
Tôi tưởng học lập trình tại trung tâm khô khan lắm. Nhưng khi đến với Codeman, tôi thực sự cảm thấy mình sai lầm. Mọi người hòa đồng, vui vẻ, giảng viên vui tính, dạy thật dễ hiểu, cơ sở vật chất thật đầy đủ.             
               </p>              
           </div>
        </div></div>
        <div class="col">
        <div class="card" style="width:300px;  height: 500px; overflow: auto;">
    		<img class="card-img-top" src="<c:url value="/resources/images/Emma.jpg"/>" alt="Card image" style="width:300px;height: 300px;">
            <div class="card-body">
               <h4 class="card-title">Hoàng Trúc Mai</h4>
               <p class="card-text">Học viên lớp JAVA2(2/2019)<br>
Trung tâm thật chất lượng. Sau khi học tại trung tâm xong, tôi đã apply thành công vào công ty FPT. Cám ơn trung tâm. 
</p>               
           </div>
        </div></div>
        </div><br>     
	</div><hr>	
</div>
<jsp:include page="footer.jsp" />
</div>
</body></html>


