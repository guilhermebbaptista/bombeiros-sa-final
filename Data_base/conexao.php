<?php
// Definição das constantes de conexão com o banco de dados
define('HOST', 'sql311.infinityfree.com');
define('USUARIO', 'if0_35300810');
define('SENHA', 'fIaWEG2mooKoLT');
define('DB', 'if0_35300810_ultimo_banco');
 
// Conexão com o banco de dados utilizando as constantes definidas
$conexao = mysqli_connect(HOST, USUARIO, SENHA, DB) or die ('Não foi possível conectar');
?>