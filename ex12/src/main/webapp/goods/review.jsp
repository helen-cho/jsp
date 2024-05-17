<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="my-5">
	<div class="text-end">
		<button class="btn btn-outline-dark px-5" id="insert">리뷰쓰기</button>
	</div>
	<div id="div_review"></div>
</div>
<jsp:include page="modal_review.jsp"/>
<script id="temp_review" type="x-handlebars-template">
	{{#each .}}
		<div class="mb-3">
			<div style="font-size:15px;">
				<span style="font-weight:bold;">{{uid}}</span> | 
				<span style="color:gray;">{{revDate}}</span>
			</div>
			<div class="ellipsis content" style="cursor:pointer">
				{{rid}}:{{content}}
			</div>
		</div>
		<hr>
	{{/each}}
</script>

<script>
	let page=1;
	let size=5;
	let gid1="${param.gid}";
	
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/review/list.json",
			dataType:"json",
			data:{ page, size , gid:gid1},
			success:function(data){
				const temp=Handlebars.compile($("#temp_review").html());
				$("#div_review").html(temp(data));
			}
		});
	}
	
	$("#insert").on("click", function(){
		if(uid){
			$("#modalReview").modal("show");
		}else{
			const target=window.location.href;
			sessionStorage.setItem("target", target);
			location.href="/user/login";
		}
	});
	
	$("#div_review").on("click", ".content", function(){
		$(this).toggleClass("ellipsis");
	});
</script>