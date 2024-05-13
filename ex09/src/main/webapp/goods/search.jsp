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
</div>
<script id="temp_shop">
	<table class="table table-bordered table-hover">
		<tr class="text-center">
			<td>아이디</td><td colspan=2>상품명</td><td>상품가격</td>
		</tr>
		{{#each items}}
		<tr>
			<td>{{productId}}</td>
			<td><img src={{image}} width="50"></td>
			<td><div class="ellipsis">{{{title}}}</div></td>
			<td>{{lprice}}</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	let query=$(frm.query).val();
	let page=1;
	let size=5;
	
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
			}
		});
	}
</script>