<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="my-5">
	<div class="text-end mb-5">
		<button class="btn btn-outline-dark px-5" id="insert">리뷰쓰기</button>
	</div>
	<div id="div_review"></div>
	<ul id="pagination" class="pagination justify-content-center pagination-sm"></ul>
</div>
<jsp:include page="modal_review.jsp"/>
<script id="temp_review" type="x-handlebars-template">
	{{#each .}}
		<div class="my-3">
			<div class="row">
				<div class="col" style="font-size:15px;">
					<span style="font-weight:bold;">{{uid}}</span> | 
					<span style="color:gray;">{{revDate}}</span>
				</div>
				<div class="col text-end mb-2" style="{{display uid}}" rid="{{rid}}">
					<button class="btn btn-outline-dark btn-sm update" content="{{content}}">수정</button>
					<button class="btn btn-outline-dark btn-sm delete">삭제</button>
				</div>
			</div>
			<div class="ellipsis content" style="cursor:pointer">
				{{rid}}:{{content}}
			</div>
		</div>
		<hr>
	{{/each}}
</script>
<script>
	Handlebars.registerHelper("display", function(writer){
		if(uid!=writer) return "display:none";
	});
</script>
<script>
	let page=1;
	let size=5;
	let gid1="${param.gid}";
	
	//삭제버튼을 클릭한 경우
	$("#div_review").on("click", ".delete", function(){
		const rid=$(this).parent().attr("rid");
		if(!confirm(rid + "번 리뷰를 삭제하실래요?")) return;
		//삭제하기
	});
	
	//수정버튼을 클릭한 경우
	$("#div_review").on("click", ".update", function(){
		const rid=$(this).parent().attr("rid");
		const content=$(this).attr("content");
		$("#modalReview").modal("show");
		$("#modalReview #content").val(content);
	});
	
	//getData();
	getTotal();
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
	
	function getTotal(){
		$.ajax({
			type:"get",
			url:"/review/total",
			data:{gid: gid1},
			success:function(data){
				const total=parseInt(data);
				if(total > size){
					$("#pagination").show();
					const totalPage=Math.ceil(total/size);
					$("#pagination").twbsPagination("changeTotalPages", totalPage, page);
				}else{
					$("#pagination").hide();
				}
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
		$("#div_review .content").addClass("ellipsis");
		$(this).removeClass("ellipsis");
	});
	
	$('#pagination').twbsPagination({
		totalPages:10, 
		visiblePages: 5, 
		startPage : 1,
		initiateStartPageClick: false, 
		first:'<span><<</span>', 
		prev :'<span><</span>',
		next :'<span>></span>',
		last :'<span>>></span>',
		onPageClick: function (event, clickPage) {
			 page=clickPage; 
			 getData();
		}
	});
</script>