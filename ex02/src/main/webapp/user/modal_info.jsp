<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#modalInfo {
	top: 30%;
}
</style>
<!-- Modal -->
<div class="modal fade" id="modalInfo" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">정보수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<input class="form-control mb-3" placeholder="이름" value="${user.uname}">
				<input class="form-control mb-3" placeholder="전화번호" value="${user.phone}">
				<div class="input-group mb-1">
					<input class="form-control" value="${user.address1}">
					<button class="btn btn-primary">검색</button>
				</div>
				<input class="form-control" placeholder="상세주소" value="${user.address2}">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save</button>
			</div>
		</div>
	</div>
</div>