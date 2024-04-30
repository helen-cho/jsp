<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row justify-content-center">
	<div class="col-10 col-md-8 col-lg-6">
		<h1>마이페이지</h1>
		<div class="card">
			<div class="card-body">
				<div class="mb-3">
					이름: ${user.uname}(${user.uid})
					<button class="btn btn-danger btn-sm ms-5">비밀번호변경</button>
					<hr>
				</div>
				<div class="mb-3">
					주소: ${user.address1} ${user.address2}
					<hr>
				</div>
				<div class="mb-3">
					전화: ${user.phone}
					<hr>
				</div>
				<div>
					가입일: ${user.jdate}
					<hr>
				</div>
				<div class="text-center mt-3">
					<button class="btn btn-success px-5">정보수정</button>
				</div>	
			</div>
		</div>
	</div>
</div>