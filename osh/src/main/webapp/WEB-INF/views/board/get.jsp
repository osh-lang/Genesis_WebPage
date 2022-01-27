<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../includes/header.jsp" />

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">Tables</h1>
	<p class="mb-4">
		DataTables is a third party plugin that is used to generate the demo
		table below. For more information about DataTables, please visit the <a
			target="_blank" href="https://datatables.net">official DataTables
			documentation</a>.
	</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Board View</h6>
		</div>
		<div class="card-body">
			<form method="post" class="needs-validation" novalidate>
				<div class="form-group">
					<label for="bno" class="font-weight-bold text-warning">bno</label>
					<input type="text" class="form-control" id="bno" name="bno"
						required value="${board.bno}" readonly>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<label for="title" class="font-weight-bold text-warning">title</label>
					<input type="text" class="form-control" id="title"
						placeholder="게시글을 제목을 입력하세요" name="title" required
						value="${board.title}" readonly>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<label for="title" class="font-weight-bold text-warning">content</label>
					<textarea class="form-control" rows="10" id="content"
						placeholder="게시글을 내용을 입력하세요" name="content" required readonly>${board.content}</textarea>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<label for="writer" class="font-weight-bold text-warning">writer</label>
					<input type="text" class="form-control" id="writer"
						placeholder="작성자를 입력하세요" name="writer" required
						value="${board.writer}" readonly>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<a href="list${cri.listLink}" data-opper="list"
					class="btn btn-outline-info float-right">List</a> <a
					href="modify${cri.listLink}&bno=${board.bno}" data-opper="modify"
					class="btn btn-outline-warning float-right mr-1">Modify</a>
			</form>
		</div>
	</div>
		
	
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary float-left"><i class="fa fa-copy"></i> Files</h6>
		</div>
		<div class="card-body">
			<div class="uploadResult">
				<ul class="list-group list-group-horizontal">
				</ul>
			</div>
		</div>	
	</div>
		<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary float-left"><i class="fa fa-comments fa-fw"></i> Reply</h6>
			<button id = "addReplyBtn" class="btn btn-primary float-right">New Reply</button>
		</div>
		<div class="card-body">
			<ul class="list-group chat">
				<!-- <li class="list-group-item">
					<div class="header">
						<strong>user00</strong> 
						<small class="float-right">2021-04-12 12:37</small>
					</div>
					<p class="mt-2"> Good Job <br> Good GGG <br> ddddd</p>
				</li> -->
			</ul>
				<!--<button id="btnShowMore" class="btn btn-primary btn-block my-4">더보기</button> -->
				<div class="reply-footer">
			</div>
		</div>
	</div>
</div>
 <!-- Result Modal-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">REPLY MODAL</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
            <form method="post" class="needs-validation" novalidate>
				<div class="form-group">
					<label for="reply" class="font-weight-bold text-warning">reply</label>
					<input type="text" class="form-control" id="reply" name="reply" required placeholder = "New Reply!!">
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<label for="replyer" class="font-weight-bold text-warning">replyer</label>
					<input type="text" class="form-control" id="replyer" name = "replyer" required placeholder = "replyer">
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<label for="replyDate" class="font-weight-bold text-warning">replyDate</label>
					<input type="text" class="form-control" id="replyDate" name = "replyDate" required placeholder="2021-01-01 13:50">
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
			</form>
            </div>
            <div class="modal-footer">
                <button id = "modalModBtn" class="btn btn-warning btn-sm ac" type="button" data-dismiss="modal">Modify</button>
                <button id = "modalRemoveBtn" class="btn btn-danger btn-sm ac" type="button" data-dismiss="modal">Remove</button>
                <button id = "modalRegBtn" class="btn btn-primary btn-sm ac" type="button" data-dismiss="modal">Register</button>
                <button id = "modalCloseBtn" class="btn btn-secondary btn-sm" type="button" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Result Modal-->
 <div class="modal fade" id="imageModal">
     <div class="modal-dialog modal-xl">
         <div class="modal-content">
             <div class="modal-body text-center">
             	<img>
             </div>
         </div>
     </div>
 </div>
