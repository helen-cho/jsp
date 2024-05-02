<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h1>게시글정보</h1>
	<div class="card">
		<div class="card-body">
			<div>${bbs.title}</div>
			<hr>
			<div>${bbs.contents}</div>
		</div>
		<div class="card-footer text-muted text-end" style="font-size:12px;">
			<span>${bbs.bdate}</span>
			<span>${bbs.uname}(${bbs.writer})</span>
		</div>
	</div>
</div>