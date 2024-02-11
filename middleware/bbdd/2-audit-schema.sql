/* MariaDB */
/* audit:  Ontopharma interrogation api audit */
create table if not exists audit (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	tenant_id VARCHAR(10) NOT NULL,
	url VARCHAR(255) NOT NULL,
	method VARCHAR(10) NOT NULL,
	request_timestamp TIMESTAMP NOT NULL,
	response_timestamp TIMESTAMP NOT NULL,
	status VARCHAR(3) NOT NULL,
	user_name VARCHAR(255) NOT NULL,
	user_ip VARCHAR(15) NOT NULL,
	request_data LONGTEXT,
	response_data LONGTEXT,
	request_headers TEXT,
	response_headers TEXT
);
