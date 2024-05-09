<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<h1>강좌관리</h1>
	<div class="row">
		<div class="col-8 col-md-6">
			<form name="frm">
				<div class="input-group mb-2">
					<select name="key" class="form-select">
						<option value="lname">강좌이름</option>
						<option value="lcode">강좌번호</option>
						<option value="pname">담당교수</option>
						<option value="room">강의실</option>
					</select>
					<input name="word" placeholder="검색어" class="form-control ms-2">
					<button class="btn btn-primary">검색</button>
				</div>
			</form>
		</div>
		<div class="col"></div>
	</div>
	<div id="div_cou"></div>
</div>
<script id="temp_cou" type="x-handlebars-template">
	<table class="table table-bordered table-hover">
		<tr class="text-center">
			<td>강좌번호</td>
			<td>강좌이름</td>
			<td>강의시간</td>
			<td>강의실</td>
			<td>신청인원</td>
			<td>담당교수</td>
		</tr>
		{{#each .}}
		<tr class="text-center">
			<td>{{lcode}}</td>
			<td>{{lname}}</td>
			<td>{{hours}}</td>
			<td>{{room}}</td>
			<td>{{persons}}/{{capacity}}</td>
			<td>{{pname}}({{instructor}})</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	let page=1;
	let size=5;
	let key="lname";
	let word="";
	
	//서브밋될때
	$(frm).on("submit", function(e){
		e.preventDefault();
		page=1;
		key=$(frm.key).val();
		word=$(frm.word).val();
		getData();
	});
	
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/cou/list.json",
			data:{page, size, key, word},
			dataType:"json",
			success:function(data){
				const temp=Handlebars.compile($("#temp_cou").html());
				$("#div_cou").html(temp(data));
			}
		});
	}
</script>












