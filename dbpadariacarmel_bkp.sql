-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/08/2023 às 16:27
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
-- Banco de dados: `dbpadariacarmel`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbclientes`
--

CREATE TABLE `tbclientes` (
  `codCli` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telCel` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbfornecedores`
--

CREATE TABLE `tbfornecedores` (
  `codForn` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cnpj` char(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbfuncionarios`
--

CREATE TABLE `tbfuncionarios` (
  `codFunc` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telCel` char(15) DEFAULT NULL,
  `cpf` char(14) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbfuncionarios`
--

INSERT INTO `tbfuncionarios` (`codFunc`, `nome`, `email`, `telCel`, `cpf`, `endereco`, `numero`, `bairro`, `cidade`, `estado`, `cep`) VALUES
(1, 'Senac Largo Treze', 'sac@sp.senac.br', '(11) 95824-7859', '258.365.952-88', 'Rua Dr. Ant├┤nio Bento', '355', 'Santo Amaro', 'S├úo Paulo', 'SP', '04750-000'),
(2, 'Miranda da Morais Mello', 'miranda.mmello@gmail..com', '(11) 11111-1111', '125.852.063-66', 'Rua Doutor Antônio Bento', '258', 'Santo Amaro', 'São Paulo', 'SP', '04750-001'),
(3, 'Jeovana Jessica de Jesus', 'jeovana.jjesus@hotmai.com', '(11) 47752-8228', '258.369.257-74', 'Rua Doutor Antônio Bento', '247', 'Santo Amaro', 'São Paulo', 'SP', '04750-000'),
(4, 'Vânia Antonieta da Cruz', 'vanica.acruz@gmail.com', '(11) 52828-2855', '228.889.339-84', 'Avenida Professor Hermógenes de Freitas Leitão Filho', '258', 'Jardim Casa Grande', 'São Paulo', 'SP', '04865-000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbprodutos`
--

CREATE TABLE `tbprodutos` (
  `codProd` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `dataEntrada` date DEFAULT NULL,
  `horaEntrada` time DEFAULT NULL,
  `quantidade` decimal(9,2) DEFAULT NULL,
  `valorUnit` decimal(9,2) DEFAULT NULL,
  `codForn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbusuarios`
--

CREATE TABLE `tbusuarios` (
  `codUsu` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(14) NOT NULL,
  `codFunc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbusuarios`
--

INSERT INTO `tbusuarios` (`codUsu`, `nome`, `senha`, `codFunc`) VALUES
(1, 'senac', 'senac', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbvendas`
--

CREATE TABLE `tbvendas` (
  `codVenda` int(11) NOT NULL,
  `codUsu` int(11) NOT NULL,
  `codCli` int(11) NOT NULL,
  `codProd` int(11) NOT NULL,
  `dataVenda` date DEFAULT NULL,
  `quantidade` decimal(9,2) DEFAULT NULL,
  `valorTotal` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbclientes`
--
ALTER TABLE `tbclientes`
  ADD PRIMARY KEY (`codCli`);

--
-- Índices de tabela `tbfornecedores`
--
ALTER TABLE `tbfornecedores`
  ADD PRIMARY KEY (`codForn`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices de tabela `tbfuncionarios`
--
ALTER TABLE `tbfuncionarios`
  ADD PRIMARY KEY (`codFunc`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `tbprodutos`
--
ALTER TABLE `tbprodutos`
  ADD PRIMARY KEY (`codProd`),
  ADD KEY `codForn` (`codForn`);

--
-- Índices de tabela `tbusuarios`
--
ALTER TABLE `tbusuarios`
  ADD PRIMARY KEY (`codUsu`),
  ADD KEY `codFunc` (`codFunc`);

--
-- Índices de tabela `tbvendas`
--
ALTER TABLE `tbvendas`
  ADD PRIMARY KEY (`codVenda`),
  ADD KEY `codUsu` (`codUsu`),
  ADD KEY `codCli` (`codCli`),
  ADD KEY `codProd` (`codProd`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbclientes`
--
ALTER TABLE `tbclientes`
  MODIFY `codCli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbfornecedores`
--
ALTER TABLE `tbfornecedores`
  MODIFY `codForn` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbfuncionarios`
--
ALTER TABLE `tbfuncionarios`
  MODIFY `codFunc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tbprodutos`
--
ALTER TABLE `tbprodutos`
  MODIFY `codProd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbusuarios`
--
ALTER TABLE `tbusuarios`
  MODIFY `codUsu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbvendas`
--
ALTER TABLE `tbvendas`
  MODIFY `codVenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbprodutos`
--
ALTER TABLE `tbprodutos`
  ADD CONSTRAINT `tbprodutos_ibfk_1` FOREIGN KEY (`codForn`) REFERENCES `tbfornecedores` (`codForn`);

--
-- Restrições para tabelas `tbusuarios`
--
ALTER TABLE `tbusuarios`
  ADD CONSTRAINT `tbusuarios_ibfk_1` FOREIGN KEY (`codFunc`) REFERENCES `tbfuncionarios` (`codFunc`);

--
-- Restrições para tabelas `tbvendas`
--
ALTER TABLE `tbvendas`
  ADD CONSTRAINT `tbvendas_ibfk_1` FOREIGN KEY (`codUsu`) REFERENCES `tbusuarios` (`codUsu`),
  ADD CONSTRAINT `tbvendas_ibfk_2` FOREIGN KEY (`codCli`) REFERENCES `tbclientes` (`codCli`),
  ADD CONSTRAINT `tbvendas_ibfk_3` FOREIGN KEY (`codProd`) REFERENCES `tbprodutos` (`codProd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
