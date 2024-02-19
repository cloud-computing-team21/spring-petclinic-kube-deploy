/* MariaDB */
/* Crea la base de datos propia para ontopharma_int_client */
CREATE DATABASE ontopharma_int_client;
/* Crea el usuario con los permisos necesarios para administrar y usar la base de datos creada. */
/*CREATE USER 'ontoadmin_int_client'@'%' IDENTIFIED BY 'test1234'; */
GRANT Alter ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT Create ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT Create view ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT Delete ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT Drop ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT Grant option ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT Index ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT Insert ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT References ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT Select ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT Show view ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT Trigger ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
GRANT Update ON ontopharma_int_client.* TO 'ontoadmin_int_client'@'%' ;
FLUSH PRIVILEGES ;