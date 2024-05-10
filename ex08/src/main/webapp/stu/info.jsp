<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h1>수강신청목록</h1>
	<div id="div_enroll"></div>
</div>
<script id="temp_enroll" type="x-handlebars-template">
	<table class="table table-bordered table-hover">
		<tr class="text-center bg-primary text-white">
			<td class="bg-primary text-white">강좌번호</td>
			<td class="bg-primary text-white">강좌이름</td>
			<td class="bg-primary text-white">강의시간</td>
			<td class="bg-primary text-white">강의실</td>
			<td class="bg-primary text-white">신청인원</td>
			<td class="bg-primary text-white">담당교수</td>
		</tr>
		{{#each .}}
		<tr class="text-center">
			<td>{{lcode}}</td>
			<td><a href="/cou/read?lcode={{lcode}}">{{lname}}</a></td>
			<td>{{hours}}</td>
			<td>{{room}}</td>
			<td>{{persons}}/{{capacity}}</td>
			<td>{{pname}}({{pcode}})</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	let scode="${stu.scode}";
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/enroll/list.json",
			data:{scode},
			dataType:"json",
			success:function(data){
				const temp=Handlebars.compile($("#temp_enroll").html());
				$("#div_enroll").html(temp(data));
			}
		});
	}
</script>