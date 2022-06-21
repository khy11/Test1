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
                            게시판 목록보기 <a href="/board/register">글등록</a> &nbsp;&nbsp;&nbsp; 총글개수(${pageMaker.total}) &nbsp;&nbsp;&nbsp;
                            <a href="/board/rank?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">랭킹</a>
                            &nbsp;&nbsp;&nbsp; <a href="/board/overlap?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">중복된 글</a>
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>글번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <tbody>
    <c:forEach var="board" items="${list}" >              
                                  <tr class="odd gradeX">
                                   <td>${board.bno}</td>
                                   <!-- <a href="/board/get?bno=${board.bno}">는 제목을 클릭하면 글 페이지로 들어가게 링크삽입 -->
                                   <td><a href="/board/get?bno=${board.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">${board.title}</a></td>
                                   <!-- c:out링크는 작성자칸에서 html이나 css태그를 쓰면 작동되는걸 금지하는 코드 -->
                                   <td><c:out value="${board.writer}"/></td>
                                   <td><fmt:formatDate pattern="yyy-MM-dd" value="${board.regdate }"/></td>
                                   <td><fmt:formatDate pattern="MM-dd hh:mm" value="${board.updatedate}"/></td>
                                 <!-- 랭킹  -->
                                   
                                   <!-- c:out링크는 작성자칸에서 html이나 css태그를 쓰면 작동되는걸 금지하는 코드 -->
                                   <td><c:out value="${board.writer}"/></td>
                                   <td><fmt:formatDate pattern="yyy-MM-dd" value="${board.regdate }"/></td>
                                   <td><fmt:formatDate pattern="MM-dd hh:mm" value="${board.updatedate}"/></td>



   </c:forEach>                                </tr>                          
      
                                   </tbody>
                            </table>
                                
   <form action="/board/list" method="get">
   <select name="type">
   <option>검색조건</option>
   <option ${pageMaker.cri.type == "T" ? "selected" : ""} value="T">제목</option>
   <option ${pageMaker.cri.type == "C" ? "selected" : ""} value="C">내용</option>  
   <option ${pageMaker.cri.type == "W" ? "selected" : ""} value="W">작성자</option>
   <option ${pageMaker.cri.type == "TC" ? "selected" : ""} value="TC">제목 or 내용</option>
   <option ${pageMaker.cri.type == "TW" ? "selected" : ""} value="TW">제목 or 작성자</option>
   <option ${pageMaker.cri.type == "CW" ? "selected" : ""} value="CW">내용 or 작성자</option>
   <option ${pageMaker.cri.type == "TCW" ? "selected" : ""} value="TCW">제목 or 내용 or 작성자</option>
   </select>
   <input type="text" name="keyword">
   <input type="submit" value="검색">
     </form>
     <br>
                            
                            <!--다음페이지, 이전페이지 -->
 					 <c:if test="${pageMaker.prev}">
                            <a href="/board/list?pageNum=${pageMaker.startPage-1}&&amount=${pageMaker.cri.amount}"> prev </a>  &nbsp;&nbsp;&nbsp;&nbsp;
                            </c:if>
                            
                            <c:forEach begin="${pageMaker.startPage}"  end="${pageMaker.endPage}" var="num">
                            	 <a href="/board/list?pageNum=${num}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
                            	 
                            	 <%--현재 페이지 번호 진하게 
                            	 1. ${param.pageNum}
                            	 2. ${pageMaker.cri.pageNum} 
                            	 3. ${critera.pageNum}
                          	     --%>
                          	     
                            	<c:if test="${pageMaker.cri.pageNum == num}" >
                            	<b>${num}</b>
                            	</c:if>
                            	<c:if test="${pageMaker.cri.pageNum != num}" >
                            	   ${num}
                            	</c:if> 
                            	  
                            	 </a> &nbsp;&nbsp;&nbsp;&nbsp;
                            </c:forEach>
                            
						<c:if test="${pageMaker.next}">
                            	<a href="/board/list?pageNum=${pageMaker.endPage+1}&&amount=${pageMaker.cri.amount}"> next </a>
                            </c:if>
                            
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


           <!-- Modal -->
           <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
               <div class="modal-dialog">
                   <div class="modal-content">
                       <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                           <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                       </div>
                       <div class="modal-body">
                             ${bno}번 글이 등록되었습니다.
                       </div>
                       <div class="modal-footer">
                           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                       </div>
                   </div>
                   <!-- /.modal-content -->
               </div>
               <!-- /.modal-dialog -->
           </div>
           <!-- /.modal -->
           

    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

<script>
//입력된 글번호 알려주기 
var bno = "${bno}"; //값이 있으면 값이 들어간 문자열로 처리  (문자가 아님) 자바코드먼저 -> jsp
//${param.bno}로 하면 request로 넘어가서 모델로 실어서 보냈다는건데(attribute) 실을 모델이 없으므로 session영역으로 보내야한다.
// page -> request(mvc모델) -> session (attibuteflash 사용하면 세션으로 처리됨) -> application 
var state = "${state}";
console.log("등록된 글번호는 :" +bno);


//알고 있어야하는 내용
// 1. history.replaceState(data,title,url) 히스토리 상태값을 변경해주는 메소드
// 2. history.state 히스토리 상태값을 읽는 것 (history.replaceState()미사용시  null)
if(history.state){ //javascript에서는 null이면 false로 처리됨 }
console.log("히스토리 상태값:" +history.state)
	console.log("히스토리 상태값이 존재")
}else {
	console.log("히스토리 상태값이 없다")
}

if(bno!="" && history,state){ // 글번호가 있고
	$("#myModal").modal("show");
} //크롬에서 바로전 뒤로가기 일 경우 변경되 내용이 확인안됨 (크롬에서 바로전 바로가기 일 경우 내부적으로 같은 언언느 동작되지않게 돼있어서)

// ------------------------------------

if(state=="remove"){
	$(".modal-body").text("삭제가 정상적으로 처리되었습니다.");
	$("#myModal").modal("show");
}else if(state=="modify" && !history.state){
	$(".modal-body").text("수정이 정상적으로 처리되었습니다.");
	$("#myModal").modal("show");
}
</script>

</body>

               
</html>
