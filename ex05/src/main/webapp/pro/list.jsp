<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h1>교수관리</h1>
	<div id="div_pro"></div>
</div>
<script id="temp_pro" type="x-handlebars-template">
	<table class="table table-border">
		<tr>
			<td>교수번호</td>
			<td>교수이름</td>
			<td>교수학과</td>
			<td>교수직급</td>
			<td>교수급여</td>
			<td>임용일자</td>
		</tr>
		{{#each .}}
		<tr>
			<td>{{pcode}}</td>
			<td>{{pname}}</td>
			<td>{{dept}}</td>
			<td>{{title}}</td>
			<td>{{salary}}</td>
			<td>{{hiredate}}</td>
		</tr>
		{{/each}}
	</table>
</script>

<script>
	let page=1;
	let size=4;
	let key="pcode";
	let word="";
	
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/pro/list.json",
			data:{page, size, key, word},
			dataType:"json",
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_pro").html());
				$("#div_pro").html(temp(data));
			}
		});
	}
</script>