<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article id='message'>  
	<aside>
		<fieldset>
			<c:if test="${ !empty erreur }">
				<p style="color: red;">
					<c:out value="${ erreur }" />
				</p>
			</c:if>
		</fieldset>
	</aside>
</article> 