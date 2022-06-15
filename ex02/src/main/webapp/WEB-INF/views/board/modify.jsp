<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %>    

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            게시글 변경하기
                        <!-- /.panel-heading -->
                        <div class="panel-body">
 
 						
	 						<form action="/board/modify" method="post">
	 						
	 						<input type="hidden" value="${board.bno }"  name="bno">
	 						
	 						<label>제목</label>
	 						<input class="form-control"  type="text" name="title"   value="${board.title } ">	
	 						
	 						<br> 						
	 						<label>내용</label>
	 						<textarea class="form-control"  name="content" rows="3" >${board.content } </textarea>
	 						  	<!-- 내용은 input값 아니라서 value로 처리안함 -->
	 						                               	
	 						                               	
	 						<br>
	 						<label>작성자</label>
	 						<input class="form-control"  type="text" name="writer"  value="${board.writer }" >
	 						
	 						<br>
	 					
	 						<button type="submit" class="btn btn-warning">수정</button>
	 						<button type ="submit" id="deleteButton" class="btn btn-outline btn-danger">삭제</button> 
	 						<button class="btn btn-ouㄴtline btn-default" onclick="location.href='/board/list'">목록보기</button>
	 						</form>
 
 
 
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
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

<script>
//삭제 버튼이 클릭되었을때 동작
var formObj=$("form");
$("#deleteButton").on("click",function(e){ 
	e.preventDefault(); //기본적으로 걸려있는 이벤트 무시
	
	formObj.attr("action","/board/remove");
	formObj.submit();
});


</script>

</body>

</html>
