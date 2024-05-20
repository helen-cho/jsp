<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<h1>주문목록</h1>
	<div id="div_purchase"></div>
</div>
<script id="temp_purchase" type="x-handlebars-template">
	<table class="table">
		<tr>
			<td>주문번호</td>
			<td>전화</td>
			<td>배송지</td>
			<td>주문일</td>
			<td>금액</td>
			<td>상태</td>
		</tr>
		{{#each .}}
		<tr>
			<td>{{pid}}</td>
			<td>{{phone}}</td>
			<td>{{address1}} {{address2}}</td>
			<td>{{pdate}}</td>
			<td>{{sum}}</td>
			<td>{{status}}</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/purchase/list.json",
			data:{uid},
			dataType:"json",
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_purchase").html());
				$("#div_purchase").html(temp(data));
			}
		});	
	}
</script>
