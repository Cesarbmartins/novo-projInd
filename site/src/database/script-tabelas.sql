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
idUsuario int primary key auto_increment,
email varchar(45),
user varchar(45),
senha varchar(45),
fkPersonagem int,
foreign key (fkPersonagem) references personagem(idPersonagem)
);

create table quiz(
idQuiz int,
total int,
fkUsuario int,
foreign key (fkUsuario) references usuario(idUsuario),
primary key (idQuiz,fkUsuario)
);



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
