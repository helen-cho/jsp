<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="mt-5 text-end" id="div_insert">
	<textarea id="contents" rows="5" class="form-control" placeholder="댓글 내용을 입력하세요."></textarea>
	<button class="btn btn-primary px-5 mt-2 insert">등록</button>
</div>
<div class="mt-5" id="div_login">
	<button class="btn btn-primary w-100 login">로그인</button>
</div>
<div class="card mt-2">
	<div class="card-header">
		<span id="total"></span>
	</div>
	<div class="card-body">
		<div id="div_comments"></div>
	</div>
</div>
<div id="pagination" class="pagination justify-content-center mt-3"></div>

<script id="temp_comments" type="x-handlebars-template">
	{{#each .}}
		<div class="text-muted">
			<span>{{cdate}}</span>
			<span>{{uname}}({{writer}})</sapn>
		</div>
		<div class="mb-5"><b>{{cid}}</b>: {{contents}}</div>
	{{/each}}
</script>

<script>
	const bid="${bbs.bid}";
	let page=1;
	let size=3;
	
	if(uid){
		$("#div_insert").show();
		$("#div_login").hide();
	}else{
		$("#div_insert").hide();
		$("#div_login").show();
	}
	
	//로그인버튼을 클릭한 경우
	$("#div_login").on("click", ".login", function(){
		sessionStorage.setItem("target", "/bbs/read?bid=" + bid);
		location.href="/user/login";	
	});
	
	//등록버튼을 클릭한 경우
	$("#div_insert").on("click", ".insert", function(){
		const contents=$("#contents").val();
		if(contents==""){
			alert("댓글내용을 입력하세요!");
			$("#contents").focus();
			return;
		}
		$.ajax({
			type:"post",
			url:"/com/insert",
			data:{bid, contents, uid},
			success:function(){
				page=1;
				getTotal();
				contents=$("#contents").val("");
			}
		});
	});
	
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/com/list.json",
			data:{bid, page, size},
			dataType:"json",
			success:function(data){
				const temp=Handlebars.compile($("#temp_comments").html());
				$("#div_comments").html(temp(data));
			}
		});
	}
	
	getTotal();
	function getTotal(){
		$.ajax({
			type:"get",
			url:"/com/total",
			data:{bid},
			success:function(data){
				const totalPage=Math.ceil(data/size);
				$("#pagination").twbsPagination("changeTotalPages", totalPage, page);
				$("#total").html("댓글수:" + data + "건")
			}
		});
	}
	//페이지네이션 출력
	$('#pagination').twbsPagination({
		totalPages:100, 
		visiblePages: 5, 
		startPage : 1,
		initiateStartPageClick: false, 
		first:'<i class="bi bi-chevron-double-left"></i>', 
		prev :'<i class="bi bi-chevron-left"></i>',
		next :'<i class="bi bi-chevron-right"></i>',
		last :'<i class="bi bi-chevron-double-right"></i>',
		onPageClick: function (event, clickPage) {
			 page=clickPage; 
			 getData();
		}
	});
</script>





