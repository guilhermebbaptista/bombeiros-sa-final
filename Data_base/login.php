<?php
session_start();
include("conexao.php");

$user_equipe = mysqli_real_escape_string($conexao, trim($_POST['equipe']));
$user_password = mysqli_real_escape_string($conexao, trim(($_POST['password'])));

$sql = "SELECT * FROM equipe_atendimento WHERE equipe = '$user_equipe' AND senha = '$user_password'";
$result = mysqli_query($conexao, $sql);
$row = mysqli_fetch_assoc($result);
$count = mysqli_num_rows($result);

if ($count == 1) {
    // As credenciais são válidas, o usuário está autenticado
    $_SESSION['usuario_id'] = $row['id']; // Salvar o ID do usuário na sessão, se necessário
    $_SESSION['usuario_nome'] = $row['name']; // Salvar o nome do usuário na sessão, se necessário

    header('Location: ../pages/ocorrencia.html'); // Redirecionar para a página do painel do usuário
    exit;
} else {
    $_SESSION['login_invalido'] = true; // Credenciais inválidas
    header('Location: ../pages/cadastro.html'); // Redirecionar de volta para a página de login
    exit;
}


$conexao->close();
?>