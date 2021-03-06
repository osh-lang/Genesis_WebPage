<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<jsp:include page="../includes/header.jsp"></jsp:include>

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
			<h6 class="m-0 font-weight-bold text-primary">Board Register</h6>
		</div>
		<div class="card-body">
			<form method="post" class="needs-validation" novalidate>
				<div class="form-group">
					<label for="title" class="font-weight-bold text-warning">title</label>
					<input type="text" class="form-control" id="title"
						placeholder="게시글 제목을 입력하세요." name="title" required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<label for="title" class="font-weight-bold text-warning">content</label>
					<textarea class="form-control" rows="10" class="form-control"
						id="content" placeholder="게시글 내용을 입력하세요." name="content" required></textarea>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<label for="writer" class="font-weight-bold text-warning">writer</label>
					<input type="text" class="form-control" id="writer"
						placeholder="작성자를 입력하세요." name="writer" required readonly value='<sec:authentication property="principal.username"/>'>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<button type="reset" class="btn btn-outline-secondary float-right">reset</button>
				<button type="submit" class="btn btn-outline-primary float-right mr-1">submit</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
		<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">File Attach</h6>
		</div>
		<div class="card-body">
			<div class="uploadDiv">
				<input id="files" type="file" name="files" multiple>
			</div>
			
			<div class="uploadResult">
				<ul class="list-group list-group-horizontal">
				</ul>
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
						event.preventDefault();// submit prevent
				}, false);
			});
		}, false);
	})();
</script>
<script>
	
		var regex = /(.*?)\.(exe|sh|jsp|php|jar)/gi;
		var maxSize = 1024 * 1024 * 5;
		var cloneObj = $(".uploadDiv").clone();
		var uploadResult = $(".uploadResult ul");
		
		console.log(cloneObj);
		$(".uploadDiv").on("change", "#files", function(){
			var formData = new FormData();
			var files = $("#files")[0].files;
			console.log(files);
			
			for(var i in files) {
				if(!checkExtension(files[i].name, files[i].size)) {
					$(".uploadDiv").html(cloneObj.html());
					return false;
				}
				formData.append("files", files[i]);
			}
			console.log(formData);
			$.ajax({
				url : '/uploadAction',
				type : 'post',
				data : formData,
				dataType : 'json',
				processData : false,
				contentType : false,
				success : function(result) {
					console.log(result);
					showUploadedFile(result);
					$(".uploadDiv").html(cloneObj.html());
				}
			});
		})
		function checkExtension(name, size){
			if(size >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(name)) {
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}
		function showUploadedFile(uploadResultArr) {
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
				str += "<i class='fas fa-times text-danger removeFileBtn'></i>"
				str += "</li>";
			}
			uploadResult.append(str);
		}
		function showImage(path) {
			$("#imageModal img").attr("src", "/display?fileName=" + path)
			$("#imageModal").modal("show");
		}
		$(".uploadResult").on("click",  ".removeFileBtn", function() {
			alert("삭제");
			var $li = $(this).closest("li");
			var data = {
				fileName : $li.data("filename"),
				image : $li.data("image"),
				uuid : $li.data("uuid"),
				uploadPath : $li.data("uploadpath")
			}
			console.log(data);
			console.log(JSON.stringify(data));
			$.ajax({
				url : "/deleteFile",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success : function(result) {
					alert(result);
					$li.remove();
				}
			});
		});
		
		$("button[type='submit']").click(function(){
			event.preventDefault();
			var str = "";
			var attrs = ["fileName", "uuid", "uploadPath", "image"];
			$(".uploadResult li").each(function(i, it) {
				for(var j in attrs) {
					var tmp = '<input type="hidden" name="attachList[' + i + '].';
					tmp +=  attrs[j] + '" value="' + $(it).data(attrs[j].toLowerCase()) + '">';
					console.log(tmp);
					str += tmp;
				}				
			});
			console.log(str);
/* 			$(this).closest("form").append(str);
			console.log($(this).closest("form").serialize()); */
			$(this).closest("form").append(str).submit();
		})
	</script>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<jsp:include page="../includes/footer.jsp"></jsp:include>