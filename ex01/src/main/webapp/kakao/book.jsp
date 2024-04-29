<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h1>도서검색</h1>
	<div id="div_book" class="row"></div>
</div>
<script id="temp_book" type="x-handlebars-template">
	{{#each documents}}
		<div class="col-6 col-md-4 col-lg-2">
			<div class="card">
				<div class="card-body">
					<img src="{{thumbnail}}">
				</div>
				<div class="card-footer">
					<div class="ellipsis">{{title}}</div>
				</div>
			</div>
		</div>
	{{/each}}
</script>
<script>
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"https://dapi.kakao.com/v3/search/book?target=title",
			headers:{"Authorization":"KakaoAK 54b6688221dead45827042df7e297c2d"},
			dataType:"json",
			data:{query:"JSP", page:1, size:6},
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_book").html());
				$("#div_book").html(temp(data));
			}
		});
	}
</script>