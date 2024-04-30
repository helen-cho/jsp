<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row justify-content-center">
	<div class="col-10 col-md-8 col-lg-6">
		<h1>마이페이지</h1>
		<div class="card">
			<div class="card-body">
				<div>
					이름: ${user.uname}(${user.uid})
					<button class="btn btn-primary btn-sm ms-3">비밀번호변경</button>
				</div>
			</div>
		</div>
	</div>
</div>