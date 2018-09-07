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
	</aside>
</article> 