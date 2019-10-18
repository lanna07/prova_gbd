<?php

require_once "modelo/usuarioModelo.php";

function index() {
    $dados["usuarios"] = pegarTodosUsuarios();
    exibir("usuario/listar", $dados);
}

function adicionar() {
    if (ehPost()) {
        $nome= $_POST["nome"];
        $logradouro = $_POST["logradouro"];
        $numero = $_POST["numero"];
        $complemento = $_POST["complemento"];
        $bairro = $_POST["bairro"];
        $CEP = $_POST["cep"];
        $cidade = $_POST["cidade"];
        $UF = $_POST["uf"];
        $IE = $_POST["ie"];
        
        $msg = adicionarCliente($nome, $logradouro, $numero, $complemento, $bairro, $CEP, $cidade, $UF, $IE);
        echo $msg;
        redirecionar("usuario/index");
    } else {
        exibir("usuario/formulario");
    }
}

function deletar($id) {
    alert(deletarUsuario($id));
    redirecionar("usuario/index");
}

function editar($id) {
    if (ehPost()) {
        $nome = $_POST["nome"];
        $email = $_POST["email"];
        alert(editarUsuario($id, $nome, $email));
        redirecionar("usuario/index");
    } else {
        $dados["usuario"] = pegarUsuarioPorId($id);
        exibir("usuario/formulario", $dados);
    }
}

function visualizar($id) {
    $dados["usuario"] = pegarUsuarioPorId($id);
    exibir("usuario/visualizar", $dados);
}
