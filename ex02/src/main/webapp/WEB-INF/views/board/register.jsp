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
                     	       게시글 등록
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                         	
                         	<form action="/board/register" method="post">
                         	<label>제목</label>
                         	<input class="form-control" placeholder="제목을 적어주세요" type="text" name = "title" required="required">
                         	<br>
                         	<label>내용</label>
                         	<textarea class ="form-control" placeholder="내용을 적어주세요" name="content" rows="10" required="required"></textarea>
                         	<br>
                         	<label>작성자</label>
                         	<input class="form-control" placeholder="작성자를 적어주세요" type="text" name="writer" required="required">
                         	<br>
                         	<button type="submit" class="btn btn-outline btn-primary btn-lg btn-block">글 등록</button>
                         	<br>
                         	<button type="reset" class="btn btn-outline btn-danger">초기화</button>
                         	<br>
                            </button>
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


</body>

</html>
