<?php
// Configuração do banco de dados
$servername = "127.0.0.1";
$username = "seu_usuario";
$password = "sua_senha";
$dbname = "gui_e_heitor";
$port = "3307"; // Porta do seu MySQL/MariaDB, ajuste conforme necessário

// Criar conexão
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Verificar a conexão
if ($conn->connect_error) {
    die("Conexão falhou: " . $conn->connect_error);
}

// Consulta SQL
$sql = "
    SELECT *
    FROM acompanhante
    JOIN anamnese_emerg ON acompanhante.ID_ACOMPANHA = anamnese_emerg.fk_acompanhante
    JOIN anamnese_gest ON acompanhante.ID_ACOMPANHA = anamnese_gest.fk_acompanhante
    JOIN avaliacao ON acompanhante.ID_ACOMPANHA = avaliacao.fk_acompanhante
    JOIN cinematica ON acompanhante.ID_ACOMPANHA = cinematica.fk_acompanhante
    JOIN deixados_hospital ON acompanhante.ID_ACOMPANHA = deixados_hospital.fk_acompanhante
    JOIN equipe_atendimento ON acompanhante.ID_ACOMPANHA = equipe_atendimento.fk_acompanhante
    JOIN info_finais ON acompanhante.ID_ACOMPANHA = info_finais.fk_acompanhante
    JOIN localiza_trauma ON acompanhante.ID_ACOMPANHA = localiza_trauma.fk_acompanhante
    JOIN materiais ON acompanhante.ID_ACOMPANHA = materiais.fk_acompanhante
    JOIN ocorrencia ON acompanhante.ID_ACOMPANHA = ocorrencia.fk_acompanhante
    JOIN paciente ON acompanhante.ID_ACOMPANHA = paciente.fk_acompanhante
    JOIN problem_suspeito ON acompanhante.ID_ACOMPANHA = problem_suspeito.fk_acompanhante
    JOIN proced_efetuados ON acompanhante.ID_ACOMPANHA = proced_efetuados.fk_acompanhante
    JOIN sinais_sintomas ON acompanhante.ID_ACOMPANHA = sinais_sintomas.fk_acompanhante
    JOIN sinais_vitais ON acompanhante.ID_ACOMPANHA = sinais_vitais.fk_acompanhante
    JOIN user_detalhes ON acompanhante.ID_ACOMPANHA = user_detalhes.fk_acompanhante
    JOIN usuario ON acompanhante.ID_ACOMPANHA = usuario.fk_acompanhante
";

// Executar a consulta
$result = $conn->query($sql);

// Verificar se a consulta foi bem-sucedida
if ($result) {
    // Armazenar o resultado em uma variável (por exemplo, array)
    $resultArray = array();

    while ($row = $result->fetch_assoc()) {
        $resultArray[] = $row;
    }

    // Agora $resultArray contém os dados combinados de todas as tabelas
    // Faça o que quiser com os dados aqui

    // Fechar a conexão
    $conn->close();
} else {
    echo "Erro na consulta: " . $conn->error;
}

// Se precisar usar $resultArray em outro arquivo, você pode salvá-lo em um arquivo, por exemplo, usando a função serialize
file_put_contents('resultArray.dat', serialize($resultArray));
?>
