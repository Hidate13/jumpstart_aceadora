<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<jsp:include page="../Components/nav-bar.jsp">
	<jsp:param value="Products" name="HTMLtitle" />
</jsp:include>

<div class="page-divider"></div>

<main>
	<div class="width-limiter" style="padding: 0rem 2rem;">

		<div class="align-center success-popup">
			<span class="material-icons">done</span>
			<p id="error-text" class="pFont success-text">${successMsg }</p>
			<button class="btnAnimation icon material-icons"
				onclick="closeSuccess()">close</button>
		</div>

		<sec:authorize access="hasAnyRole('Admin','Staff')">
			<div class="selection-wrapper">
				<sec:authorize access="hasRole('Admin')">
					<button onclick="window.location.href='user-management'">User-Management</button>
				</sec:authorize>
				<button class="default" onclick="window.location.href='products'">Product-Management</button>
				<button onclick="window.location.href='categories'">Categories</button>
				<button onclick="window.location.href='add-product'">Add a
					New Product</button>
				<!-- <button>In-store Pickups</button>
				<button>Delivery Orders</button> -->
			</div>
		</sec:authorize>
		<div class="w3-row">
			<div class="w3-col w3-container m3 l2">
				<jsp:include page="../Components/category-selection.jsp"></jsp:include>
			</div>
			<div class="w3-col w3-container m9 l10">
				<section class="product-list">

					<c:if test="${not empty products }">
						<c:forEach items="${products }" var="p" varStatus="item">
							<c:if test="${p.stock > 0}">
								<div class="product-card">
									<a class="card-img-wrapper" href="/product-details?pId=${p.id}">
										<img alt="${p.photos }" src="${p.photoImagePath }"
										width="220 px">
									</a>
									<h3>${p.name }</h3>
									<p class="price">&dollar;&nbsp;${p.price}</p>
									<p class="sales">Items sold: ${p.sales }</p>

									<sec:authorize access="hasAnyRole('Admin','Staff')">
										<p class="sales">Items in-stock: ${p.stock }</p>
									</sec:authorize>

									<sec:authorize access="hasRole('User')">
										<sf:form action="add_to_cart" method="post"
											modelAttribute="product" target="dummyframe">
											<button class="add-to-cart" type="submit" name="id"
												value="${p.id }" onclick="addToCart()">
												Add to Cart<i class="material-icons">shopping_cart</i>
											</button>
										</sf:form>
									</sec:authorize>

									<sec:authorize access="hasAnyRole('Admin','Staff')">
										<div class="justify-around" style="margin-bottom: 1rem;">
											<button class="action-btn edit"
												onclick="window.location.href='edit-product?pId=${p.id}'"
												style="">
												Edit Details<i class="material-icons">edit</i>
											</button>
											<button id="openDeleteM${item.count }"
												class="action-btn delete">
												Delete<i class="material-icons">delete</i>
											</button>
										</div>
									</sec:authorize>

								</div>
							</c:if>
						</c:forEach>
					</c:if>

					<c:if test="${empty products }">
						<div>
							<h2 class="section-heading text-center">No Products
								Available</h2>
						</div>
					</c:if>

				</section>
			</div>
			<iframe name="dummyframe" id="dummyframe" style="display: none;"></iframe>

		</div>
</main>

<c:forEach items="${products }" var="p" varStatus="item">
	<dialog id="deleteConfM${item.count }" class="modal"
		style="height: fit-content; margin-top: 25vh;">

	<h3 class="modal-heading">
		Confirm<br>Delete Product?
	</h3>

	<button class="action-btn delete btnAnimation" type="button"
		onclick="window.location.href='delete_product?pId=${p.id}'"
		style="margin: 1.5rem auto 0.5rem;">Delete</button>

	<button id="closeDeleteM${item.count }"
		class="material-icons modal-close">close</button>
	</dialog>

	<script>
const deleteConfM${item.count } = document.querySelector("#deleteConfM${item.count }");
const openDeleteM${item.count } = document.querySelector("#openDeleteM${item.count }");
const closeDeleteM${item.count } = document.querySelector("#closeDeleteM${item.count }");

openDeleteM${item.count }.addEventListener("click", () => {
	deleteConfM${item.count }.showModal();
	});

closeDeleteM${item.count }.addEventListener("click", () => {
	deleteConfM${item.count }.close();
	});
</script>
</c:forEach>

<script src="js/success-popup.js"></script>
<script src="js/cart-shake.js"></script>
<jsp:include page="../Components/footer.jsp"></jsp:include>