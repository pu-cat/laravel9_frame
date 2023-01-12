#docker-compose upのcreate userでエラーになった場合、以下を有効にする
#drop user 'root';
create user 'root'@'127.0.0.1' identified by 'root';
grant all on *.* to 'root'@'127.0.0.1' with grant option;
create user 'admin'@'localhost' identified by 'root';
grant all on *.* to 'root'@'localhost' with grant option;
flush privileges;