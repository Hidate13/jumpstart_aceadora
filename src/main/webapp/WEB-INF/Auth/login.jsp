<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../Components/header.jsp">
	<jsp:param value="Sign Up" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main class="align-center" style="min-height: 95vh;">
	<div class="width-limiter">

		<div class="justify-center flex-col error-popup">
			<div class="justify-between">
				<span class="material-icons">error</span>
				<button class="btnAnimation icon material-icons"
					onclick="closeFormError()">close</button>
			</div>
			<p id="error-text" class="pFont text-center">${errorMsg }</p>
		</div>

		<div class="tb-container align-center justify-between">

			<section class="tb-form flex-col">

				<h3 class="form-heading">Log In</h3>
				<form id="registrationForm" class="form-card" autocomplete="off"
					action="${post_url}" method="post">

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <label class="input-group flex-col">Username
						<input id="username" type="text" required name="username"
						placeholder="e.g. JohnDoe01" autocomplete="off" maxlength="16" />
					</label> <label class="input-group flex-col">Password <input
						id="password" type="password" required name="password"
						placeholder="e.g. JohnDoe1" autocomplete="off" maxlength="14" />
					</label>

					<button class="submit-button" type="submit" value="login">Log
						In</button>

					<a class="alt-form-link trans-ease-out" href="/forgot-password">Forgot
						your password?</a>

					<div class="separator pFont">or</div>

					<a class="alt-form-link trans-ease-out" href="/signup"
						style="margin-bottom: 1rem;">Don't have an account?</a>

				</form>
			</section>
			<div class="tb-image disappear">
				<img alt="Registration Graphic" src="graphics/login.svg">
			</div>
		</div>
	</div>
</main>
<script src="js/error-popup.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>