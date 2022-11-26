-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

create database projetolegal;
use projetolegal;

create table personagem(
idPersonagem int primary key auto_increment,
nome varchar(45)
);

insert into personagem values
(null,'Luffy'),
(null,'Zoro'),
(null,'Nami'),
(null,'Sanji'),
(null,'Usopp');


create table usuario(
id int primary key auto_increment,
email varchar(45),
user varchar(45),
senha varchar(45),
fkPersonagem int,
foreign key (fkPersonagem) references personagem(idPersonagem)
);

create table quiz(
idQuiz int auto_increment,
total int,
fkUsuario int,
foreign key (fkUsuario) references usuario(id),
primary key (idQuiz,fkUsuario)
);



CREATE TABLE coment (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

select * from usuario;
select * from quiz;
select * from personagem;
select * from aviso;



select u.user,p.nome from usuario as u join personagem as p on u.fkPersonagem=p.idPersonagem;

select u.user,q.total from quiz as q join usuario as u on u.idUsuario=q.fkUsuario;

select u.id,u.user,c.titulo,c.descricao from usuario as u join coment as c on u.id=c.fk_usuario;

select u.user,p.nome,c.titulo,c.descricao from usuario as u join coment as c on u.id=c.fk_usuario
                                                                              join personagem as p on u.fkPersonagem=p.idPersonagem;


/*
comandos para criar usuário em banco de dados azure, sqlserver,
com permissão de insert + update + delete + select
*/

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
