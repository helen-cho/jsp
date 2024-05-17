<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="my-5">
	<div class="text-end">
		<button class="btn btn-outline-dark px-5" id="insert">리뷰쓰기</button>
	</div>
</div>
<jsp:include page="modal_review.jsp"/>
<script>
	$("#insert").on("click", function(){
		if(uid){
			$("#modalReview").modal("show");
		}else{
			const target=window.location.href;
			sessionStorage.setItem("target", target);
			location.href="/user/login";
		}
	});
</script>