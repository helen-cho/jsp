<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade" id="modalReview" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">
					리뷰작성
				</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<textarea rows="10" class="form-control" placeholder="내용을 입력하세요."></textarea>
			</div>
			<div class="text-center mt-3 mb-5">
				<button type="button" class="btn btn-secondary px-5"
					data-bs-dismiss="modal">등록</button>
				<button type="button" class="btn btn-primary px-5">취소</button>
			</div>
		</div>
	</div>
</div>