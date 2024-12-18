-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/12/2024 às 02:09
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdleilao`
--
CREATE DATABASE IF NOT EXISTS `bdleilao` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bdleilao`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
--

DROP TABLE IF EXISTS `itens`;
CREATE TABLE `itens` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `imagem` varchar(200) NOT NULL,
  `minimo` varchar(20) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `id_vencedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itens`
--

INSERT INTO `itens` (`id`, `nome`, `imagem`, `minimo`, `estado`, `id_vencedor`) VALUES
(1, 'teste nome', 'teste imagem', '200', '', 0),
(2, 'teste nome', 'teste imagem', '200', '', NULL),
(3, 'Computador', 'imagens/pc1733274258.jpg', '200', 'aberto', NULL),
(4, 'Computador', 'imagens/pc1733274382.jpg', '200', 'aberto', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `senha` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `senha`) VALUES
(1, 'teste nome', 'teste senha'),
(2, 'teste nome', 'teste senha'),
(3, 'fulano', 'senha'),
(4, 'Beltrano', 'nova senha'),
(5, 'Ciclano', '466f3c5cfc5287a42366e0303dbac2d5c82992f0405b77f7de660ee888d618ea'),
(6, 'Deltrano', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(7, 'Deltrano', '332a35baaefc44113f815a691b78b5a28d94bb4074ff817e330138c3bd4cf5e2');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
