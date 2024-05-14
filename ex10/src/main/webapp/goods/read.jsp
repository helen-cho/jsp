<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	#info img {
		border-radius: 10px;
	}
</style>
<div>
	<div class="row my-5" id="info">
		<div class="col-md-6 mb-5">
			<img src="${goods.image}" width="80%">
		</div>
		<div class="col">
			<h4>${goods.title}</h4>
			<hr>
			<div class="mb-3">가격: <fmt:formatNumber value="${goods.price}" pattern="#,###원"/></div>
			<div class="mb-3">브랜드: ${goods.brand}</div>
			<div class="mb-3">등록일: ${goods.regDate}</div>
			<div class="mb-3">배송정보: 한진택배</div>
			<div class="mb-3">카드할인: 하나카드 무이자 최대12개월</div>
			<div class="my-5">
				<button class="px-5 btn btn-warning">바로구매</button>
				<button class="px-5 btn btn-success">장바구니</button>
			</div>
		</div>
	</div>
</div>