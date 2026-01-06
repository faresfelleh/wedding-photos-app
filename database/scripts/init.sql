-- création de l'utilisateur et de la base de données
CREATE DATABASE IF NOT EXISTS wedding_db;
CREATE DATABASE IF NOT EXISTS wedding_dev;
CREATE DATABASE IF NOT EXISTS wedding_test;

-- créer un utilisateur dédié
CREATE USER IF NOT EXISTS 'wedding_user'@'localhost' IDENTIFIED BY 'wedding_password';
CREATE USER IF NOT EXSITS 'wedding_user'@'%'IDENTIFIED BY 'wedding_password';

-- Accorder les privilèges
GRANT ALL PRIVILEGES ON wedding_db.* TO 'wedding_user'@'localhost';
GRANT ALL PRIVILEGES ON wedding_dev.* TO ' wedding_user'@'localhost';
GRANT ALL PRIVILEGES ON wedding_test.* TO 'wedding_user'@'localhost';
GRANT ALL PRIVILEGES ON wedding_db.* TO 'wedding_user'@'%'; 	
GRANT ALL PRIVILEGES ON wedding_dev.* TO 'wedding_user'@'%';
GRANT ALL PRIVILEGES ON wedding_test.* TO 'wedding_user'@'%';

FLUSH PRIVILEGES;

-- créér les tables (exemple basique)
USE wedding_db;

CREATE TABLE IF NOT EXISTS weddings(
   id BIGINT AUTO_INCREMENT PRIMARY KEY,
   bride_name VARCHAR(100) NOT NULL,
   groom_name VARCHAR(100) NOT NULL,
   wedding_date DATE NOT NULL,
   event_code VARCHAR(50) UNIQUE NOT NULL,
   location VARCHAR(200),
   description TEXT,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   is_active BOOLEAN DEFAULT TRUE);
   
CREATE TABLE IF NOT EXISTS photos(
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  wedding_id BIGINT NOT NULL,
  file_name VARCHAR(255) NOT NULL,
  title VARCHAR(200),
  description TEXT,
  file_path VARCHAR(500) NOT NULL,
  file_size BIGINT,
  file_type VARCHAR(100),
  upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_approved BOOLEAN DEFAULT TRUE,
  FOREGIN KEY(wedding_id) REFERENCES weddings(id) ON DELETE CASCADE);

