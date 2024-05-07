<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	table .title {
		background:gray;
		color:white;
		text-align:center;
	}
</style>
<div class="row">
	<div class="col">
		<div><h1>교수정보</h1></div>
		<table class="table table-bordered">
			<tr>
				<td class="title">교수번호</td>
				<td>${pro.pcode}</td>
				<td class="title">교수이름</td>
				<td>${pro.pname}</td>
				<td class="title">교수학과</td>
				<td>${pro.dept}</td>
			</tr>
			<tr>
				<td class="title">임용일자</td>
				<td>${pro.hiredate}</td>
				<td class="title">교수직급</td>
				<td>${pro.title}</td>
				<td class="title">교수급여</td>
				<td>${pro.salary}</td>
			</tr>
		</table>
		<div class="text-center my-5">
			<button class="btn btn-primary me-3">교수수정</button>
			<button class="btn btn-danger">교수삭제</button>
		</div>
	</div>
</div>