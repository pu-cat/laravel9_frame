#docker-compose up��create user�ŃG���[�ɂȂ����ꍇ�A�ȉ���L���ɂ���
#drop user 'root';
create user 'root'@'127.0.0.1' identified by 'root';
grant all on *.* to 'root'@'127.0.0.1' with grant option;
create user 'admin'@'localhost' identified by 'root';
grant all on *.* to 'root'@'localhost' with grant option;
flush privileges;