<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
session_start();
include("conexao.php");

// Recebe os valores
$user_equipe = mysqli_real_escape_string($conexao, trim($_POST['equipe']));
$user_password = mysqli_real_escape_string($conexao, trim($_POST['password']));
$confirm_password = mysqli_real_escape_string($conexao, trim($_POST['confirmPassword']));


if ($user_password !== $confirm_password) {
    $_SESSION['senha_erro'] = "As senhas não coincidem. Por favor, verifique.";
    header('Location: ../pages/doCadastro.php');
    exit;
}

// Verifica se o usuário já existe no banco de dados
$sql = "SELECT COUNT(*) as total FROM equipe_atendimento WHERE equipe = '$user_equipe'";
$result = mysqli_query($conexao, $sql);
$row = mysqli_fetch_assoc($result);

// Se o usuário já existe, exibe uma mensagem de erro
if ($row['total'] > 0) {
    $_SESSION['cadastro_existe'] = "Usuário já existe. Por favor, escolha um nome de equipe diferente.";
    header('Location: ../pages/doCadastro.php');
    exit;
}

// Se o usuário não existe, insere os valores no banco de dados
$sql = "INSERT INTO equipe_atendimento (equipe, senha) VALUES ('$user_equipe', '$user_password')";

if ($conexao->query($sql) === TRUE) {
    $_SESSION['cadastro_sucesso'] = "Cadastro realizado com sucesso. Agora você pode fazer login.";
    $conexao->close();
    header('Location: ../index.html');
    exit;
} else {
    $_SESSION['cadastro_erro'] = "Erro ao cadastrar equipe. Por favor, tente novamente mais tarde.";
    header('Location: ../index.html');
    exit;
}
?>