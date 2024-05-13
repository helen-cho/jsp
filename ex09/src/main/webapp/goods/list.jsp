<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h1>상품목록</h1>
	<div id="div_shop"></div>
</div>
<script id="temp_shop" type="x-handlebars-template">
	<table class="table table-bordered table-hover">
		<tr class="text-center">
			<td><input type="checkbox" id="all"></td>
			<td>아이디</td><td colspan=2>상품명</td><td>상품가격</td><td>삭제</td>
		</tr>
		{{#each .}}
		<tr>
			<td class="text-center"><input type="checkbox" class="chk"></td>
			<td>{{gid}}</td>
			<td><img src={{image}} width="50"></td>
			<td>
				<div class="ellipsis">{{{title}}}</div>
				<div>{{regDate}}</div>
			</td>
			<td>{{price}}</td>
			<td><button class="btn btn-danger delete">삭제</button></td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/goods/list.json",
			dataType:"json",
			success:function(data){
				const temp=Handlebars.compile($("#temp_shop").html());
				$("#div_shop").html(temp(data));
			}
		});
	}
</script>