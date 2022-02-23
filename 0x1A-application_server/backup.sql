
;

;

;

;

;

;

;

;

;

;

CREATE DATABASE
`hbnb_dev_db`
;

USE `hbnb_dev_db`;

DROP TABLE IF EXISTS `amenities`;

;

;

CREATE TABLE `amenities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

;

LOCK TABLES `amenities` WRITE;

;

INSERT INTO
  `amenities`
VALUES
  (
    '4a7fed83-d553-444e-8da8-58fa4267a12d',
    '2022-02-16 20:36:09',
    '2022-02-16 20:36:09',
    'garage'
  ),
  (
    'c2595197-a496-42ab-ae32-d0130a754723',
    '2022-02-16 20:36:30',
    '2022-02-16 20:36:30',
    'CableTv'
  ),
  (
    'd60e5577-f4c0-422c-b6a9-f2cf4aeb3aa4',
    '2022-02-16 20:36:06',
    '2022-02-16 20:36:06',
    'Wifi'
  );

;

UNLOCK TABLES;

DROP TABLE IF EXISTS `cities`;

;

;

CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

;

LOCK TABLES `cities` WRITE;

;

INSERT INTO
  `cities`
VALUES
  (
    'b915a663-0ead-4539-a8b1-2acf849769f9',
    '2022-02-10 20:09:48',
    '2022-02-10 20:09:48',
    '4ecf91a4-9aa8-40ca-a115-5a19d741b0f1',
    'Medellín'
  );

;

UNLOCK TABLES;

DROP TABLE IF EXISTS `place_amenity`;

;

;

CREATE TABLE `place_amenity` (
  `place_id` varchar(60) NOT NULL,
  `amenity_id` varchar(60) NOT NULL,
  PRIMARY KEY (`place_id`, `amenity_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `place_amenity_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `place_amenity_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

;

LOCK TABLES `place_amenity` WRITE;

;

;

UNLOCK TABLES;

DROP TABLE IF EXISTS `places`;

;

;

CREATE TABLE `places` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `number_rooms` int NOT NULL,
  `number_bathrooms` int NOT NULL,
  `max_guest` int NOT NULL,
  `price_by_night` int NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

;

LOCK TABLES `places` WRITE;

;

INSERT INTO
  `places`
VALUES
  (
    '079541d2-0a9e-42d9-a897-00996f6a8c73',
    '2022-02-10 20:29:57',
    '2022-02-10 20:29:57',
    'b915a663-0ead-4539-a8b1-2acf849769f9',
    'aae6d161-1078-4fdc-92a7-77ec93d178a3',
    'Hotel Casa Rosales habitación doble',
    'Casa Rosales es su hogar lejos de casa en la hermosa ciudad de Medellín Colombia. Ubicado en una zona residencial segura, cerca del Aeropuerto Olaya Herrera (EOH)',
    2,
    2,
    3,
    45,
    1.555,
    2.5498
  ),
  (
    'cedbdce8-8cf9-4661-a96b-08d0fc3ca87d',
    '2022-02-10 20:11:38',
    '2022-02-10 20:11:38',
    'b915a663-0ead-4539-a8b1-2acf849769f9',
    'aae6d161-1078-4fdc-92a7-77ec93d178a3',
    'Habitación Privada Medellín',
    'Estrictos protocolos de bioseguridad para garantizar una estancia segura en nuestras instalaciones, a solo 5 minutos de la estación de metro, cerca a lugares turísticos y punto de información de tours dentro de nuestras instalaciones además de la la mejor vista garantizada de la ciudad.',
    2,
    2,
    2,
    50,
    23.6664,
    19.558
  ),
  (
    'd178b724-5069-414a-8914-d7e80512c3f6',
    '2022-02-10 20:31:37',
    '2022-02-10 20:31:37',
    'b915a663-0ead-4539-a8b1-2acf849769f9',
    'aae6d161-1078-4fdc-92a7-77ec93d178a3',
    'Acogedora Habitación-New Hotel in Medellin',
    'Este pequeño Nuevo Hotel Boutique, ha sido pensado para que disfrute cómodamente la ciudad de Medellín, una calidad hospitalidad y excelente gastronomía.',
    1,
    1,
    2,
    85,
    1.555,
    2.5498
  );

;

UNLOCK TABLES;

DROP TABLE IF EXISTS `reviews`;

;

;

CREATE TABLE `reviews` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

;

LOCK TABLES `reviews` WRITE;

;

;

UNLOCK TABLES;

DROP TABLE IF EXISTS `states`;

;

;

CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

;

LOCK TABLES `states` WRITE;

;

INSERT INTO
  `states`
VALUES
  (
    '4ecf91a4-9aa8-40ca-a115-5a19d741b0f1',
    '2022-02-10 20:09:07',
    '2022-02-10 20:09:07',
    'Antioquia'
  );

;

UNLOCK TABLES;

DROP TABLE IF EXISTS `users`;

;

;

CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

LOCK TABLES `users` WRITE;

INSERT INTO
  `users`
VALUES
  (
    'aae6d161-1078-4fdc-92a7-77ec93d178a3',
    '2022-02-10 20:08:45',
    '2022-02-10 20:08:45',
    'crstngranada@gmail.com',
    '123456789',
    'Cristian',
    'Granada'
  );

UNLOCK TABLES;