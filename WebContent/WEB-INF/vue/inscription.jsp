<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inscription</title>
</head>
<body>
	<div class="container">
		<fieldset>
		<legend>Formulaire d'inscription</legend>
			<form method="post" action="connexion" style="padding: 20px;background-color: rgba(60,75,75,0.6)">
			<div class="form-row">
			    <div class="form-group col-md-5">
			      <label for="inputNom"><span class="text-danger">*</span>Nom</label>
			      <input type="text" class="form-control" id="inputNom" placeholder="Nom" required />
			    </div>
			    <div class="form-group col-md-5">
			      <label for="inputPrenom"><span class="text-danger">*</span>Prenom</label>
			      <input type="password" class="form-control" id="inputPrenom" placeholder="Prenom" required />
			    </div>
			    <div class="form-group col-md-2">
			      <label for="inputSexe">Sexe</label>
			      <select id="inputSexe" class="form-control">
			        <option selected>Non Renseigné</option>
			        <option>Masculin</option>
			        <option>Feminin</option>
			      </select>
			    </div>
			  </div>
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputEmail"><span class="text-danger">*</span>Email</label>
			      <input type="email" class="form-control" id="inputEmail" placeholder="Email" required />
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputPassword"><span class="text-danger">*</span>Password</label>
			      <input type="password" class="form-control" id="inputPassword" placeholder="Password" required />
			    </div>
			  </div>
			  <div class="form-row">
			    <div class="form-group col-md-2">
			      <label for="inputTel">Numéro de téléphone</label>
			      <input type="text" class="form-control" id="inputTel" placeholder="+033612345678">
			    </div>
			    <div class="form-group col-md-2">
			      <label for="inputNaissance">Date de naissance</label>
			      <input type="date" class="form-control" id="inputNaissance">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputAddress"><span class="text-danger">*</span>Addresse</label>
			    <input type="text" class="form-control" id="inputAddress" placeholder="numéro et nom de la rue" required />
			  </div>
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputCity"><span class="text-danger">*</span>Ville</label>
			      <input type="text" class="form-control" id="inputCity" placeholder="nom de la ville" required />
			    </div>
			    <div class="form-group col-md-3">
			      <label for="inputCP"><span class="text-danger">*</span>Code Postal</label>
			      <input type="text" class="form-control" id="inputCP" placeholder="code postal" required />
			    </div>
			    <div class="form-group col-md-3">
			      <label for="inputPays"><span class="text-danger">*</span>Pays</label>
			      <input type="text" class="form-control" id="inputPays" placeholder="France" readonly required />
			    </div>
			  </div>
			  <div class="form-group">
			      <label for="Textarea">Commentaire</label>
			      <textarea class="form-control" id="Textarea" rows="3" placeholder="commentaire lors de la livraison"></textarea>
			  </div>
			  <input type="hidden" id="formulaire" name="formulaire" value="form_clientinscription">
			  <button type="submit" class="btn btn-primary">Enregistrer</button>
			</form>
		</fieldset>
	</div>
</body>
</html>