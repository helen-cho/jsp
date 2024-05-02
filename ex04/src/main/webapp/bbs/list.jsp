<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h1>게시판</h1>
	<div class="text-end mb-2" id="div_write">
		<a href="/bbs/insert" class="btn btn-primary btn-sm">글쓰기</a>
	</div>
	<div id="div_bbs"></div>
</div>
<script id="temp_bbs" type="x-hadlebars-template">
	<table class="table table-striped table-hover">
		<tr>
			<td>ID</td>
			<td>Title</td>
			<td>Writer</td>
			<td>Date</td>
		</tr>
		{{#each .}}
			<tr>
				<td>{{bid}}</td>
				<td><a href="/bbs/read?bid={{bid}}">{{title}}</a></td>
				<td>{{uname}}({{writer}})</td>
				<td>{{bdate}}</td>
			</tr>
		{{/each}}
	</table>
</script>
<script>
	if(uid){
		$("#div_write").show();
	}else{
		$("#div_write").hide();	
	}
	
	let page=1;
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/bbs/list.json",
			dataType:"json",
			success:function(data){
				const temp=Handlebars.compile($("#temp_bbs").html());
				$("#div_bbs").html(temp(data));
			}
		});
	}
</script>





