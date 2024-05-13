<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<h1>네이버 상품검색</h1>
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
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/goods/search.json",
			dataType:"json",
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_shop").html());
				$("#div_shop").html(temp(data));
			}
		});
	}
</script>