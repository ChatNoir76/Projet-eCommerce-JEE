<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formulaire de connexion</title>
</head>
<body>
	<section id='contenu' class='contenu'>
		<nav></nav>
		<section id='cadreBlanc' class='cadreBlanc'>
			<aside>
				<c:if test="${ !empty erreur }">
					<p style="color: red;">
						<c:out value="${ erreur }" />
					</p>
				</c:if>
			</aside>
			<article class="formulaire">
				<form method="post" action="connexion">

					<fieldset>

						<legend>Connexion</legend>

						<p>Vous pouvez vous connecter via ce formulaire.</p>

						<div class="form_ligne">
							<label class="form_label" for="email">Adresse email <span class="form_requis">*</span></label> 
							<input class="form_input" type="text" id="email" name="email" value="" maxlength="60" required/> <br /> 
						</div>
						<div class="form_ligne">
							<label class="form_label" for="motdepasse">Mot de passe <span class="form_requis">*</span></label> 
							<input class="form_input" type="password" id="motdepasse" name="motdepasse" value="" maxlength="20" required/><br /> 
						</div>
						<input type="submit" value="Connexion" class="form_submit" />
						<input type="hidden" id="formulaire" name="formulaire" value="client_connexion">
					</fieldset>

				</form>
			</article>
		</section>
	</section>
</body>
</html>