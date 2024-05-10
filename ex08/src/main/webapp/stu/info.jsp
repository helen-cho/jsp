<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<h1 class="mt-5">수강신청목록</h1>
	<div class="input-group mb-2">
		<div id="div_cou"></div>
		<button class="btn btn-primary">수강신청</button>
	</div>
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
			<td class="bg-primary text-white">신청일</td>
		</tr>
		{{#each .}}
		<tr class="text-center">
			<td>{{lcode}}</td>
			<td><a href="/cou/read?lcode={{lcode}}">{{lname}}</a></td>
			<td>{{hours}}</td>
			<td>{{room}}</td>
			<td>{{persons}}/{{capacity}}</td>
			<td>{{pname}}({{pcode}})</td>
			<td>{{edate}}</td>
		</tr>
		{{/each}}
	</table>
</script>
<script id="temp_cou" type="x-handlebars-template">
	<select class="form-select">
		{{#each .}}
			<option>
				{{lname}}:{{pname}}&nbsp;&nbsp;
				({{persons}}/{{capacity}})
			</option>
		{{/each}}
	</select>
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
	
	getCou();
	function getCou(){
		$.ajax({
			type:"get",
			url:"/cou/list.json",
			data:{page:1, size:100, key:'lcode', word:''},
			dataType:"json",
			success:function(data){
				const temp=Handlebars.compile($("#temp_cou").html());
				$("#div_cou").html(temp(data));
			}
		});
	}
</script>