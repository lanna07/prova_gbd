<?php
function conn() {
    //$cnx = mysqli_connect("localhost", "id10014633_closetf", "projetoweb", "id10014633_web_loja");
	$cnx = mysqli_connect("localhost", "root", "", "gbd");
    if (!$cnx){
        echo mysqli_connect_error();
        die('Deu errado a conexão!');
    }
    return $cnx;
}


//<?php

//function conn() {
//$cnx = mysqli_connect("localhost", "root", "", "web_loja");
  //  if (!$cnx) die('Deu errado a conexao!');
   // return $cnx;
//}