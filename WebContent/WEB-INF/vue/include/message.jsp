<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article id='message'>  
	<aside>
		<c:if test="${ !empty errjsp}">
			<div class="alert alert-danger border border-danger" role="alert">
				<fieldset>
					<h4 class="alert-heading">
						<c:if test="${ errjsp.errcode != 0 }">
							<c:out value="${ errjsp.errcode }"/>
						</c:if>
						<c:if test="${ !empty errjsp.errtype }">
							<c:out value="${ errjsp.errtype }"/>
						</c:if>
					</h4>
					<c:if test="${ !empty errjsp.errmsg}">
						<p><c:out value="${ errjsp.errmsg }" /></p>
					</c:if>
				</fieldset>
			</div>
		</c:if>
		<c:if test="${ !empty warmsg }">
			<c:forEach var="wmsg" items="${ warmsg }">
				<div class="alert alert-warning alert-dismissible fade show" role="alert">
				  <strong>Attention!!!</strong> <c:out value="${ wmsg }" />
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
				</div>
			</c:forEach>
		</c:if>
		<div id="errajax" style="color: red" ></div>
	</aside>
</article> 