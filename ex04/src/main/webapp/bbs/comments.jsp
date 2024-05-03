<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="card mt-5">
	<div class="card-body">
		<div class="card-header">
			<span id="total"></span>
		</div>
		<div id="div_comments"></div>
		<div id="pagination" class="pagination justify-content-center mt-5"></div>
	</div>
</div>
<script id="temp_comments" type="x-handlebars-template">
	{{#each .}}
		<div class="mb-5"><b>{{cid}}</b>: {{contents}}</div>
	{{/each}}
</script>

<script>
	const bid="${bbs.bid}";
	let page=1;
	let size=3;
	
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