<script>
	// Disable form submissions if there are invalid fields
	(function() {
		'use strict';
		window.addEventListener('load', function() {
			// Get the forms we want to add validation styles to
			var forms = document.getElementsByClassName('needs-validation');
			// Loop over them and prevent submission
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>

<script src="/resources/js/reply.js"></script>
<script>
	var bno = <c:out value="${board.bno}" />;
	var replyUL = $(".chat");
	var pageNum = 1;
	
	showList();
	
	function showList(rno) {
		replyService.getList({bno:bno, rno:rno}, function(list) {
			//댓글 목록 출력
		   console.log(list);
		   
		   //if(page == -1) showList(result.realEnd)
		   if(!list.length) {
			   $("#btnShowMore").prop("disabled", true).text("추가 댓글이 없습니다.");
		   }
		   
		  	var str = "";
		  	for(var i in list) {
		 		str += '<li class="list-group-item" data-rno ="' + list[i].rno + '">';
		 		str += '	<div class="header">';
		 		str += '		<strong>' + list[i].replyer + '</strong>';
		 		str += '		<small class="float-right">' + replyService.displayTime(list[i].replyDate) + '</small>';
		 		str += '	</div>';
		 		str += '	<p class="mt-2">' + list[i].reply + '</p>';
		 		str += '</li>';
		  	}
		  	replyUL.html(replyUL.html() + str);
		  	
		  /* 	// 댓글 페이징
		  	str = '<ul class="pagination float-right mt-4">';
		  	if(result.prev) {
				str += '<li class="paginate_button page-item previous" >';
				str += '	<a class="page-link" href="'+ (result.startPage - 1) + '">Prev</a>';
				str += '</li>';
		  	}
		  	for(var i = result.startPage ; i <= result.endPage; i++) {
		  		var active = result.cri.pageNum == i ? "active" : "";
		  		str += '<li class="paginate_button page-item ' + active + '">';
		  		str += '<a class="page-link" href="' + i + '">' + i + '</a>';
		  		str += '</li>';
		  		
		  	}
		  	if(result.next) {
		  		str += '<li class="paginate_button page-item next" > ';
		  		str += '	<a class="page-link" href="' + (result.endPage + 1) + '">Next</a>';
		  		str += '</li>';
		  	}
			str += '</ul>';
			$(".reply-footer").html(str);
			*/
		})
	}
	$(function(){
		// 등록폼 버튼 이벤트
		$("#addReplyBtn").click(function(){
			$("#myModal").find("input").val("");
			$("#replyDate").closest("div").hide();
			$(".ac").hide().eq(2).show();
			$("#myModal").modal("show");
		})
		
		// 댓글 목록 모달 팝업 이벤트
		$(".chat").on("click", "li", function() {
			var rno = $(this).data("rno");
			console.log(rno);
			replyService.get(rno, function(result) {
				console.log(result);
				$("#reply").val(result.reply);
				$("#replyer").val(result.replyer);
				$("#replyDate").val(replyService.displayTime(result.replyDate)).prop("readonly", true).closest("div").show();
				$("#myModal").data("rno", rno)
				
				$(".ac").show().eq(2).hide();
				$("#myModal").modal("show");
				
			});
		})
		// 등록 적용버튼 이벤트
		$("#modalRegBtn").click(function(){
			var reply = {bno:bno, reply:$("#reply").val(), replyer:$("#replyer").val()};
			console.log(reply);
			replyService.add(reply, function(result){
				alert(result);
				$("#myModal").modal("hide");
				
				showList(-1);
			});
		});
		// 수정 적용버튼 이벤트
		$("#modalModBtn").click(function(){
			var reply = {rno:$("#myModal").data("rno"), reply:$("#reply").val()};
			console.log(reply);
			replyService.update(reply, function(result){
				alert(result);
				$("#myModal").modal("hide");
				
				showList(pageNum);
			});
		});
		// 삭제 적용버튼 이벤트
		$("#modalRemoveBtn").click(function(){
			replyService.remove($("#myModal").data("rno"), function(result){
				alert(result);
				$("#myModal").modal("hide");
				
				showList(pageNum);
			});
		});
		
		// 댓글 페이지 버튼 이벤트
		$(".reply-footer").on("click", "a", function() {
			event.preventDefault();
			
			pageNum = $(this).attr("href");
			showList(pageNum);
		});
		
		// btnShowMore 이벤트
		$("#btnShowMore").click(function(){
			// 마지막 rno 가져오기
			var rno = $(".chat li:last").data("rno")
			// showList() 호출
			showList(rno);
		});
		//스크롤 바닥 감지
		window.onscroll = function(e) {
			console.log(e)
		    //추가되는 임시 콘텐츠
		    //window height + window scrollY 값이 document height보다 클 경우,
		    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		    	// 마지막 rno 가져오기
		        var rno = $(".chat li:last").data("rno");
		        // showList(rno);
		        showList(rno);
		    }
		};
		$.getJSON("/board/getAttachList", {bno:bno}, function(uploadResultArr){
			var str = "";
			for(var i in uploadResultArr) {
				var obj = uploadResultArr[i];
				str += "<li  class='list-group-item'"
				str += " data-filename = '" + obj.fileName
				str += "' data-image = '" + obj.image
				str += "' data-uuid = '" + obj.uuid
				str += "' data-uploadPath = '" + obj.uploadPath
				str += "' >"
				if(!obj.image) {
					str += "<a href='/download?fileName=" + obj.downPath + "'><i class='fas fa-paperclip text-muted'></i>" + obj.fileName + "</a>"
				}
				else {
					str += "<a href='javascript:showImage(\"" + obj.downPath +"\")'>";
					str += "<img src='/display?fileName=" + obj.thumbPath + "'></a>";
				}
				str += "</li>";
			}
			$(".uploadResult ul").html(str);
		})
		
	})
	function showImage(path) {
		$("#imageModal img").attr("src", "/display?fileName=" + path)
		$("#imageModal").modal("show");
	}
	
	
</script>
<!-- /.container-fluid -->
<!-- End of Main Content -->
<jsp:include page="../includes/footer.jsp" />