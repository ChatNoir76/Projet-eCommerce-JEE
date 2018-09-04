function voirProduit(id)
{
    document.location.href="/eCommerce/produit?idProduit="+id;
}

function ajoutPanier(id)
{
    alert("ajout panier produit n°" + id);
    document.location.href="/eCommerce/ajoutPanier?idProduit="+id;
}

$(document).ready(function()
{

    
	
});



