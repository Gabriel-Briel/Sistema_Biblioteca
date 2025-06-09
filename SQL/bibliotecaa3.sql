-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: bibliotecaa3
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `emprestimos`
--

DROP TABLE IF EXISTS `emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Livro` int NOT NULL,
  `ID_Membro` int NOT NULL,
  `Data_Emprestimo` date NOT NULL,
  `Data_Devolucao` date DEFAULT NULL,
  `Status` enum('Em andamento','Devolvido','Atrasado') DEFAULT 'Em andamento',
  PRIMARY KEY (`ID`),
  KEY `ID_Livro` (`ID_Livro`),
  KEY `fk_emprestimos_membros` (`ID_Membro`),
  CONSTRAINT `emprestimos_ibfk_1` FOREIGN KEY (`ID_Livro`) REFERENCES `livros` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_emprestimos_membros` FOREIGN KEY (`ID_Membro`) REFERENCES `membros` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimos`
--

LOCK TABLES `emprestimos` WRITE;
/*!40000 ALTER TABLE `emprestimos` DISABLE KEYS */;
INSERT INTO `emprestimos` VALUES (1,1,1,'2025-05-01','2025-06-08','Devolvido'),(2,2,2,'2025-05-03','2025-06-08','Devolvido'),(3,3,3,'2025-05-04','2025-06-08','Devolvido'),(4,4,4,'2025-05-05','2025-06-08','Devolvido'),(5,5,5,'2025-05-06','2025-05-20','Em andamento'),(6,2,2,'2025-06-05','2025-06-08','Em andamento'),(7,2,2,'2025-06-05','2025-06-08','Devolvido'),(8,7,3,'2025-06-08','2025-06-15','Em andamento');
/*!40000 ALTER TABLE `emprestimos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Cargo` varchar(100) DEFAULT NULL,
  `Login` varchar(100) NOT NULL,
  `Senha` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Login` (`Login`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Maria Santos','Gerente','maria.santos','senha123'),(2,'José Pereira','Bibliotecário','jose.pereira','senha456'),(3,'Cláudia Almeida','Atendente','claudia.almeida','123'),(4,'Paulo Souza','Auxiliar de Biblioteca','paulo.souza','senha101');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_emprestimos`
--

DROP TABLE IF EXISTS `historico_emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_emprestimos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Livro` int NOT NULL,
  `ID_Membro` int NOT NULL,
  `Data_Ação` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `ID_Livro` (`ID_Livro`),
  KEY `fk_historico_emprestimos_membros` (`ID_Membro`),
  CONSTRAINT `fk_historico_emprestimos_membros` FOREIGN KEY (`ID_Membro`) REFERENCES `membros` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `historico_emprestimos_ibfk_1` FOREIGN KEY (`ID_Livro`) REFERENCES `livros` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_emprestimos`
--

LOCK TABLES `historico_emprestimos` WRITE;
/*!40000 ALTER TABLE `historico_emprestimos` DISABLE KEYS */;
INSERT INTO `historico_emprestimos` VALUES (1,1,1,'2025-05-01 03:00:00'),(2,2,2,'2025-05-03 03:00:00'),(3,3,3,'2025-05-04 03:00:00'),(4,4,4,'2025-05-05 03:00:00'),(5,5,5,'2025-05-06 03:00:00');
/*!40000 ALTER TABLE `historico_emprestimos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL,
  `Autor` varchar(255) NOT NULL,
  `Categoria` varchar(100) DEFAULT NULL,
  `Disponibilidade` enum('Sim','Não') NOT NULL DEFAULT 'Sim',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,'O Senhor dos Anéis','J.R.R. Tolkien','Fantasia','Sim'),(2,'1984','George Orwell','Distopia','Sim'),(3,'Dom Casmurro','Machado de Assis','Literatura Brasileira','Sim'),(4,'O Código Da Vinci','Dan Brown','Mistério','Sim'),(5,'Harry Potter e a Pedra Filosofal','J.K. Rowling','Fantasia','Sim'),(6,'A Arte da Guerra','Sun Tzu','Estratégia','Sim'),(7,'O Alquimista','Paulo Coelho','Ficção','Sim'),(8,'A Moreninha','Joaquim Manuel de Macedo','Romance','Sim'),(9,'O Primo Basílio','José de Alencar','Romance','Sim'),(10,'O Cortiço','Aluisio Azevedo','Realismo','Sim'),(11,'O Grande Gatsby','F. Scott Fitzgerald','Literatura Americana','Sim'),(12,'Mestre e Margarida','Mikhail Bulgakov','Ficção','Sim'),(13,'A Metamorfose','Franz Kafka','Literatura Alemã','Sim'),(14,'Fahrenheit 451','Ray Bradbury','Distopia','Sim'),(15,'O Processo','Franz Kafka','Literatura Alemã','Sim'),(16,'Os Miseráveis','Victor Hugo','Romance','Sim'),(17,'Drácula','Bram Stoker','Terror','Sim'),(18,'As Aventuras de Sherlock Holmes','Arthur Conan Doyle','Mistério','Sim'),(19,'A Dança dos Dragões','George R.R. Martin','Fantasia','Sim'),(20,'O Alquimista','Paulo Coelho','Ficção','Sim'),(25,'O Alquimista','Paulo Coelho','Ficção','Sim'),(26,'O Alquimista','Paulo Coelho','Ficção','Sim'),(27,'O Alquimista','Paulo Coelho','Ficção','Sim');
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membros`
--

DROP TABLE IF EXISTS `membros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membros` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membros`
--

LOCK TABLES `membros` WRITE;
/*!40000 ALTER TABLE `membros` DISABLE KEYS */;
INSERT INTO `membros` VALUES (1,'Ana Silva','089.331.318-17','(11) 98765-4321','ana.silva@gmail.com'),(2,'Carlos Souza','466.971.560-74','(21) 99123-4567','carlos.souza@yahoo.com.br'),(3,'Mariana Costa','411.743.660-01','(31) 99765-4321','mariana.costa@hotmail.com'),(4,'Lucas Oliveira','203.008.482-42','(41) 99654-3210','lucas.oliveira@gmail.com'),(5,'Juliana Mendes','620.528.036-10','(51) 99234-5678','juliana.mendes@outlook.com'),(6,'Pedro Lima','939.809.278-65','(61) 99345-6789','pedro.lima@gmail.com'),(7,'Fernanda Rocha','128.177.637-85','(71) 99887-7665','fernanda.rocha@uol.com.br'),(8,'Ricardo Alves','215.249.685-01','(81) 99122-3344','ricardo.alves@yahoo.com.br'),(9,'Larissa Martins','741.435.037-19','(91) 99765-4321','larissa.martins@gmail.com'),(10,'Eduardo Pereira','694.254.943-63','(11) 99456-7890','eduardo.pereira@uol.com.br'),(12,'francsico','81369948468','84999996666','ed@gmail.com');
/*!40000 ALTER TABLE `membros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-08 20:47:24
