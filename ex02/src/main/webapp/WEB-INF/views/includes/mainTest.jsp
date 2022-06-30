<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>team967</title>
	
	<!-- Bootstrap Core CSS -->
	<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
		rel="stylesheet">
	
	<!-- MetisMenu CSS -->
	<link href="/resources/vendor/metisMenu/metisMenu.min.css"
		rel="stylesheet">
	
	<!-- DataTables CSS -->
	<link
		href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
		rel="stylesheet">
	
	<!-- DataTables Responsive CSS -->
	<link
		href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
		rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
		rel="stylesheet" type="text/css">
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">발주계획</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">구매발주</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">자재입고</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled">자재출고</a>
  </li>
</ul>


<style>


</style>
</head>

<body>
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.html">team967</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            	<li>
	           		<i class="fa fa-user fa-fw"></i> 이름(아이디)님
	           	</li>
	           	
				<li>
	           		<a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
	           	</li>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">

                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i><b> 발주계획</b><span class="fw arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">품목 정보 등록 / 조회</a>
                                </li>
                                <li>
                                    <a href="morris.html">조달 계획 등록 / 조회</a>
                                </li>
                                <li>
                                    <a href="morris.html">회사 정보 등록 / 조회</a>
                                </li>
                                <li>
                                    <a href="morris.html">계약 등록 / 조회</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                      	<li>
                            <a href="#"><i class="fa fa-table fa-fw"></i><b> 구매발주</b></a>
                        </li>
                        
                        <li>
                        	<a href="#"><i class="fa fa-wrench fa-fw"></i><b> 자재입고</b></a>
                        </li>                       
                        
                        <li>
                        	<a href="#"><i class="fa fa-dashboard fa-fw"></i><b> 자재출고</b></a>
                        </li> 
            
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><h1>조달계획 등록 /조회</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Form Elements
                        </div>
                        <div class="panel-body">
                        
                        
<form method="get" action="SelectServlet">
		<select id="pk" name="pk" size="1">
			<option value="">품목코드</option>
			<option value="품목명">품목명</option>
		
		
		<div class="search-bar">
          <i class="fas fa-search"></i>
          <input class="search-bar__input" type="search" placeholder="품목코드(품목명) 검색"  />
        </div>
      &nbsp; 
		</select>
<form action="/board/regist" method ="post">
<button type="button" class="btn btn-default">등록</button>

<form action="/board/modify" method ="post">
<button type="button" class="btn btn-default">수정</button>

<form action="/board/delete" method ="post">
<button type="button" class="btn btn-default" onclick="alert('삭제하시겠습니까?')">삭제</button>
<br>



<table border ="1"  height=200 bgcolor=#11a9c1 bordercolor="lightgrey" cellspacing="5">
      <tr align="center" bgcolor="white" >
        <td>품목코드</td>
        <td><input type="text" id="name" name="name"  required
       minlength="4" maxlength="8" size="13"></td>
        <td>품목명</td>
        <td><input type="text" id="name" name="name" required
       minlength="4" maxlength="8" size="13"></td>
        <td>소요량</td>
        <td><input type="text" id="name" name="name" required
       minlength="4" maxlength="8" size="13"></td>
      </tr>

      <tr align="center" bgcolor="white">
        <td>자재소요공정</td>
        <td><input type="text" id="name" name="name" required
       minlength="4" maxlength="8" size="13"></td>
        <td>소요일정</td>
        <td><input type="text" id="name" name="name" required
       minlength="4" maxlength="8" size="13"></td>
        <td>조달납기</td>
        <td><input type="text" id="name" name="name" required
       minlength="4" maxlength="8" size="13"></td>
      </tr>
     
    </table>

<br>
조달계획 목록
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>



                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

</body>

</html>
