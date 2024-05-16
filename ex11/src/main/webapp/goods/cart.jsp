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
			<td>삭제</td>
		</tr>
		{{#each .}}
		<tr class="text-center" gid="{{gid}}">
			<td>{{gid}}</td>
			<td class="text-start">
				<img src="{{image}}" width="50px">
				<a href="/goods/read?gid={{gid}}">{{{title}}}</a>
			</td>
			<td>{{sum price 1}}</td>
			<td>
				<input class="qnt" value="{{qnt}}" size=2>
				<button class="btn btn-success btn-sm update">수정</button>
			</td>
			<td>{{sum price qnt}}</td>
			<td><button class="btn btn-danger btn-sm delete">삭제</button></td>
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
	//각행의 수정버튼을 클릭한 경우
	$("#div_cart").on("click", ".update", function(){
		const qnt=$(this).parent().find(".qnt").val();
		const gid=$(this).parent().parent().attr("gid");
		//alert(uid + ":" + qnt + ":" + gid);
		$.ajax({
			type:"post",
			url:"/cart/update",
			data:{gid, uid, qnt},
			success:function(){
				getData();
			}
		});
	});
	
	//각행의 삭제버튼을 클릭한 경우
	$("#div_cart").on("click", ".delete", function(){
		const gid=$(this).parent().parent().attr("gid");
		if(!confirm(gid + "번 상품을 삭제하실래요?")) return;
		//삭제하기
	});
	
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