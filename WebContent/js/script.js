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
    }).fail(function(){
        document.getElementById('errajax').innerText = "erreur avec AJAX !!!";
    })
}

function refreshPanier()
{
    $.ajax({
        method: "GET",
        url:"refreshpanier"
    }).done(function(){
        document.location.href="/eCommerce/panier";
    }).fail(function(){
        document.getElementById('errajax').innerText = "erreur avec AJAX !!!";
    })
    
}

function codereduction()
{
    var cr = document.getElementById('codereduction').value;
    $.ajax({
        method: "GET",
        url:"codebonus?monbonus="+cr,
        type: "text"
    }).done(function(){
        document.getElementById('codereduction').value = "";
        document.location.href="/eCommerce/panier";
    }).fail(function(){
        document.getElementById('errajax').innerText = "erreur avec AJAX !!!";
    })
}

function deleteWarning()
{
    $.ajax({
        method: "GET",
        url:"deleteWarning",
        type: "text"
    }).fail(function(){
        document.getElementById('errajax').innerText = "erreur avec AJAX !!!";
    })
}

function validationPanier()
{
    $.ajax({
        method: "GET",
        url:"validationpanier",
        type: "text"
    }).done(function(){
        
    }).fail(function(){
        document.getElementById('errajax').innerText = "erreur avec AJAX !!!";
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



