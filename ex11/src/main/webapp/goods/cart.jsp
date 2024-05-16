<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h1>장바구니</h1>
	<div id="div_cart"></div>
	<div id="div_total" class="alert alert-primary text-end">합계:</div>
</div>
<script id="temp_cart" type="x-handlebars-template">
	<table class="table table-bordered table-hover">
		<tr class="text-center">
			<td>상품번호</td>
			<td>상품이름</td>
			<td>가격</td>
			<td>수량</td>
			<td>금액</td>
		</tr>
		{{#each .}}
		<tr class="text-center">
			<td>{{gid}}</td>
			<td class="text-start">
				<img src="{{image}}" width="50px">
				<a href="/goods/read?gid={{gid}}">{{{title}}}</a>
			</td>
			<td>{{price}}</td>
			<td>
				<input value="{{qnt}}" size=2>
				<button class="btn btn-success btn-sm">수정</button>
			</td>
			<td>{{sum price qnt}}</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	Handlebars.registerHelper("sum", function(price, qnt){
		const sum=price*qnt;
		return sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	});
</script>
<script>
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/cart/list.json",
			dataType:"json",
			data:{uid},
			success:function(data){
				const temp=Handlebars.compile($("#temp_cart").html());
				$("#div_cart").html(temp(data));
				let total=0;
				$(data).each(function(){
					const price=this.price;
					const qnt=this.qnt;
					const sum=price*qnt;
					total += sum;
				});
				$("#div_total").html("합계:" + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			}
		});
	}
</script>