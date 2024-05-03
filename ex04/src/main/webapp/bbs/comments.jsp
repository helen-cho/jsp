<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="card mt-5">
	<div class="card-body">
		<div id="div_comments"></div>
	</div>
</div>
<script id="temp_comments" type="x-handlebars-template">
	{{#each .}}
		<div class="mb-5"><b>{{cid}}</b>: {{contents}}</div>
	{{/each}}
</script>

<script>
	const bid="${bbs.bid}";
	let page=1;
	let size=3;
	
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/com/list.json",
			data:{bid, page, size},
			dataType:"json",
			success:function(data){
				const temp=Handlebars.compile($("#temp_comments").html());
				$("#div_comments").html(temp(data));
			}
		});
	}
</script>





