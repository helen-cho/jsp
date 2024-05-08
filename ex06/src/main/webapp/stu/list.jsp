<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h1>학생관리</h1>
	<div id="div_stu"></div>
</div>
<script id="temp_stu" type="x-handlebars-templage">
	<table class="table table-borderd table-hover">
		<tr>
			<td>학생번호</td>
			<td>학생이름</td>
			<td>학생학과</td>
			<td>학생학년</td>
			<td>생년월일</td>
			<td>지도교수</td>
		</tr>
		{{#each .}}
		<tr>
			<td>{{scode}}</td>
			<td>{{sname}}</td>
			<td>{{sdept}}</td>
			<td>{{year}}학년</td>
			<td>{{birthday}}</td>
			<td>{{pname}}({{advisor}})</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	let page=1;
	let size=5;
	let key="dept";
	let word="";
	
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/stu/list.json",
			dataType:"json",
			data:{page, size, key, word},
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_stu").html());
				$("#div_stu").html(temp(data));
			}
		});
	}
</script>