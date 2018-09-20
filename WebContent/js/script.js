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
    document.location.href="/eCommerce/codebonus?monbonus="+cr;

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
    document.location.href="/eCommerce/validationpanier";
}



