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
		<section id='cadreBlanc' class='cadreBlanc'>
			<article class="formulaire">
				<form method="post" action="connexion">

					<fieldset>
						<legend>Connexion</legend>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="email">Adresse email<span class="text-danger">*</span><br /> </label> 
								<input class="form-control" type="text" id="email" name="email" value="" maxlength="60" required/>
							</div>
							<div class="form-group col-md-12">
								<label for="motdepasse">Mot de passe<span class="text-danger">*</span><br /></label> 
								<input class="form-control" type="password" id="motdepasse" name="motdepasse" value="" maxlength="20" required/>
							</div>
							</div>
								<input type="submit" value="Connexion" class="btn btn-dark form_submit" />
								<input type="hidden" id="formulaire" name="formulaire" value="form_clientconnexion">
							<div>
							</div>
							<div>
								<a href="/eCommerce/inscription">créer un compte</a>
							</div>
					</fieldset>

				</form>
			</article>
		</section>
	</section>
</body>
</html>