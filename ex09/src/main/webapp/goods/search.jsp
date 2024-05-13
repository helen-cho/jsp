<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<h1>네이버 상품검색</h1>
	<div class="row mb-2">
		<form name="frm" class="col-8 col-md-5">
			<div class="input-group">
				<input name="query" class="form-control" value="쇼파">
				<button class="btn btn-primary">검색</button>
			</div>
		</form>
	</div>
	<div id="div_shop"></div>
	<div class="text-center">
		<button id="prev" class="btn btn-primary">이전</button>
		<span id="page" class="mx-3">1</span>
		<button id="next" class="btn btn-primary">다음</button>
	</div>
	
</div>
<script id="temp_shop" type="x-handlebars-template">
	<table class="table table-bordered table-hover">
		<tr class="text-center">
			<td>아이디</td><td colspan=2>상품명</td><td>상품가격</td><td>저장</td>
		</tr>
		{{#each items}}
		<tr gid="{{productId}}" img="{{image}}" title="{{title}}" brand="{{brand}}" price="{{lprice}}">
			<td>{{productId}}</td>
			<td><img src={{image}} width="50"></td>
			<td><div class="ellipsis">{{{title}}}</div></td>
			<td>{{lprice}}</td>
			<td><button class="btn btn-success insert">저장</button></td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	let query=$(frm.query).val();
	let page=1;
	let size=5;
	
	//저장버튼을 클릭한 경우
	$("#div_shop").on("click", ".insert", function(){
		let tr=$(this).parent().parent();
		let gid=tr.attr("gid");
		let title=tr.attr("title");
		let image=tr.attr("img");
		let price=tr.attr("price");
		let brand=tr.attr("brand");
		console.log(gid, title, image, price, brand);
	});
	
	$("#next").on("click", function(){
		page++;
		getData();
	});
	
	$("#prev").on("click", function(){
		page--;
		getData();
	});
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		page=1;
		query=$(frm.query).val();
		getData();
	});
	
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/goods/search.json",
			dataType:"json",
			data: {query, page, size},
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_shop").html());
				$("#div_shop").html(temp(data));
				
				$("#page").html(page);
				if(page==1) $("#prev").attr("disabled", true);
				else $("#prev").attr("disabled", false);
				if(page==10) $("#next").attr("disabled", true);
				else $("#next").attr("disabled", false);
			}
		});
	}
</script>