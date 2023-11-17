-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/10/2023 às 03:30
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ab_bombeiros`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acompanhante`
--

CREATE TABLE `acompanhante` (
  `ID_ACOMPANHA` int(11) NOT NULL,
  `NOME_ACOMPANHA` varchar(60) NOT NULL,
  `IDADE_ACOMPANHA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `anamnese_emerg`
--

CREATE TABLE `anamnese_emerg` (
  `id_anamnese_emerg` int(11) NOT NULL,
  `sinais_e_sintomas` varchar(100) NOT NULL,
  `outras_vezes` varchar(10) NOT NULL,
  `quando_aconte` varchar(20) NOT NULL,
  `problema_saude` varchar(10) NOT NULL,
  `quais_problem` varchar(100) NOT NULL,
  `usa_medicacao` varchar(40) NOT NULL,
  `horario_medicacao` varchar(40) NOT NULL,
  `quais_medicacoes` varchar(50) NOT NULL,
  `alergico` varchar(10) NOT NULL,
  `qual_alergia` varchar(100) NOT NULL,
  `ingeriu_alimento` varchar(10) NOT NULL,
  `hora_ingeriu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `anamnese_gest`
--

CREATE TABLE `anamnese_gest` (
  `id_anamnese_gest` int(11) NOT NULL,
  `pre_natal` varchar(10) NOT NULL,
  `periodo_gest` varchar(40) NOT NULL,
  `nome_medico` varchar(60) NOT NULL,
  `complicacao` varchar(10) NOT NULL,
  `primeiro_filho` varchar(10) NOT NULL,
  `quantos` int(11) NOT NULL,
  `contracoes` varchar(10) NOT NULL,
  `horario_contracoes` time NOT NULL,
  `intervalo_contracoes` int(11) NOT NULL,
  `duracao_contracoes` varchar(20) NOT NULL,
  `pressao_ou_evacuar` varchar(10) NOT NULL,
  `ruptura_bolsa` varchar(10) NOT NULL,
  `inspecao_visual` varchar(10) NOT NULL,
  `parto_realizado` varchar(10) NOT NULL,
  `sexo_bebe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `ID_AVALIACAO` int(11) NOT NULL,
  `MAIOR_CINCO` varchar(10) NOT NULL,
  `total_gcs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cinematica`
--

CREATE TABLE `cinematica` (
  `id_cinematica` int(11) NOT NULL,
  `avaliacao_cinematica` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `deixados_hospital`
--

CREATE TABLE `deixados_hospital` (
  `id_deixados_hospital` int(11) NOT NULL,
  `material` varchar(30) NOT NULL,
  `deixados_tamanho` varchar(1) NOT NULL,
  `deixados_quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe_antendimento`
--

CREATE TABLE `equipe_antendimento` (
  `ID_EQUIPE` int(11) NOT NULL,
  `EQUIPE` varchar(50) NOT NULL,
  `SENHA` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `info_finais`
--

CREATE TABLE `info_finais` (
  `id_info_finais` int(11) NOT NULL,
  `usb` int(11) NOT NULL,
  `ir` int(11) NOT NULL,
  `ps` int(11) NOT NULL,
  `desp` int(11) NOT NULL,
  `n_ocorr` int(11) NOT NULL,
  `h.ch` int(11) NOT NULL,
  `sia_sus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `localiza_trauma`
--

CREATE TABLE `localiza_trauma` (
  `LOCALIZACAO_TRAUMA` int(11) NOT NULL,
  `ADULTO_OU_CRIANCA` varchar(10) NOT NULL,
  `LOCAL_TRAUMA` int(11) NOT NULL,
  `LOCALIZA_APROX` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `materiais`
--

CREATE TABLE `materiais` (
  `ID_MATERIAL_DESCART` int(11) NOT NULL,
  `MATERIAL` varchar(100) NOT NULL,
  `TAMANHO` varchar(2) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ocorrencia`
--

CREATE TABLE `ocorrencia` (
  `id_ocorrencia` int(11) NOT NULL,
  `data_e_hora` datetime NOT NULL,
  `fk_paciente` int(11) NOT NULL,
  `tipo_ocorrencia` varchar(30) NOT NULL,
  `fk_materiais_descart` int(11) NOT NULL,
  `fk_deixados_hospital` int(11) NOT NULL,
  `obs_importantes` varchar(200) NOT NULL,
  `fk_equipe_atendimento` int(11) NOT NULL,
  `fk_info_finais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `ID_PACIENTE` int(11) NOT NULL,
  `NOME` varchar(80) NOT NULL,
  `RG_CPF` varchar(30) NOT NULL,
  `IDADE` int(11) NOT NULL,
  `FONE` varchar(20) NOT NULL,
  `SEXO` varchar(20) NOT NULL,
  `fk_anamnese_emerg` int(11) NOT NULL,
  `fk_anamnese_gest` int(11) NOT NULL,
  `fk_avaliacao` int(11) NOT NULL,
  `fk_sinais_vitais` int(11) NOT NULL,
  `fk_problem_suspeito` int(11) NOT NULL,
  `fk_localizacao_trauma` int(11) NOT NULL,
  `fk_sinais_sintomas` int(11) NOT NULL,
  `FORMA_CONDUCAO` varchar(20) NOT NULL,
  `VITIMA_ERA` varchar(20) NOT NULL,
  `DECISAO_TRANSP` varchar(30) NOT NULL,
  `fk_proced_efetuados` int(11) NOT NULL,
  `fk_cinematica` int(11) NOT NULL,
  `OBJETIVOS_RECO` varchar(200) NOT NULL,
  `fk_acompanhante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `problem_suspeito`
--

CREATE TABLE `problem_suspeito` (
  `id_problem_suspeito` int(11) NOT NULL,
  `tipo_problem` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `proced_efetuados`
--

CREATE TABLE `proced_efetuados` (
  `ID_RROCED_EFETUADOS` int(11) NOT NULL,
  `PROCEDIMENTOS` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sinais_sintomas`
--

CREATE TABLE `sinais_sintomas` (
  `id_sinais_sinoma` int(11) NOT NULL,
  `sintomas` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sinais_vitais`
--

CREATE TABLE `sinais_vitais` (
  `ID_SINAIS-VITAIS` int(11) NOT NULL,
  `mmHg` varchar(10) NOT NULL,
  `bopm` int(11) NOT NULL,
  `RESPIRACAO` int(11) NOT NULL,
  `SATURACAO` varchar(5) NOT NULL,
  `hgt` int(11) NOT NULL,
  `TEMPERATURA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_detalhes`
--

CREATE TABLE `user_detalhes` (
  `ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `NOME` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `OUTROS` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `SENHA` varchar(255) NOT NULL,
  `PERMISSOES` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acompanhante`
--
ALTER TABLE `acompanhante`
  ADD PRIMARY KEY (`ID_ACOMPANHA`);

--
-- Índices de tabela `anamnese_emerg`
--
ALTER TABLE `anamnese_emerg`
  ADD PRIMARY KEY (`id_anamnese_emerg`);

--
-- Índices de tabela `anamnese_gest`
--
ALTER TABLE `anamnese_gest`
  ADD PRIMARY KEY (`id_anamnese_gest`);

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`ID_AVALIACAO`);

--
-- Índices de tabela `cinematica`
--
ALTER TABLE `cinematica`
  ADD PRIMARY KEY (`id_cinematica`);

--
-- Índices de tabela `deixados_hospital`
--
ALTER TABLE `deixados_hospital`
  ADD PRIMARY KEY (`id_deixados_hospital`);

--
-- Índices de tabela `equipe_antendimento`
--
ALTER TABLE `equipe_antendimento`
  ADD PRIMARY KEY (`ID_EQUIPE`);

--
-- Índices de tabela `info_finais`
--
ALTER TABLE `info_finais`
  ADD PRIMARY KEY (`id_info_finais`);

--
-- Índices de tabela `localiza_trauma`
--
ALTER TABLE `localiza_trauma`
  ADD PRIMARY KEY (`LOCALIZACAO_TRAUMA`);

--
-- Índices de tabela `materiais`
--
ALTER TABLE `materiais`
  ADD PRIMARY KEY (`ID_MATERIAL_DESCART`);

--
-- Índices de tabela `ocorrencia`
--
ALTER TABLE `ocorrencia`
  ADD PRIMARY KEY (`id_ocorrencia`),
  ADD KEY `fk_info_finais` (`fk_info_finais`),
  ADD KEY `fk_equipe_atendimento` (`fk_equipe_atendimento`),
  ADD KEY `fk_materiais_descart` (`fk_materiais_descart`),
  ADD KEY `fk_paciente` (`fk_paciente`),
  ADD KEY `fk_deixados_hospital` (`fk_deixados_hospital`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`ID_PACIENTE`),
  ADD KEY `fk_acompanhante` (`fk_acompanhante`),
  ADD KEY `fk_cinematica` (`fk_cinematica`),
  ADD KEY `fk_proced_efetuados` (`fk_proced_efetuados`),
  ADD KEY `fk_avaliacao` (`fk_avaliacao`),
  ADD KEY `fk_problem_suspeito` (`fk_problem_suspeito`),
  ADD KEY `fk_localiza_trauma` (`fk_localizacao_trauma`),
  ADD KEY `fk_sinais_sintomas_vitais` (`fk_sinais_vitais`),
  ADD KEY `fk_anamnese_emerg` (`fk_anamnese_emerg`),
  ADD KEY `fk_anamnese_gest` (`fk_anamnese_gest`);

--
-- Índices de tabela `problem_suspeito`
--
ALTER TABLE `problem_suspeito`
  ADD PRIMARY KEY (`id_problem_suspeito`);

--
-- Índices de tabela `proced_efetuados`
--
ALTER TABLE `proced_efetuados`
  ADD PRIMARY KEY (`ID_RROCED_EFETUADOS`);

--
-- Índices de tabela `sinais_sintomas`
--
ALTER TABLE `sinais_sintomas`
  ADD PRIMARY KEY (`id_sinais_sinoma`);

--
-- Índices de tabela `sinais_vitais`
--
ALTER TABLE `sinais_vitais`
  ADD PRIMARY KEY (`ID_SINAIS-VITAIS`);

--
-- Índices de tabela `user_detalhes`
--
ALTER TABLE `user_detalhes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_USUARIO` (`USER_ID`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acompanhante`
--
ALTER TABLE `acompanhante`
  MODIFY `ID_ACOMPANHA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `ID_AVALIACAO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cinematica`
--
ALTER TABLE `cinematica`
  MODIFY `id_cinematica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `equipe_antendimento`
--
ALTER TABLE `equipe_antendimento`
  MODIFY `ID_EQUIPE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `localiza_trauma`
--
ALTER TABLE `localiza_trauma`
  MODIFY `LOCALIZACAO_TRAUMA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `materiais`
--
ALTER TABLE `materiais`
  MODIFY `ID_MATERIAL_DESCART` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `ID_PACIENTE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `problem_suspeito`
--
ALTER TABLE `problem_suspeito`
  MODIFY `id_problem_suspeito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `proced_efetuados`
--
ALTER TABLE `proced_efetuados`
  MODIFY `ID_RROCED_EFETUADOS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sinais_vitais`
--
ALTER TABLE `sinais_vitais`
  MODIFY `ID_SINAIS-VITAIS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user_detalhes`
--
ALTER TABLE `user_detalhes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `ocorrencia`
--
ALTER TABLE `ocorrencia`
  ADD CONSTRAINT `fk_deixados_hospital` FOREIGN KEY (`fk_deixados_hospital`) REFERENCES `deixados_hospital` (`id_deixados_hospital`),
  ADD CONSTRAINT `fk_equipe_atendimento` FOREIGN KEY (`fk_equipe_atendimento`) REFERENCES `equipe_antendimento` (`ID_EQUIPE`),
  ADD CONSTRAINT `fk_info_finais` FOREIGN KEY (`fk_info_finais`) REFERENCES `info_finais` (`id_info_finais`),
  ADD CONSTRAINT `fk_materiais_descart` FOREIGN KEY (`fk_materiais_descart`) REFERENCES `materiais` (`ID_MATERIAL_DESCART`),
  ADD CONSTRAINT `fk_paciente` FOREIGN KEY (`fk_paciente`) REFERENCES `paciente` (`ID_PACIENTE`);

--
-- Restrições para tabelas `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `fk_acompanhante` FOREIGN KEY (`fk_acompanhante`) REFERENCES `acompanhante` (`ID_ACOMPANHA`),
  ADD CONSTRAINT `fk_anamnese_emerg` FOREIGN KEY (`fk_anamnese_emerg`) REFERENCES `anamnese_emerg` (`id_anamnese_emerg`),
  ADD CONSTRAINT `fk_anamnese_gest` FOREIGN KEY (`fk_anamnese_gest`) REFERENCES `anamnese_gest` (`id_anamnese_gest`),
  ADD CONSTRAINT `fk_avaliacao` FOREIGN KEY (`fk_avaliacao`) REFERENCES `avaliacao` (`ID_AVALIACAO`),
  ADD CONSTRAINT `fk_cinematica` FOREIGN KEY (`fk_cinematica`) REFERENCES `cinematica` (`id_cinematica`),
  ADD CONSTRAINT `fk_localiza_trauma` FOREIGN KEY (`fk_localizacao_trauma`) REFERENCES `localiza_trauma` (`LOCALIZACAO_TRAUMA`),
  ADD CONSTRAINT `fk_localizacao_trauma` FOREIGN KEY (`fk_localizacao_trauma`) REFERENCES `localiza_trauma` (`LOCALIZACAO_TRAUMA`),
  ADD CONSTRAINT `fk_problem_suspeito` FOREIGN KEY (`fk_problem_suspeito`) REFERENCES `problem_suspeito` (`id_problem_suspeito`),
  ADD CONSTRAINT `fk_proced_efetuados` FOREIGN KEY (`fk_proced_efetuados`) REFERENCES `proced_efetuados` (`ID_RROCED_EFETUADOS`),
  ADD CONSTRAINT `fk_sinais_sintomas_vitais` FOREIGN KEY (`fk_sinais_vitais`) REFERENCES `sinais_sintomas` (`id_sinais_sinoma`),
  ADD CONSTRAINT `fk_sinais_vitais` FOREIGN KEY (`fk_sinais_vitais`) REFERENCES `sinais_vitais` (`ID_SINAIS-VITAIS`);

--
-- Restrições para tabelas `user_detalhes`
--
ALTER TABLE `user_detalhes`
  ADD CONSTRAINT `FK_USUARIO` FOREIGN KEY (`USER_ID`) REFERENCES `usuario` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
