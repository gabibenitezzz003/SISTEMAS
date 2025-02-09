-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion_dnh2
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `ai_queries`
--

DROP TABLE IF EXISTS `ai_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_queries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `query` varchar(500) DEFAULT NULL,
  `response` varchar(1000) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `context` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_queries`
--

LOCK TABLES `ai_queries` WRITE;
/*!40000 ALTER TABLE `ai_queries` DISABLE KEYS */;
INSERT INTO `ai_queries` VALUES (1,'¿Cuál es la distribución de turnos esta semana?','Error procesando la consulta: Error code: 401 - {\'error\': {\'message\': \'Incorrect API key provided: sk-proj-****************************8901. You can find your API key at https://platform.openai.com/account/api-keys.\', \'type\': \'invalid_request_error\', \'param\': None, \'code\': \'invalid_api_key\'}}','2024-12-26 07:49:14','\"{\\\"timestamp\\\": \\\"2024-12-26T04:49:13.778933\\\"}\"'),(2,'¿Cuántos asesores hay en turno mañana?','Error procesando la consulta: Error code: 401 - {\'error\': {\'message\': \'Incorrect API key provided: sk-proj-****************************8901. You can find your API key at https://platform.openai.com/account/api-keys.\', \'type\': \'invalid_request_error\', \'param\': None, \'code\': \'invalid_api_key\'}}','2024-12-26 07:49:14','\"{\\\"timestamp\\\": \\\"2024-12-26T04:49:13.794568\\\"}\"'),(3,'hola me puedes ayudar?','Hola, claro que puedo ayudarte. Soy un asistente especializado en gestión de turnos y recursos humanos. ¿En qué puedo ayudarte hoy?','2024-12-27 02:56:52',NULL),(4,'hola me puedes ayudar?','Hola, claro que puedo ayudarte. Soy un asistente especializado en gestión de turnos y recursos humanos. ¿En qué puedo ayudarte hoy?','2024-12-27 02:56:53',NULL),(5,'que me puedes decir de este proyecto?','Necesito más información sobre el proyecto para poder proporcionarte una respuesta detallada. Por favor, proporciona más información, como el alcance, los objetivos, los recursos y los plazos.','2024-12-27 02:57:17',NULL),(6,'que me puedes decir de este proyecto?','Necesito más información sobre el proyecto para poder proporcionarte una respuesta detallada. Por favor, proporciona más información, como el alcance, los objetivos, los recursos y los plazos.','2024-12-27 02:57:17',NULL),(7,'hola me puedes ayudar?','Hola, soy un asistente especializado en gestión de turnos y recursos humanos. ¿En qué puedo ayudarte hoy?','2024-12-27 03:03:00',NULL),(8,'hola me puedes ayudar?','Hola, soy un asistente especializado en gestión de turnos y recursos humanos. ¿En qué puedo ayudarte hoy?','2024-12-27 03:03:00',NULL),(9,'como podria mejorar mi dia a dia?','Lo siento, ocurrió un error al procesar tu consulta: (pymysql.err.DataError) (1406, \"Data too long for column \'response\' at row 1\")\n[SQL: INSERT INTO ai_queries (query, response, timestamp) VALUES (%(query)s, %(response)s, %(timestamp)s)]\n[parameters: {\'query\': \'como podria mejorar mi dia a dia?\', \'response\': \'**Recomendaciones para mejorar tu día a día:**\\n\\n* **Optimiza tu horario de trabajo:** Analiza los datos de asistencia y rendimiento para identifica ... (995 characters truncated) ... licita comentarios:** Pide comentarios regularmente a tus compañeros y supervisores para identificar áreas de mejora y fortalecer tus puntos fuertes.\', \'timestamp\': datetime.datetime(2024, 12, 27, 3, 3, 16, 172260)}]\n(Background on this error at: https://sqlalche.me/e/20/9h9h)','2024-12-27 03:03:16',NULL),(10,'buenas tardes, podrias ayudarme?','Por supuesto, estaré encantado de ayudarte. Soy un asistente especializado en gestión de turnos y recursos humanos. ¿En qué puedo ayudarte hoy?','2024-12-27 03:06:58',NULL),(11,'buenas tardes, podrias ayudarme?','Por supuesto, estaré encantado de ayudarte. Soy un asistente especializado en gestión de turnos y recursos humanos. ¿En qué puedo ayudarte hoy?','2024-12-27 03:06:58',NULL),(12,'hola como estas?','Hola, estoy bien gracias. ¿En qué puedo ayudarte? Puedo brindarte información sobre el Sistema GTR o responder preguntas generales.','2024-12-27 03:10:30',NULL),(13,'hola como estas?','Hola, estoy bien gracias. ¿En qué puedo ayudarte? Puedo brindarte información sobre el Sistema GTR o responder preguntas generales.','2024-12-27 03:10:30',NULL),(14,'hola como estas?','Error al generar la respuesta. Por favor, intenta de nuevo.','2024-12-27 03:16:57',NULL),(15,'hola como estas?','Error al generar la respuesta. Por favor, intenta de nuevo.','2024-12-27 03:16:57',NULL),(16,'hola','Error al generar la respuesta. Por favor, intenta de nuevo.','2024-12-27 03:17:01',NULL),(17,'hola','Error al generar la respuesta. Por favor, intenta de nuevo.','2024-12-27 03:17:01',NULL),(18,'hola como estas??','¡Hola! Me encuentro bien, gracias. ¿En qué puedo ayudarte hoy?','2024-12-27 03:19:26',NULL),(19,'hola como estas??','¡Hola! Me encuentro bien, gracias. ¿En qué puedo ayudarte hoy?','2024-12-27 03:19:26',NULL),(20,'que puedes contarme de GTR?','GTR (Sistema de Gestión de Turnos y Recursos) es un sistema integral que optimiza la gestión de personal y la asignación de recursos en las empresas. Con GTR, puedes:\n\n* **Gestionar turnos:** Asignar turnos automáticamente, controlar horarios, gestionar ausencias y rotar personal de manera eficiente.\n* **Administrar recursos humanos:** Gestionar información del personal, evaluar el desempeño, brindar capacitación y promover el desarrollo profesional.\n* **Analizar y optimizar:** Acceder a métricas en tiempo real, realizar predicciones, optimizar procesos y generar reportes personalizados para la toma de decisiones informada.','2024-12-27 03:19:42',NULL),(21,'que puedes contarme de GTR?','GTR (Sistema de Gestión de Turnos y Recursos) es un sistema integral que optimiza la gestión de personal y la asignación de recursos en las empresas. Con GTR, puedes:\n\n* **Gestionar turnos:** Asignar turnos automáticamente, controlar horarios, gestionar ausencias y rotar personal de manera eficiente.\n* **Administrar recursos humanos:** Gestionar información del personal, evaluar el desempeño, brindar capacitación y promover el desarrollo profesional.\n* **Analizar y optimizar:** Acceder a métricas en tiempo real, realizar predicciones, optimizar procesos y generar reportes personalizados para la toma de decisiones informada.','2024-12-27 03:19:42',NULL),(22,'estas ahi?','Sí, estoy aquí. Soy el asistente experto del sistema GTR. ¿En qué puedo ayudarte hoy?','2024-12-27 03:20:41',NULL),(23,'estas ahi?','Sí, estoy aquí. Soy el asistente experto del sistema GTR. ¿En qué puedo ayudarte hoy?','2024-12-27 03:20:41',NULL),(24,'podrias ayudarme a contabilizar los turnos de diciembre?','Claro, puedo ayudarte con eso. El sistema GTR proporciona informes de turnos que puedes utilizar para contabilizarlos. Ve a la sección \"Informes\" del módulo \"Gestión de Turnos\" y selecciona el informe \"Turnos por Mes\". Ingresa el mes y el año para el que deseas generar el informe, en este caso diciembre del año actual. El informe mostrará una lista de todos los turnos programados para ese mes, junto con información como la fecha, hora, duración y empleado asignado. También puedes exportar el informe a Excel o PDF para su posterior procesamiento.','2024-12-27 03:21:12',NULL),(25,'podrias ayudarme a contabilizar los turnos de diciembre?','Claro, puedo ayudarte con eso. El sistema GTR proporciona informes de turnos que puedes utilizar para contabilizarlos. Ve a la sección \"Informes\" del módulo \"Gestión de Turnos\" y selecciona el informe \"Turnos por Mes\". Ingresa el mes y el año para el que deseas generar el informe, en este caso diciembre del año actual. El informe mostrará una lista de todos los turnos programados para ese mes, junto con información como la fecha, hora, duración y empleado asignado. También puedes exportar el informe a Excel o PDF para su posterior procesamiento.','2024-12-27 03:21:12',NULL),(26,'podrias darme inforamcion de los cambios realizados?','En este momento no se han realizado cambios en el sistema GTR. Para obtener información actualizada, consulta la documentación oficial o ponte en contacto con el equipo de soporte técnico.','2024-12-27 10:22:41',NULL),(27,'podrias darme inforamcion de los cambios realizados?','En este momento no se han realizado cambios en el sistema GTR. Para obtener información actualizada, consulta la documentación oficial o ponte en contacto con el equipo de soporte técnico.','2024-12-27 10:22:41',NULL),(28,'que me puedes decir del equipo de GTR?','El equipo de GTR está compuesto por profesionales altamente calificados y experimentados con una profunda comprensión de las necesidades de gestión de turnos y recursos. Están dedicados a proporcionar un excelente soporte y asistencia a los clientes para garantizar una implementación y uso exitosos del sistema GTR. El equipo incluye expertos en gestión de turnos, recursos humanos y análisis de datos, que trabajan en conjunto para ofrecer soluciones personalizadas y efectivas.','2024-12-27 10:23:47',NULL),(29,'que me puedes decir del equipo de GTR?','El equipo de GTR está compuesto por profesionales altamente calificados y experimentados con una profunda comprensión de las necesidades de gestión de turnos y recursos. Están dedicados a proporcionar un excelente soporte y asistencia a los clientes para garantizar una implementación y uso exitosos del sistema GTR. El equipo incluye expertos en gestión de turnos, recursos humanos y análisis de datos, que trabajan en conjunto para ofrecer soluciones personalizadas y efectivas.','2024-12-27 10:23:47',NULL);
/*!40000 ALTER TABLE `ai_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesores`
--

DROP TABLE IF EXISTS `asesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asesores` (
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `lider` varchar(100) DEFAULT NULL,
  `skill` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesores`
--

LOCK TABLES `asesores` WRITE;
/*!40000 ALTER TABLE `asesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `asesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `details` json DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigos_horarios`
--

DROP TABLE IF EXISTS `codigos_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigos_horarios` (
  `codigo` varchar(50) DEFAULT NULL,
  `horas_base` decimal(4,2) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigos_horarios`
--

LOCK TABLES `codigos_horarios` WRITE;
/*!40000 ALTER TABLE `codigos_horarios` DISABLE KEYS */;
INSERT INTO `codigos_horarios` VALUES ('LICENCIA',6.00,'#FFFF00'),('FALTA INJUSTIFICADA',6.00,'#FFA500'),('CERTIFICADO',6.00,'#00FF00'),('BAJA',0.00,'#FF0000'),('PRESENTE',12.00,'#0000FF'),('ASESOR MESSI',5.00,'#FFD700'),('CAMBIO DE ROL',5.00,'#FF0000'),('CAMBIO DE PRODUCTO',0.00,'#000000'),('DEVOLUCIÓN DE HORAS',NULL,'#800080'),('LICENCIA',6.00,'#FFFF00'),('FALTA INJUSTIFICADA',6.00,'#FFA500'),('CERTIFICADO',6.00,'#00FF00'),('BAJA',0.00,'#FF0000'),('PRESENTE',12.00,'#0000FF'),('ASESOR MESSI',5.00,'#FFD700'),('CAMBIO DE ROL',5.00,'#FF0000'),('CAMBIO DE PRODUCTO',0.00,'#000000'),('DEVOLUCIÓN DE HORAS',NULL,'#800080');
/*!40000 ALTER TABLE `codigos_horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_metrics`
--

DROP TABLE IF EXISTS `company_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_metrics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `market_share` float DEFAULT NULL,
  `customer_satisfaction` float DEFAULT NULL,
  `coverage_score` float DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_metrics`
--

LOCK TABLES `company_metrics` WRITE;
/*!40000 ALTER TABLE `company_metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitor_analysis`
--

DROP TABLE IF EXISTS `competitor_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competitor_analysis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `competitor_name` varchar(50) DEFAULT NULL,
  `plan_name` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `data_gb` int DEFAULT NULL,
  `minutes` int DEFAULT NULL,
  `additional_features` json DEFAULT NULL,
  `analysis_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitor_analysis`
--

LOCK TABLES `competitor_analysis` WRITE;
/*!40000 ALTER TABLE `competitor_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `competitor_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dias_no_habiles`
--

DROP TABLE IF EXISTS `dias_no_habiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dias_no_habiles` (
  `id_dia` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `horario` varchar(20) DEFAULT NULL,
  `horas_trabajadas` decimal(4,1) DEFAULT NULL,
  `tipo_dia` varchar(20) DEFAULT NULL,
  `skill` varchar(10) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `lider` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_dia`),
  KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=34717 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dias_no_habiles`
--

LOCK TABLES `dias_no_habiles` WRITE;
/*!40000 ALTER TABLE `dias_no_habiles` DISABLE KEYS */;
INSERT INTO `dias_no_habiles` VALUES (34354,'43214056','2024-12-14','14:00:00-20:00:00',NULL,'Sábado','COM','MENDOZA MARIA JOSE',NULL),(34355,'41420129','2024-11-30','08:30:00-14:30:00',NULL,'Sábado','COM','HUENTENAO, MAXIMILIANO AGUSTIN',NULL),(34356,'41420129','2024-12-15','08:30:00-14:30:00',NULL,'Domingo','COM','HUENTENAO, MAXIMILIANO AGUSTIN',NULL),(34357,'41420129','2024-12-28','08:30:00-14:30:00',NULL,'Sábado','COM','HUENTENAO, MAXIMILIANO AGUSTIN',NULL),(34358,'41372160','2024-12-15','09:30:00-15:30:00',NULL,'Domingo','COM','HERNANDEZ, MARIANELA',NULL),(34359,'41372160','2024-12-28','09:30:00-15:30:00',NULL,'Sábado','COM','HERNANDEZ, MARIANELA',NULL),(34360,'42421746','2024-11-30','10:00:00-16:00:00',NULL,'Sábado','COM','NAHÜEL, LUCIA',NULL),(34361,'42421746','2024-12-14','10:00:00-16:00:00',NULL,'Sábado','COM','NAHÜEL, LUCIA',NULL),(34362,'42421746','2024-12-28','10:00:00-16:00:00',NULL,'Sábado','COM','NAHÜEL, LUCIA',NULL),(34363,'44009637','2024-12-15','08:30:00-14:30:00',NULL,'Domingo','COM','REVELLO, ALDANA CAMILA',NULL),(34364,'40688879','2024-11-30','09:00:00-15:00:00',NULL,'Sábado','COM','MAYA, EMIR ANDRÉS',NULL),(34365,'40688879','2024-12-15','09:00:00-15:00:00',NULL,'Domingo','COM','MAYA, EMIR ANDRÉS',NULL),(34366,'36653863','2024-12-07','09:30:00-15:30:00',NULL,'Sábado','COM','CORIA, MAIRA SABRINA',NULL),(34367,'36653863','2024-12-22','09:30:00-15:30:00',NULL,'Domingo','COM','CORIA, MAIRA SABRINA',NULL),(34368,'36653863','2024-12-29','09:30:00-15:30:00',NULL,'Domingo','COM','CORIA, MAIRA SABRINA',NULL),(34369,'45585715','2024-12-07','14:00:00-20:00:00',NULL,'Sábado','COM','MAGNI VALENTINO AGUSTÍN',NULL),(34370,'45585715','2024-12-22','14:00:00-20:00:00',NULL,'Domingo','COM','MAGNI VALENTINO AGUSTÍN',NULL),(34371,'27270395','2024-12-07','14:00:00-20:00:00',NULL,'Sábado','COM','MORENO CRISTINA LUCIA',NULL),(34372,'27270395','2024-12-21','14:00:00-20:00:00',NULL,'Sábado','COM','MORENO CRISTINA LUCIA',NULL),(34373,'39089282','2024-11-30','08:00:00-14:00:00',NULL,'Sábado','COM','PAZ MERELO, ANABELA DENIA',NULL),(34374,'39089282','2024-12-15','08:00:00-14:00:00',NULL,'Domingo','COM','PAZ MERELO, ANABELA DENIA',NULL),(34375,'37377937','2024-12-08','08:00:00-14:00:00',NULL,'Domingo','COM','OSUNA DAIANA',NULL),(34376,'41083080','2024-12-08','08:30:00-14:30:00',NULL,'Domingo','COM','ARANO, INDIRA AILEN',NULL),(34377,'40465666','2024-12-08','09:00:00-15:00:00',NULL,'Domingo','COM','PEREZ, ROMINA AYELEN',NULL),(34378,'36788029','2024-12-14','15:30:00-21:30:00',NULL,'Sábado','COM','PIAGGESI CINTHIA ROCIO LUJAN',NULL),(34379,'38578278','2024-12-07','10:00:00-16:00:00',NULL,'Sábado','COM','MOYANO RIOS YAMILA',NULL),(34380,'38578278','2024-12-22','10:00:00-16:00:00',NULL,'Domingo','COM','MOYANO RIOS YAMILA',NULL),(34381,'40882375','2024-12-07','08:30:00-14:30:00',NULL,'Sábado','COM','CZELEJ MAIRA',NULL),(34382,'40882375','2024-12-21','08:30:00-14:30:00',NULL,'Sábado','COM','CZELEJ MAIRA',NULL),(34383,'40882375','2024-12-29','08:30:00-14:30:00',NULL,'Domingo','COM','CZELEJ MAIRA',NULL),(34384,'44984927','2024-12-01','09:00:00-15:00:00',NULL,'Domingo','COM','MILLAN, MARIANGELES LUCIANA',NULL),(34385,'44984927','2024-12-14','09:00:00-15:00:00',NULL,'Sábado','COM','MILLAN, MARIANGELES LUCIANA',NULL),(34386,'44984927','2024-12-21','09:00:00-15:00:00',NULL,'Sábado','COM','MILLAN, MARIANGELES LUCIANA',NULL),(34387,'41884833','2024-12-14','16:00:00-22:00:00',NULL,'Sábado','COM','FARIAS TALA MARIA LAURA',NULL),(34388,'29759485','2024-12-14','16:00:00-22:00:00',NULL,'Sábado','COM','CASSIA LUIS GERARDO',NULL),(34389,'41191217','2024-12-01','09:00:00-15:00:00',NULL,'Domingo','COM','CODARO ROMAN ELUN HUMBERTO',NULL),(34390,'41191217','2024-12-21','09:00:00-15:00:00',NULL,'Sábado','COM','CODARO ROMAN ELUN HUMBERTO',NULL),(34391,'41191217','2024-12-28','09:00:00-15:00:00',NULL,'Sábado','COM','CODARO ROMAN ELUN HUMBERTO',NULL),(34392,'41699718','2024-12-07','15:00:00-21:00:00',NULL,'Sábado','COM','BUSTAMANTE LIBOSSART SOFIA',NULL),(34393,'41699718','2024-12-21','15:00:00-21:00:00',NULL,'Sábado','COM','BUSTAMANTE LIBOSSART SOFIA',NULL),(34394,'36788597','2024-11-30','15:00:00-21:00:00',NULL,'Sábado','COM','GUERRA ANDREA',NULL),(34395,'36788597','2024-12-15','15:00:00-21:00:00',NULL,'Domingo','COM','GUERRA ANDREA',NULL),(34396,'36788597','2024-12-28','15:00:00-21:00:00',NULL,'Sábado','COM','GUERRA ANDREA',NULL),(34397,'39381363','2024-12-14','16:00:00-22:00:00',NULL,'Sábado','COM','OLGADO MAYRA NOELIA',NULL),(34398,'44248163','2024-12-07','10:00:00-16:00:00',NULL,'Sábado','COM','BORDON COLOMBINO, ROCIO CELESTE',NULL),(34399,'44248163','2024-12-21','10:00:00-16:00:00',NULL,'Sábado','COM','BORDON COLOMBINO, ROCIO CELESTE',NULL),(34400,'37623445','2024-12-01','13:30:00-19:30:00',NULL,'Domingo','COM','SILVA MIRNA ESTEFANIA',NULL),(34401,'37623445','2024-12-21','13:30:00-19:30:00',NULL,'Sábado','COM','SILVA MIRNA ESTEFANIA',NULL),(34402,'37623445','2024-12-29','13:30:00-19:30:00',NULL,'Domingo','COM','SILVA MIRNA ESTEFANIA',NULL),(34403,'31528924','2024-11-30','14:30:00-20:30:00',NULL,'Sábado','COM','FUNES DEBORA VANESA',NULL),(34404,'31528924','2024-12-14','14:30:00-20:30:00',NULL,'Sábado','COM','FUNES DEBORA VANESA',NULL),(34405,'44438633','2024-12-14','15:30:00-21:30:00',NULL,'Sábado','COM','CORIA, ANA PAULA',NULL),(34406,'35861188','2024-11-30','08:00:00-14:00:00',NULL,'Sábado','COM','SUAREZ YANINA BELEN',NULL),(34407,'35861188','2024-12-15','08:00:00-14:00:00',NULL,'Domingo','COM','SUAREZ YANINA BELEN',NULL),(34408,'38909413','2024-12-07','08:30:00-14:30:00',NULL,'Sábado','COM','PUEO OSCAR ARIEL',NULL),(34409,'38909413','2024-12-14','08:30:00-14:30:00',NULL,'Sábado','COM','PUEO OSCAR ARIEL',NULL),(34410,'42974465','2024-12-14','10:00:00-16:00:00',NULL,'Sábado','COM','SORATTO FLORENCIA',NULL),(34411,'35614083','2024-12-08','08:00:00-14:00:00',NULL,'Domingo','COM','FARIAS ALEXIA',NULL),(34412,'37311678','2024-12-01','10:00:00-16:00:00',NULL,'Domingo','COM','SALAS LUCIANA ANTONELLA',NULL),(34413,'37311678','2024-12-14','10:00:00-16:00:00',NULL,'Sábado','COM','SALAS LUCIANA ANTONELLA',NULL),(34414,'37311678','2024-12-21','10:00:00-16:00:00',NULL,'Sábado','COM','SALAS LUCIANA ANTONELLA',NULL),(34415,'44757450','2024-12-21','14:00:00-20:00:00',NULL,'Sábado','COM','ARENA, PAULINA',NULL),(34416,'45717163','2024-12-14','14:30:00-20:30:00',NULL,'Sábado','COM','MARTINEZ TOMAS NAZARENO',NULL),(34417,'39381335','2024-12-07','13:30:00-19:30:00',NULL,'Sábado','COM','FIGUEROA KAREN JANET',NULL),(34418,'39381335','2024-12-22','13:30:00-19:30:00',NULL,'Domingo','COM','FIGUEROA KAREN JANET',NULL),(34419,'39381335','2024-12-29','13:30:00-19:30:00',NULL,'Domingo','COM','FIGUEROA KAREN JANET',NULL),(34420,'44439005','2024-12-01','16:00:00-22:00:00',NULL,'Domingo','COM','OLIVAREZ, ROCIO',NULL),(34421,'44439005','2024-12-21','16:00:00-22:00:00',NULL,'Sábado','COM','OLIVAREZ, ROCIO',NULL),(34422,'44439005','2024-12-29','16:00:00-22:00:00',NULL,'Domingo','COM','OLIVAREZ, ROCIO',NULL),(34423,'44138947','2024-11-30','08:30:00-14:30:00',NULL,'Sábado','COM','AMARILLO SABINO, PAOLA CAROLINA',NULL),(34424,'44138947','2024-12-07','08:30:00-14:30:00',NULL,'Sábado','COM','AMARILLO SABINO, PAOLA CAROLINA',NULL),(34425,'44138947','2024-12-29','08:30:00-14:30:00',NULL,'Domingo','COM','AMARILLO SABINO, PAOLA CAROLINA',NULL),(34426,'39931993','2024-12-07','09:00:00-15:00:00',NULL,'Sábado','COM','ARREGUI MICAELA',NULL),(34427,'39931993','2024-12-22','09:00:00-15:00:00',NULL,'Domingo','COM','ARREGUI MICAELA',NULL),(34428,'37963838','2024-12-07','15:30:00-21:30:00',NULL,'Sábado','COM','OTEO FRANCISCO MATIAS',NULL),(34429,'37963838','2024-12-21','15:30:00-21:30:00',NULL,'Sábado','COM','OTEO FRANCISCO MATIAS',NULL),(34430,'50665104','2024-12-08','15:00:00-21:00:00',NULL,'Domingo','COM','RABINO OROZCO CRISTIAN EMANUEL',NULL),(34431,'39747919','2024-12-01','16:00:00-22:00:00',NULL,'Domingo','COM','ROMERO ALEXIS DAVID',NULL),(34432,'39747919','2024-12-22','16:00:00-22:00:00',NULL,'Domingo','COM','ROMERO ALEXIS DAVID',NULL),(34433,'39747919','2024-12-28','16:00:00-22:00:00',NULL,'Sábado','COM','ROMERO ALEXIS DAVID',NULL),(34434,'40371560','2024-12-07','15:00:00-21:00:00',NULL,'Sábado','COM','SOSA MATIAS',NULL),(34435,'40371560','2024-12-21','15:00:00-21:00:00',NULL,'Sábado','COM','SOSA MATIAS',NULL),(34436,'40371560','2024-12-29','15:00:00-21:00:00',NULL,'Domingo','COM','SOSA MATIAS',NULL),(34437,'40072048','2024-12-07','10:00:00-16:00:00',NULL,'Sábado','COM','PEREZ PAULA',NULL),(34438,'40072048','2024-12-22','10:00:00-16:00:00',NULL,'Domingo','COM','PEREZ PAULA',NULL),(34439,'40072048','2024-12-29','10:00:00-16:00:00',NULL,'Domingo','COM','PEREZ PAULA',NULL),(34440,'35563571','2024-11-30','15:30:00-21:30:00',NULL,'Sábado','COM','DANILUK MARINA',NULL),(34441,'35563571','2024-12-15','15:30:00-21:30:00',NULL,'Domingo','COM','DANILUK MARINA',NULL),(34442,'35563571','2024-12-28','15:30:00-21:30:00',NULL,'Sábado','COM','DANILUK MARINA',NULL),(34443,'41030486','2024-12-07','15:00:00-21:00:00',NULL,'Sábado','COM','NAJAR MARIA LOURDES',NULL),(34444,'41030486','2024-12-22','15:00:00-21:00:00',NULL,'Domingo','COM','NAJAR MARIA LOURDES',NULL),(34445,'41030486','2024-12-29','15:00:00-21:00:00',NULL,'Domingo','COM','NAJAR MARIA LOURDES',NULL),(34446,'42082594','2024-12-01','10:00:00-16:00:00',NULL,'Domingo','COM','PIERRE PIAZZE, ANTONELLA KAREN',NULL),(34447,'42082594','2024-12-21','10:00:00-16:00:00',NULL,'Sábado','COM','PIERRE PIAZZE, ANTONELLA KAREN',NULL),(34448,'42082594','2024-12-28','10:00:00-16:00:00',NULL,'Sábado','COM','PIERRE PIAZZE, ANTONELLA KAREN',NULL),(34449,'34746806','2024-12-01','09:30:00-15:30:00',NULL,'Domingo','COM','MALANO CARLA',NULL),(34450,'34746806','2024-12-21','09:30:00-15:30:00',NULL,'Sábado','COM','MALANO CARLA',NULL),(34451,'34746806','2024-12-28','09:30:00-15:30:00',NULL,'Sábado','COM','MALANO CARLA',NULL),(34452,'42478187','2024-11-30','08:30:00-14:30:00',NULL,'Sábado','COM','BORSELLINO MUSSA MICAELA JAZMÍN',NULL),(34453,'42478187','2024-12-22','08:30:00-14:30:00',NULL,'Domingo','COM','BORSELLINO MUSSA MICAELA JAZMÍN',NULL),(34454,'38909600','2024-11-30','08:00:00-14:00:00',NULL,'Sábado','COM','DI PRIETO MACARENA',NULL),(34455,'38909600','2024-12-21','08:00:00-14:00:00',NULL,'Sábado','COM','DI PRIETO MACARENA',NULL),(34456,'38909600','2024-12-29','08:00:00-14:00:00',NULL,'Domingo','COM','DI PRIETO MACARENA',NULL),(34457,'43829645','2024-12-08','08:00:00-14:00:00',NULL,'Domingo','COM','FUNES JULIETA SOLEDAD',NULL),(34458,'34746990','2024-11-30','13:30:00-19:30:00',NULL,'Sábado','COM','HADDAD EMIR',NULL),(34459,'34746990','2024-12-14','13:30:00-19:30:00',NULL,'Sábado','COM','HADDAD EMIR',NULL),(34460,'39799067','2024-11-30','15:00:00-21:00:00',NULL,'Sábado','COM','LARA CINTIA NEREA',NULL),(34461,'39799067','2024-12-15','15:00:00-21:00:00',NULL,'Domingo','COM','LARA CINTIA NEREA',NULL),(34462,'42974580','2024-12-14','14:30:00-20:30:00',NULL,'Sábado','COM','QUESADA FLORENCIA AZUL',NULL),(34463,'40869656','2024-12-15','14:30:00-20:30:00',NULL,'Domingo','COM','REYNA CAROLINA JESABEL',NULL),(34464,'37963692','2024-12-14','08:00:00-14:00:00',NULL,'Sábado','COM','SALINAS MARÍA FLORENCIA',NULL),(34465,'37759025','2024-11-30','08:00:00-14:00:00',NULL,'Sábado','COM','VELAZQUEZ MARIA EVELYN',NULL),(34466,'37759025','2024-12-08','08:00:00-14:00:00',NULL,'Domingo','COM','VELAZQUEZ MARIA EVELYN',NULL),(34467,'45140293','2024-12-01','08:30:00-14:30:00',NULL,'Domingo','COM','CASTRO, MARÍA EUGENIA',NULL),(34468,'35623102','2024-12-07','15:00:00-21:00:00',NULL,'Sábado','COM','MORENO, FERNANDO',NULL),(34469,'38579938','2024-12-28','08:00:00-14:00:00',NULL,'Sábado','COM','MAYA JULIETA BELEN',NULL),(34470,'44246630','2024-12-14','08:30:00-14:30:00',NULL,'Sábado','COM','BARRO BRUNO',NULL),(34471,'43635888','2024-11-30','09:00:00-15:00:00',NULL,'Sábado','COM','PEREYRA AGUSTIN',NULL),(34472,'36962928','2024-12-14','10:00:00-16:00:00',NULL,'Sábado','COM','GONZALEZ, DANILO FABIAN',NULL),(34473,'26779137','2024-12-08','16:00:00-22:00:00',NULL,'Domingo','COM','BOMBINI ARTURO RODOLFO',NULL),(34474,'41777113','2024-12-14','15:30:00-21:30:00',NULL,'Sábado','COM','ARENA XIMENA CAROLINA',NULL),(34475,'39018772','2024-12-08','16:00:00-22:00:00',NULL,'Domingo','COM','NUÑEZ MAZA ELISEO EMANUEL',NULL),(34476,'41606519','2024-12-14','16:00:00-22:00:00',NULL,'Sábado','COM','PEREZ MARIA PAULA JESUS',NULL),(34477,'36033010','2024-12-14','15:00:00-21:00:00',NULL,'Sábado','COM','CORDOBA ESTEBAN',NULL),(34478,'40765983','2024-12-14','16:00:00-22:00:00',NULL,'Sábado','COM','CARRIZO, RUBEN ANDRES',NULL),(34479,'40070202','2024-12-14','16:00:00-22:00:00',NULL,'Sábado','COM','GONZÁLEZ, SANTIAGO GENARO',NULL),(34480,'43151429','2024-12-14','08:30:00-14:30:00',NULL,'Sábado','COM','JODAR FLAVIA',NULL),(34481,'42862953','2024-12-14','08:30:00-14:30:00',NULL,'Sábado','COM','TORRES AGÜERO, AILIN DENISE',NULL),(34482,'42506284','2024-11-30','09:00:00-15:00:00',NULL,'Sábado','COM','RODRIGUEZ, SELENE',NULL),(34483,'42506284','2024-12-14','09:00:00-15:00:00',NULL,'Sábado','COM','RODRIGUEZ, SELENE',NULL),(34484,'37780862','2024-11-30','10:00:00-16:00:00',NULL,'Sábado','COM','SEJUDO NICOLAS JESUS',NULL),(34485,'37780862','2024-12-15','10:00:00-16:00:00',NULL,'Domingo','COM','SEJUDO NICOLAS JESUS',NULL),(34486,'36629506','2024-11-30','11:00:00-17:00:00',NULL,'Sábado','COM','VARGAS KARINA MAGALI',NULL),(34487,'36629506','2024-12-14','11:00:00-17:00:00',NULL,'Sábado','COM','VARGAS KARINA MAGALI',NULL),(34488,'40071916','2024-12-07','09:30:00-15:30:00',NULL,'Sábado','COM','ANDREONI FACUNDO SEBASTIAN',NULL),(34489,'29951816','2024-12-14','10:00:00-16:00:00',NULL,'Sábado','COM','PALMERO LUCILA',NULL),(34490,'45722812','2024-11-30','11:00:00-17:00:00',NULL,'Sábado','COM','LONGHITANO JOAQUIN',NULL),(34491,'45722812','2024-12-28','11:00:00-17:00:00',NULL,'Sábado','COM','LONGHITANO JOAQUIN',NULL),(34492,'41272721','2024-12-15','10:00:00-16:00:00',NULL,'Domingo','COM','DIAZ LOPEZ JUAN MANUEL',NULL),(34493,'41272721','2024-12-21','10:00:00-16:00:00',NULL,'Sábado','COM','DIAZ LOPEZ JUAN MANUEL',NULL),(34494,'42974591','2024-12-08','10:00:00-16:00:00',NULL,'Domingo','COM','WOLF MELANIE',NULL),(34495,'96024741','2024-12-08','13:30:00-19:30:00',NULL,'Domingo','COM','RODRIGUEZ ALFONZO NAIYELY HECNAY',NULL),(34496,'41592184','2024-11-30','15:00:00-21:00:00',NULL,'Sábado','COM','CERDA SAN ESTEBAN, DAFNE EYEN',NULL),(34497,'41592184','2024-12-14','15:00:00-21:00:00',NULL,'Sábado','COM','CERDA SAN ESTEBAN, DAFNE EYEN',NULL),(34498,'44059638','2024-11-30','09:00:00-15:00:00',NULL,'Sábado','COM','ABARCA NOELIA',NULL),(34499,'44059638','2024-12-15','09:00:00-15:00:00',NULL,'Domingo','COM','ABARCA NOELIA',NULL),(34500,'44059638','2024-12-22','09:00:00-15:00:00',NULL,'Domingo','COM','ABARCA NOELIA',NULL),(34501,'44984702','2024-12-07','16:00:00-22:00:00',NULL,'Sábado','COM','BRAVO SÁNCHEZ, LUCAS TOMÁS',NULL),(34502,'44984702','2024-12-22','16:00:00-22:00:00',NULL,'Domingo','COM','BRAVO SÁNCHEZ, LUCAS TOMÁS',NULL),(34503,'44984702','2024-12-29','16:00:00-22:00:00',NULL,'Domingo','COM','BRAVO SÁNCHEZ, LUCAS TOMÁS',NULL),(34504,'44058035','2024-12-07','09:00:00-15:00:00',NULL,'Sábado','COM','PACHECO, ANA PAULA',NULL),(34505,'44058035','2024-12-22','09:00:00-15:00:00',NULL,'Domingo','COM','PACHECO, ANA PAULA',NULL),(34506,'44058035','2024-12-29','09:00:00-15:00:00',NULL,'Domingo','COM','PACHECO, ANA PAULA',NULL),(34507,'42421513','2024-12-07','09:00:00-15:00:00',NULL,'Sábado','COM','NIFOSI, JOAQUIN IGNACIO',NULL),(34508,'42421513','2024-12-22','09:00:00-15:00:00',NULL,'Domingo','COM','NIFOSI, JOAQUIN IGNACIO',NULL),(34509,'39381250','2024-12-07','09:00:00-15:00:00',NULL,'Sábado','COM','ILLESCA JULIETA GIMENA',NULL),(34510,'39381250','2024-12-22','09:00:00-15:00:00',NULL,'Domingo','COM','ILLESCA JULIETA GIMENA',NULL),(34511,'37414000','2024-12-07','08:30:00-14:30:00',NULL,'Sábado','COM','FERRI KEVIN',NULL),(34512,'37414000','2024-12-22','08:30:00-14:30:00',NULL,'Domingo','COM','FERRI KEVIN',NULL),(34513,'43542992','2024-12-22','13:30:00-19:30:00',NULL,'Domingo','COM','TOLEDANO MARTINA',NULL),(34514,'43542992','2024-12-29','13:30:00-19:30:00',NULL,'Domingo','COM','TOLEDANO MARTINA',NULL),(34515,'32168589','2024-12-07','14:30:00-20:30:00',NULL,'Sábado','COM','CASTRO NATALIA DEL VALLE',NULL),(34516,'32168589','2024-12-22','14:30:00-20:30:00',NULL,'Domingo','COM','CASTRO NATALIA DEL VALLE',NULL),(34517,'32168589','2024-12-29','14:30:00-20:30:00',NULL,'Domingo','COM','CASTRO NATALIA DEL VALLE',NULL),(34518,'42195778','2024-12-14','14:30:00-20:30:00',NULL,'Sábado','COM','MARTINEZ, PABLO',NULL),(34519,'42195778','2024-12-22','14:30:00-20:30:00',NULL,'Domingo','COM','MARTINEZ, PABLO',NULL),(34520,'45396741','2024-12-07','15:00:00-21:00:00',NULL,'Sábado','COM','CARBAJAL TOBIAS ANDRES',NULL),(34521,'45396741','2024-12-22','15:00:00-21:00:00',NULL,'Domingo','COM','CARBAJAL TOBIAS ANDRES',NULL),(34522,'39767452','2024-12-21','11:30:00-17:30:00',NULL,'Sábado','COM','CATALAN ROCIO DANIELA',NULL),(34523,'39767452','2024-12-29','11:30:00-17:30:00',NULL,'Domingo','COM','CATALAN ROCIO DANIELA',NULL),(34524,'42974543','2024-12-01','14:00:00-20:00:00',NULL,'Domingo','COM','MALANIUK YESICA MAGALI',NULL),(34525,'42974543','2024-12-21','14:00:00-20:00:00',NULL,'Sábado','COM','MALANIUK YESICA MAGALI',NULL),(34526,'42974543','2024-12-28','14:00:00-20:00:00',NULL,'Sábado','COM','MALANIUK YESICA MAGALI',NULL),(34527,'38955795','2024-12-01','14:00:00-20:00:00',NULL,'Domingo','COM','VILLATA LUCAS',NULL),(34528,'38955795','2024-12-21','14:00:00-20:00:00',NULL,'Sábado','COM','VILLATA LUCAS',NULL),(34529,'38955795','2024-12-28','14:00:00-20:00:00',NULL,'Sábado','COM','VILLATA LUCAS',NULL),(34530,'41004440','2024-12-21','08:30:00-14:30:00',NULL,'Sábado','COM','FONSECA, CRISTIAN NATHANIEL',NULL),(34531,'41004440','2024-12-29','08:30:00-14:30:00',NULL,'Domingo','COM','FONSECA, CRISTIAN NATHANIEL',NULL),(34532,'41323804','2024-12-07','09:30:00-15:30:00',NULL,'Sábado','COM','BASSOT, MANOLO',NULL),(34533,'41323804','2024-12-21','09:30:00-15:30:00',NULL,'Sábado','COM','BASSOT, MANOLO',NULL),(34534,'41323804','2024-12-29','09:30:00-15:30:00',NULL,'Domingo','COM','BASSOT, MANOLO',NULL),(34535,'35614444','2024-12-07','08:00:00-14:00:00',NULL,'Sábado','COM','SALAS MAIRA BELEN',NULL),(34536,'35614444','2024-12-21','08:00:00-14:00:00',NULL,'Sábado','COM','SALAS MAIRA BELEN',NULL),(34537,'35614444','2024-12-29','08:00:00-14:00:00',NULL,'Domingo','COM','SALAS MAIRA BELEN',NULL),(34538,'38416997','2024-12-07','09:30:00-15:30:00',NULL,'Sábado','COM','CRUZATE, LUCIANO YAMIL',NULL),(34539,'38416997','2024-12-21','09:30:00-15:30:00',NULL,'Sábado','COM','CRUZATE, LUCIANO YAMIL',NULL),(34540,'38416997','2024-12-29','09:30:00-15:30:00',NULL,'Domingo','COM','CRUZATE, LUCIANO YAMIL',NULL),(34541,'42506126','2024-12-01','15:30:00-21:30:00',NULL,'Domingo','COM','SAYAVEDRA, EMIR SAHID',NULL),(34542,'42506126','2024-12-21','15:30:00-21:30:00',NULL,'Sábado','COM','SAYAVEDRA, EMIR SAHID',NULL),(34543,'42506126','2024-12-28','15:30:00-21:30:00',NULL,'Sábado','COM','SAYAVEDRA, EMIR SAHID',NULL),(34544,'44140029','2024-12-01','09:00:00-15:00:00',NULL,'Domingo','COM','DEL POZZI LAUTARO',NULL),(34545,'44140029','2024-12-14','09:00:00-15:00:00',NULL,'Sábado','COM','DEL POZZI LAUTARO',NULL),(34546,'44140029','2024-12-21','09:00:00-15:00:00',NULL,'Sábado','COM','DEL POZZI LAUTARO',NULL),(34547,'44140029','2024-12-28','09:00:00-15:00:00',NULL,'Sábado','COM','DEL POZZI LAUTARO',NULL),(34548,'39383311','2024-12-01','10:30:00-16:30:00',NULL,'Domingo','COM','TONIOLO GIRAUDO, MARIA VICTORIA',NULL),(34549,'39383311','2024-12-21','10:30:00-16:30:00',NULL,'Sábado','COM','TONIOLO GIRAUDO, MARIA VICTORIA',NULL),(34550,'39383311','2024-12-28','10:30:00-16:30:00',NULL,'Sábado','COM','TONIOLO GIRAUDO, MARIA VICTORIA',NULL),(34551,'42168174','2024-12-01','12:30:00-18:30:00',NULL,'Domingo','COM','CHAZARRETA INTI',NULL),(34552,'42168174','2024-12-21','12:30:00-18:30:00',NULL,'Sábado','COM','CHAZARRETA INTI',NULL),(34553,'42168174','2024-12-29','12:30:00-18:30:00',NULL,'Domingo','COM','CHAZARRETA INTI',NULL),(34554,'41004406','2024-12-07','13:00:00-19:00:00',NULL,'Sábado','COM','AMAYA HOLGADO, MARINA',NULL),(34555,'41004406','2024-12-21','13:00:00-19:00:00',NULL,'Sábado','COM','AMAYA HOLGADO, MARINA',NULL),(34556,'38757823','2024-12-01','09:00:00-15:00:00',NULL,'Domingo','COM','MURCIA KAREN JANET',NULL),(34557,'38757823','2024-12-21','09:00:00-15:00:00',NULL,'Sábado','COM','MURCIA KAREN JANET',NULL),(34558,'38757823','2024-12-28','09:00:00-15:00:00',NULL,'Sábado','COM','MURCIA KAREN JANET',NULL),(34559,'34746960','2024-12-01','08:30:00-14:30:00',NULL,'Domingo','COM','GUERRA TANIA MAGALI',NULL),(34560,'34746960','2024-12-21','08:30:00-14:30:00',NULL,'Sábado','COM','GUERRA TANIA MAGALI',NULL),(34561,'34746960','2024-12-28','08:30:00-14:30:00',NULL,'Sábado','COM','GUERRA TANIA MAGALI',NULL),(34562,'38909244','2024-11-30','13:30:00-19:30:00',NULL,'Sábado','COM','TALAGUIRRE, GABRIEL RICARDO',NULL),(34563,'38909244','2024-12-21','13:30:00-19:30:00',NULL,'Sábado','COM','TALAGUIRRE, GABRIEL RICARDO',NULL),(34564,'38909244','2024-12-28','13:30:00-19:30:00',NULL,'Sábado','COM','TALAGUIRRE, GABRIEL RICARDO',NULL),(34565,'32818889','2024-12-01','09:00:00-15:00:00',NULL,'Domingo','COM','VEGA JUAN VICTOR',NULL),(34566,'32818889','2024-12-21','09:00:00-15:00:00',NULL,'Sábado','COM','VEGA JUAN VICTOR',NULL),(34567,'32818889','2024-12-28','09:00:00-15:00:00',NULL,'Sábado','COM','VEGA JUAN VICTOR',NULL),(34568,'39601031','2024-12-07','10:00:00-16:00:00',NULL,'Sábado','COM','RODRIGUEZ, ALEJANDRA',NULL),(34569,'39601031','2024-12-21','10:00:00-16:00:00',NULL,'Sábado','COM','RODRIGUEZ, ALEJANDRA',NULL),(34570,'40071476','2024-12-07','12:00:00-18:00:00',NULL,'Sábado','COM','SOTO, KAREN DAIANA',NULL),(34571,'40071476','2024-12-21','12:00:00-18:00:00',NULL,'Sábado','COM','SOTO, KAREN DAIANA',NULL),(34572,'26779949','2024-11-30','13:30:00-19:30:00',NULL,'Sábado','COM','TABANERA MARÍA GUADALUPE',NULL),(34573,'26779949','2024-12-21','13:30:00-19:30:00',NULL,'Sábado','COM','TABANERA MARÍA GUADALUPE',NULL),(34574,'26779949','2024-12-28','13:30:00-19:30:00',NULL,'Sábado','COM','TABANERA MARÍA GUADALUPE',NULL),(34575,'43214153','2024-12-01','15:00:00-21:00:00',NULL,'Domingo','COM','GALLARDO, MARIA ELENA',NULL),(34576,'43214153','2024-12-21','15:00:00-21:00:00',NULL,'Sábado','COM','GALLARDO, MARIA ELENA',NULL),(34577,'43214153','2024-12-28','15:00:00-21:00:00',NULL,'Sábado','COM','GALLARDO, MARIA ELENA',NULL),(34578,'38208158','2024-12-07','08:00:00-13:00:00',NULL,'Sábado','COM','FERRERO, CARLA JULIANA',NULL),(34579,'41478599','2024-11-30','08:00:00-14:00:00',NULL,'Sábado','COM','GOMEZ, VALENTINA ALMENDRA',NULL),(34580,'45141749','2024-12-07','08:00:00-14:00:00',NULL,'Sábado','COM','SOSA SOFÍA',NULL),(34581,'45141749','2024-12-28','08:00:00-14:00:00',NULL,'Sábado','COM','SOSA SOFÍA',NULL),(34582,'41101289','2024-11-30','08:30:00-14:30:00',NULL,'Sábado','COM','CAMPOPIANO MILAGROS',NULL),(34583,'41101289','2024-12-15','08:30:00-14:30:00',NULL,'Domingo','COM','CAMPOPIANO MILAGROS',NULL),(34584,'41101289','2024-12-28','08:30:00-14:30:00',NULL,'Sábado','COM','CAMPOPIANO MILAGROS',NULL),(34585,'42010365','2024-12-07','08:30:00-14:30:00',NULL,'Sábado','COM','FERREYRA, NICOL AGUSTINA',NULL),(34586,'41605708','2024-12-08','08:30:00-14:30:00',NULL,'Domingo','COM','GUIZADO AGUSTINA',NULL),(34587,'41605708','2024-12-15','08:30:00-14:30:00',NULL,'Domingo','COM','GUIZADO AGUSTINA',NULL),(34588,'41605708','2024-12-28','08:30:00-14:30:00',NULL,'Sábado','COM','GUIZADO AGUSTINA',NULL),(34589,'42063659','2024-12-08','08:30:00-14:30:00',NULL,'Domingo','COM','HERRERA, ROCÍO DAIANA',NULL),(34590,'44122974','2024-12-07','08:30:00-14:30:00',NULL,'Sábado','COM','RODRIGUEZ NICOLAS AGUSTIN',NULL),(34591,'44122974','2024-12-15','08:30:00-14:30:00',NULL,'Domingo','COM','RODRIGUEZ NICOLAS AGUSTIN',NULL),(34592,'44122974','2024-12-28','08:30:00-14:30:00',NULL,'Sábado','COM','RODRIGUEZ NICOLAS AGUSTIN',NULL),(34593,'39089111','2024-11-30','09:00:00-15:00:00',NULL,'Sábado','COM','GONZALEZ, FACUNDO JESÚS',NULL),(34594,'39089111','2024-12-08','09:00:00-15:00:00',NULL,'Domingo','COM','GONZALEZ, FACUNDO JESÚS',NULL),(34595,'39089111','2024-12-28','09:00:00-15:00:00',NULL,'Sábado','COM','GONZALEZ, FACUNDO JESÚS',NULL),(34596,'42670648','2024-11-30','09:30:00-15:30:00',NULL,'Sábado','COM','MIRANDA LUCIO',NULL),(34597,'43152649','2024-12-07','10:00:00-16:00:00',NULL,'Sábado','COM','CASTILLO GUADALUPE',NULL),(34598,'42451357','2024-11-30','10:00:00-16:00:00',NULL,'Sábado','COM','CONTRERAS, CAMILA MICAELA',NULL),(34599,'42451357','2024-12-07','10:00:00-16:00:00',NULL,'Sábado','COM','CONTRERAS, CAMILA MICAELA',NULL),(34600,'39601215','2024-11-30','10:00:00-16:00:00',NULL,'Sábado','COM','ORELLANO, TALIA NICOLE',NULL),(34601,'39601215','2024-12-15','10:00:00-16:00:00',NULL,'Domingo','COM','ORELLANO, TALIA NICOLE',NULL),(34602,'39601215','2024-12-28','10:00:00-16:00:00',NULL,'Sábado','COM','ORELLANO, TALIA NICOLE',NULL),(34603,'42266122','2024-12-08','10:30:00-16:30:00',NULL,'Domingo','COM','CRUZ NADIA FLORENCIA',NULL),(34604,'40725810','2024-11-30','11:00:00-17:00:00',NULL,'Sábado','COM','FERNANDEZ RAMIRO AGUSTIN',NULL),(34605,'40072141','2024-12-07','13:30:00-19:30:00',NULL,'Sábado','COM','ANACHURI FATIMA AYELEN',NULL),(34606,'41112791','2024-12-01','13:30:00-19:30:00',NULL,'Domingo','COM','GARRO CARLA VALENTINA',NULL),(34607,'40070359','2024-12-08','14:00:00-20:00:00',NULL,'Domingo','COM','MANZANARES MARÍA LUJÁN',NULL),(34608,'45714573','2024-11-30','15:00:00-21:00:00',NULL,'Sábado','COM','BERTONATI MARIA JOSE',NULL),(34609,'45714573','2024-12-15','15:00:00-21:00:00',NULL,'Domingo','COM','BERTONATI MARIA JOSE',NULL),(34610,'45714573','2024-12-28','15:00:00-21:00:00',NULL,'Sábado','COM','BERTONATI MARIA JOSE',NULL),(34611,'39953755','2024-11-30','15:00:00-21:00:00',NULL,'Sábado','COM','DAVILA AGUSTIN',NULL),(34612,'39953755','2024-12-15','15:00:00-21:00:00',NULL,'Domingo','COM','DAVILA AGUSTIN',NULL),(34613,'39953755','2024-12-28','15:00:00-21:00:00',NULL,'Sábado','COM','DAVILA AGUSTIN',NULL),(34614,'43354671','2024-11-30','15:00:00-21:00:00',NULL,'Sábado','COM','MALANIUK, ESTEFANIA',NULL),(34615,'32767080','2024-12-14','15:30:00-21:30:00',NULL,'Sábado','COM','AVALO LUIS',NULL),(34616,'43486096','2024-12-14','16:00:00-22:00:00',NULL,'Sábado','COM','PARELLADA JOSÉ IGNACIO',NULL),(34617,'23081765','2024-12-07','16:00:00-22:00:00',NULL,'Sábado','COM','PEREYRA MARIA NORMA',NULL),(34618,'44140783','2024-11-30','08:00:00-14:00:00',NULL,'Sábado','CROSS','SANDUAY RENATA',NULL),(34619,'44140783','2024-12-14','08:00:00-14:00:00',NULL,'Sábado','CROSS','SANDUAY RENATA',NULL),(34620,'44140783','2024-12-22','08:00:00-14:00:00',NULL,'Domingo','CROSS','SANDUAY RENATA',NULL),(34621,'44140783','2024-12-28','08:00:00-14:00:00',NULL,'Sábado','CROSS','SANDUAY RENATA',NULL),(34622,'41151030','2024-12-01','08:00:00-14:00:00',NULL,'Domingo','CROSS','TRIMARCHI MAITE ALDANA',NULL),(34623,'41151030','2024-12-14','08:00:00-14:00:00',NULL,'Sábado','CROSS','TRIMARCHI MAITE ALDANA',NULL),(34624,'41151030','2024-12-22','08:00:00-14:00:00',NULL,'Domingo','CROSS','TRIMARCHI MAITE ALDANA',NULL),(34625,'28367224','2024-11-30','08:00:00-14:00:00',NULL,'Sábado','CROSS','SANCHEZ NATALIA',NULL),(34626,'28367224','2024-12-07','08:00:00-14:00:00',NULL,'Sábado','CROSS','SANCHEZ NATALIA',NULL),(34627,'28367224','2024-12-21','08:00:00-14:00:00',NULL,'Sábado','CROSS','SANCHEZ NATALIA',NULL),(34628,'40219322','2024-11-30','08:00:00-14:00:00',NULL,'Sábado','CROSS','MORALES MELISA EMILIA',NULL),(34629,'40219322','2024-12-07','08:00:00-14:00:00',NULL,'Sábado','CROSS','MORALES MELISA EMILIA',NULL),(34630,'40219322','2024-12-21','08:00:00-14:00:00',NULL,'Sábado','CROSS','MORALES MELISA EMILIA',NULL),(34631,'42505163','2024-11-30','08:30:00-14:30:00',NULL,'Sábado','CROSS','BAVARESCO TANIA IVONNE',NULL),(34632,'42505163','2024-12-15','08:30:00-14:30:00',NULL,'Domingo','CROSS','BAVARESCO TANIA IVONNE',NULL),(34633,'26245003','2024-12-07','08:30:00-14:30:00',NULL,'Sábado','CROSS','GUTIERREZ MARIANA ALEJANDRA',NULL),(34634,'26245003','2024-12-15','08:30:00-14:30:00',NULL,'Domingo','CROSS','GUTIERREZ MARIANA ALEJANDRA',NULL),(34635,'26245003','2024-12-28','08:30:00-14:30:00',NULL,'Sábado','CROSS','GUTIERREZ MARIANA ALEJANDRA',NULL),(34636,'39768271','2024-12-08','08:30:00-14:30:00',NULL,'Domingo','CROSS','MARIN CECILIA ANTONELLA',NULL),(34637,'39768271','2024-12-29','08:30:00-14:30:00',NULL,'Domingo','CROSS','MARIN CECILIA ANTONELLA',NULL),(34638,'42167468','2024-12-01','09:00:00-15:00:00',NULL,'Domingo','CROSS','OSORIO, NATACHA',NULL),(34639,'42167468','2024-12-14','09:00:00-15:00:00',NULL,'Sábado','CROSS','OSORIO, NATACHA',NULL),(34640,'42167468','2024-12-22','09:00:00-15:00:00',NULL,'Domingo','CROSS','OSORIO, NATACHA',NULL),(34641,'44140989','2024-12-07','09:00:00-15:00:00',NULL,'Sábado','CROSS','SERPA, JOSEFINA',NULL),(34642,'44140989','2024-12-14','09:00:00-15:00:00',NULL,'Sábado','CROSS','SERPA, JOSEFINA',NULL),(34643,'44140989','2024-12-28','09:00:00-15:00:00',NULL,'Sábado','CROSS','SERPA, JOSEFINA',NULL),(34644,'30831608','2024-12-07','09:30:00-15:30:00',NULL,'Sábado','CROSS','GONZALEZ MARIA MARCELA',NULL),(34645,'30831608','2024-12-21','09:30:00-15:30:00',NULL,'Sábado','CROSS','GONZALEZ MARIA MARCELA',NULL),(34646,'40973040','2024-12-07','09:30:00-15:30:00',NULL,'Sábado','CROSS','VILLEGAS LUCIA',NULL),(34647,'40973040','2024-12-15','09:30:00-15:30:00',NULL,'Domingo','CROSS','VILLEGAS LUCIA',NULL),(34648,'39601185','2024-12-07','09:30:00-15:30:00',NULL,'Sábado','CROSS','MORNACCO, JUAN IGNACIO',NULL),(34649,'39601185','2024-12-14','09:30:00-15:30:00',NULL,'Sábado','CROSS','MORNACCO, JUAN IGNACIO',NULL),(34650,'39601185','2024-12-22','09:30:00-15:30:00',NULL,'Domingo','CROSS','MORNACCO, JUAN IGNACIO',NULL),(34651,'46894781','2024-11-30','09:30:00-15:30:00',NULL,'Sábado','CROSS','MARTINEZ, DEMIAN ORIEL',NULL),(34652,'46894781','2024-12-15','09:30:00-15:30:00',NULL,'Domingo','CROSS','MARTINEZ, DEMIAN ORIEL',NULL),(34653,'46894781','2024-12-22','09:30:00-15:30:00',NULL,'Domingo','CROSS','MARTINEZ, DEMIAN ORIEL',NULL),(34654,'28740383','2024-11-30','09:30:00-15:30:00',NULL,'Sábado','CROSS','CASTILLA MARIA BELEN',NULL),(34655,'28740383','2024-12-08','09:30:00-15:30:00',NULL,'Domingo','CROSS','CASTILLA MARIA BELEN',NULL),(34656,'28740383','2024-12-21','09:30:00-15:30:00',NULL,'Sábado','CROSS','CASTILLA MARIA BELEN',NULL),(34657,'28740383','2024-12-29','09:30:00-15:30:00',NULL,'Domingo','CROSS','CASTILLA MARIA BELEN',NULL),(34658,'45142069','2024-12-21','09:30:00-15:30:00',NULL,'Sábado','CROSS','ALANIS LUCIANO EMANUEL',NULL),(34659,'45142069','2024-12-28','09:30:00-15:30:00',NULL,'Sábado','CROSS','ALANIS LUCIANO EMANUEL',NULL),(34660,'35622920','2024-12-15','09:30:00-15:30:00',NULL,'Domingo','CROSS','MARTINEZ, VANESA JANET',NULL),(34661,'35622920','2024-12-28','09:30:00-15:30:00',NULL,'Sábado','CROSS','MARTINEZ, VANESA JANET',NULL),(34662,'35925918','2024-11-30','09:30:00-15:30:00',NULL,'Sábado','CROSS','ULLRICH, MARIA MARTA',NULL),(34663,'35925918','2024-12-08','09:30:00-15:30:00',NULL,'Domingo','CROSS','ULLRICH, MARIA MARTA',NULL),(34664,'37963628','2024-12-21','10:00:00-16:00:00',NULL,'Sábado','CROSS','REYES JAVIER',NULL),(34665,'37963628','2024-12-28','10:00:00-16:00:00',NULL,'Sábado','CROSS','REYES JAVIER',NULL),(34666,'38909669','2024-12-07','10:30:00-16:30:00',NULL,'Sábado','CROSS','RIERA, LUDMILA',NULL),(34667,'38909669','2024-12-15','10:30:00-16:30:00',NULL,'Domingo','CROSS','RIERA, LUDMILA',NULL),(34668,'43180385','2024-12-01','11:00:00-17:00:00',NULL,'Domingo','CROSS','ROVETA CAMILA LUZ',NULL),(34669,'43180385','2024-12-14','11:00:00-17:00:00',NULL,'Sábado','CROSS','ROVETA CAMILA LUZ',NULL),(34670,'43180385','2024-12-29','11:00:00-17:00:00',NULL,'Domingo','CROSS','ROVETA CAMILA LUZ',NULL),(34671,'38416934','2024-11-30','11:00:00-17:00:00',NULL,'Sábado','CROSS','GUIRALDEZ ANA PAULA',NULL),(34672,'38416934','2024-12-22','11:00:00-17:00:00',NULL,'Domingo','CROSS','GUIRALDEZ ANA PAULA',NULL),(34673,'38416934','2024-12-28','11:00:00-17:00:00',NULL,'Sábado','CROSS','GUIRALDEZ ANA PAULA',NULL),(34674,'40973017','2024-12-14','11:00:00-17:00:00',NULL,'Sábado','CROSS','VIDELA LETICIA',NULL),(34675,'40973017','2024-12-21','11:00:00-17:00:00',NULL,'Sábado','CROSS','VIDELA LETICIA',NULL),(34676,'40973017','2024-12-28','11:00:00-17:00:00',NULL,'Sábado','CROSS','VIDELA LETICIA',NULL),(34677,'44004244','2024-12-01','13:30:00-19:30:00',NULL,'Domingo','CROSS','TOMCZYSZYN DELFINA',NULL),(34678,'44004244','2024-12-15','13:30:00-19:30:00',NULL,'Domingo','CROSS','TOMCZYSZYN DELFINA',NULL),(34679,'44004244','2024-12-29','13:30:00-19:30:00',NULL,'Domingo','CROSS','TOMCZYSZYN DELFINA',NULL),(34680,'41645404','2024-12-29','13:30:00-19:30:00',NULL,'Domingo','CROSS','SALOMON TOMAS',NULL),(34681,'42975604','2024-12-21','13:30:00-19:30:00',NULL,'Sábado','CROSS','VIDELA FRANCO ADRIAN',NULL),(34682,'42975604','2024-12-28','13:30:00-19:30:00',NULL,'Sábado','CROSS','VIDELA FRANCO ADRIAN',NULL),(34683,'40157436','2024-11-30','13:30:00-19:30:00',NULL,'Sábado','CROSS','CIPOLLA RAFAELA VICTORIA DEL ROSA',NULL),(34684,'40157436','2024-12-08','13:30:00-19:30:00',NULL,'Domingo','CROSS','CIPOLLA RAFAELA VICTORIA DEL ROSA',NULL),(34685,'39089197','2024-12-01','14:00:00-20:00:00',NULL,'Domingo','CROSS','GUIRALDEZ MARIA LOURDES',NULL),(34686,'39089197','2024-12-14','14:00:00-20:00:00',NULL,'Sábado','CROSS','GUIRALDEZ MARIA LOURDES',NULL),(34687,'39089197','2024-12-29','14:00:00-20:00:00',NULL,'Domingo','CROSS','GUIRALDEZ MARIA LOURDES',NULL),(34688,'40220172','2024-11-30','14:00:00-20:00:00',NULL,'Sábado','CROSS','FARINA MARIA MICAELA',NULL),(34689,'40220172','2024-12-08','14:00:00-20:00:00',NULL,'Domingo','CROSS','FARINA MARIA MICAELA',NULL),(34690,'40220172','2024-12-21','14:00:00-20:00:00',NULL,'Sábado','CROSS','FARINA MARIA MICAELA',NULL),(34691,'42793720','2024-11-30','14:30:00-20:30:00',NULL,'Sábado','CROSS','MONDEJA EMILIANO',NULL),(34692,'42793720','2024-12-08','14:30:00-20:30:00',NULL,'Domingo','CROSS','MONDEJA EMILIANO',NULL),(34693,'42793720','2024-12-21','14:30:00-20:30:00',NULL,'Sábado','CROSS','MONDEJA EMILIANO',NULL),(34694,'44985227','2024-12-07','14:30:00-20:30:00',NULL,'Sábado','CROSS','BARROZO, LUCAS',NULL),(34695,'44985227','2024-12-15','14:30:00-20:30:00',NULL,'Domingo','CROSS','BARROZO, LUCAS',NULL),(34696,'44985227','2024-12-28','14:30:00-20:30:00',NULL,'Sábado','CROSS','BARROZO, LUCAS',NULL),(34697,'42969472','2024-12-01','15:00:00-21:00:00',NULL,'Domingo','CROSS','CARMONA NICOLE ANTONELLA',NULL),(34698,'42969472','2024-12-14','15:00:00-21:00:00',NULL,'Sábado','CROSS','CARMONA NICOLE ANTONELLA',NULL),(34699,'43682219','2024-11-30','15:00:00-21:00:00',NULL,'Sábado','CROSS','VILLAFAÑE JOAQUINA REBECA',NULL),(34700,'43682219','2024-12-14','15:00:00-21:00:00',NULL,'Sábado','CROSS','VILLAFAÑE JOAQUINA REBECA',NULL),(34701,'43682219','2024-12-22','15:00:00-21:00:00',NULL,'Domingo','CROSS','VILLAFAÑE JOAQUINA REBECA',NULL),(34702,'40723897','2024-12-07','15:30:00-21:30:00',NULL,'Sábado','CROSS','SANCHEZ CANALES MATHIAS',NULL),(34703,'40723897','2024-12-14','15:30:00-21:30:00',NULL,'Sábado','CROSS','SANCHEZ CANALES MATHIAS',NULL),(34704,'41562035','2024-12-21','15:30:00-21:30:00',NULL,'Sábado','CROSS','LLAMBIAS MARTINA',NULL),(34705,'41562035','2024-12-28','15:30:00-21:30:00',NULL,'Sábado','CROSS','LLAMBIAS MARTINA',NULL),(34706,'44993492','2024-12-07','15:30:00-21:30:00',NULL,'Sábado','CROSS','MARTINEZ RODRIGO ALEJANDRO',NULL),(34707,'39768198','2024-12-01','16:00:00-22:00:00',NULL,'Domingo','CROSS','ARANO SANTIAGO',NULL),(34708,'39768198','2024-12-14','16:00:00-22:00:00',NULL,'Sábado','CROSS','ARANO SANTIAGO',NULL),(34709,'39768198','2024-12-22','16:00:00-22:00:00',NULL,'Domingo','CROSS','ARANO SANTIAGO',NULL),(34710,'39768198','2024-12-29','16:00:00-22:00:00',NULL,'Domingo','CROSS','ARANO SANTIAGO',NULL),(34711,'42668836','2024-12-21','16:00:00-22:00:00',NULL,'Sábado','CROSS','ROMO, MILAGROS ABRIL',NULL),(34712,'42668836','2024-12-28','16:00:00-22:00:00',NULL,'Sábado','CROSS','ROMO, MILAGROS ABRIL',NULL),(34713,'40070082','2024-12-08','08:00:00-14:00:00',NULL,'Domingo','CROSS','OLIVARES VICTORIA',NULL),(34714,'32133254','2024-11-30','08:30:00-14:30:00',NULL,'Sábado','CROSS','GOMEZ, MARTIN EZEQUIEL',NULL),(34715,'32133254','2024-12-08','08:30:00-14:30:00',NULL,'Domingo','CROSS','GOMEZ, MARTIN EZEQUIEL',NULL),(34716,'40963230','2024-12-07','14:00:00-20:00:00',NULL,'Sábado','CROSS','GOMEZ FLORENCIA BELEN',NULL);
/*!40000 ALTER TABLE `dias_no_habiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feriados`
--

DROP TABLE IF EXISTS `feriados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feriados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feriados`
--

LOCK TABLES `feriados` WRITE;
/*!40000 ALTER TABLE `feriados` DISABLE KEYS */;
/*!40000 ALTER TABLE `feriados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_data`
--

DROP TABLE IF EXISTS `market_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `market_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `plan_name` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `data_gb` int DEFAULT NULL,
  `minutes` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_data`
--

LOCK TABLES `market_data` WRITE;
/*!40000 ALTER TABLE `market_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_metrics`
--

DROP TABLE IF EXISTS `market_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `market_metrics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `market_share` float DEFAULT NULL,
  `arpu` float DEFAULT NULL,
  `churn_rate` float DEFAULT NULL,
  `nps_score` int DEFAULT NULL,
  `network_quality` float DEFAULT NULL,
  `customer_satisfaction` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_metrics`
--

LOCK TABLES `market_metrics` WRITE;
/*!40000 ALTER TABLE `market_metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_data`
--

DROP TABLE IF EXISTS `monthly_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `total_hours` float DEFAULT NULL,
  `total_shifts` int DEFAULT NULL,
  `efficiency` float DEFAULT NULL,
  `statistics` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_data`
--

LOCK TABLES `monthly_data` WRITE;
/*!40000 ALTER TABLE `monthly_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_performance`
--

DROP TABLE IF EXISTS `network_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `network_performance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `region` varchar(50) DEFAULT NULL,
  `technology` varchar(20) DEFAULT NULL,
  `download_speed` float DEFAULT NULL,
  `upload_speed` float DEFAULT NULL,
  `latency` float DEFAULT NULL,
  `availability` float DEFAULT NULL,
  `measurement_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_performance`
--

LOCK TABLES `network_performance` WRITE;
/*!40000 ALTER TABLE `network_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincial_metrics`
--

DROP TABLE IF EXISTS `provincial_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincial_metrics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `market_share` float DEFAULT NULL,
  `market_share_trend` float DEFAULT NULL,
  `portabilidades_in` int DEFAULT NULL,
  `portabilidades_out` int DEFAULT NULL,
  `portabilidad_neta` int DEFAULT NULL,
  `conversiones_totales` int DEFAULT NULL,
  `intentos_venta` int DEFAULT NULL,
  `tasa_conversion` float DEFAULT NULL,
  `metricas_canal` json DEFAULT NULL,
  `datos_competencia` json DEFAULT NULL,
  `potencial_mercado` float DEFAULT NULL,
  `poblacion_total` int DEFAULT NULL,
  `penetracion_actual` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fecha` (`fecha`),
  KEY `idx_provincia` (`provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincial_metrics`
--

LOCK TABLES `provincial_metrics` WRITE;
/*!40000 ALTER TABLE `provincial_metrics` DISABLE KEYS */;
INSERT INTO `provincial_metrics` VALUES (1,'2024-12-27','Buenos Aires',32.5,2.3,1200,800,400,950,1500,63.3,'{\"otros\": 10, \"online\": 30, \"retail\": 45, \"telefonico\": 15}','{\"claro\": 28.5, \"otros\": 13.7, \"personal\": 25.3}',15.2,17000000,85.5),(2,'2024-12-27','CABA',35.8,1.7,800,600,200,750,1000,75,'{\"otros\": 5, \"online\": 35, \"retail\": 40, \"telefonico\": 20}','{\"claro\": 30.1, \"otros\": 11.6, \"personal\": 22.5}',12.5,3000000,92.3);
/*!40000 ALTER TABLE `provincial_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_data`
--

DROP TABLE IF EXISTS `sales_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `sales_amount` float DEFAULT NULL,
  `units_sold` int DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_data`
--

LOCK TABLES `sales_data` WRITE;
/*!40000 ALTER TABLE `sales_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `shift_type` varchar(20) DEFAULT NULL,
  `hours` float DEFAULT NULL,
  `is_weekend` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `shifts_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-27 12:08:16
