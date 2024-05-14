<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.brand {
		font-size:12px;
	}
	#div_shop img {
		border-radius:10px;
	}
</style>
<div class="my-5">
	<div id="div_shop" class="row"></div>
</div>
<script id="temp_shop" type="x-handlebars-template">
	{{#each .}}
		<div class="col-2 col-md-4 col-lg-2 mb-5">
			<div class="mb-2"><img src="{{image}}" width="90%"></div>
			<div class="brand">{{brand}}</div>
			<div class="ellipsis">{{title}}</div>
			<div><b>{{price}}원</b></div>
		</div>
	{{/each}}
</script>
<script>
	let size=12;
	let page=1;
	let word="";
	
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/goods/list.json",
			dataType:"json",
			data:{size, page, word},
			success:function(data){
				const temp=Handlebars.compile($("#temp_shop").html());
				$("#div_shop").html(temp(data));
			}
		});
	}
</script>