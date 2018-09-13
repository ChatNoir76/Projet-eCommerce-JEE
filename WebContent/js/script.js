function voirProduit(id)
{
    document.location.href="/eCommerce/produit?idProduit="+id;
}

function ajoutPanier(id)
{
    document.location.href="/eCommerce/ajoutPanier?idProduit="+id;
}

function modificationQuantityPanier(idProduit, qty)
{
    // document.location.href="/eCommerce/modifierqty?idProduit="+idProduit+"&produitQty="+qty
    
    $.ajax({
        method: "GET",
        url:"modifierqty?idProduit="+idProduit+"&produitQty="+qty
    })
}

function refreshPanier()
{
    $.ajax({
        method: "GET",
        url:"refreshpanier"
    }).done(function(){
        document.location.href="/eCommerce/panier";
    })
    
}

function codereduction()
{
    var cr = document.getElementById('codereduction').value;
    $.ajax({
        method: "GET",
        url:"codebonus?monbonus="+cr
    }).done(function(){
        cr.value = "";
        document.location.href="/eCommerce/panier";
    })
}

$(document).ready(function()
{
    /*
    $.ajax({
        method: "GET",
        url:"ajoutPanier?idProduit="+id
    })
    */
	
});



