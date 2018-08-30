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

						<div class="form-group form_ligne">
							<label class="form_label" for="email">Adresse email</label> 
							<input class="form_input" type="text" id="email" name="email" value="" maxlength="60" required/>
							<span class="form_requis">*</span><br /> 
						</div>
						<div class="form-group form_ligne">
							<label class="form_label" for="motdepasse">Mot de passe</label> 
							<input class="form_input" type="password" id="motdepasse" name="motdepasse" value="" maxlength="20" required/>
							<span class="form_requis">*</span><br /> 
						</div>
						<input type="submit" value="Connexion" class="btn btn-primary form_submit" />
						<input type="hidden" id="formulaire" name="formulaire" value="form_clientconnexion">
					</fieldset>

				</form>
			</article>
		</section>
	</section>
</body>
</html>