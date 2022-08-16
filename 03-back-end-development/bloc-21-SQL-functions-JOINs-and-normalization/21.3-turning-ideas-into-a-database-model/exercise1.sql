-- Exercício 1: Um zoológico precisa de um banco de dados para armazenar informações sobre os seus animais. As informações a serem armazenadas sobre cada animal são:
-- Copiar
-- * Nome;

-- * Espécie;

-- * Sexo;

-- * Idade;

-- * Localização.
-- Cada animal também possui vários cuidadores, e cada cuidador pode ser responsável por mais de um animal. Além disso, cada cuidador possui um gerente, sendo que cada gerente pode ser responsável por mais de um cuidador.
-- Siga os passos aprendidos no dia de hoje para modelar essa base de dados.

Entidades:

animais, cuidadores, gerentes, cuidador_animal

Atributos:

animais -> id, nome, espécie, sexo, idade, localização

cuidadores -> id, nome, gerente_id

gerentes -> id, nome

cuidador_animal -> animal_id, cuidador_id

Relacionamentos:

Relacionamento N:N
Um animal pode ter vários cuidadores 
Um cuidador pode cuidar de vários animais

Relacionamento 1:N
Um gerente pode gerenciar um ou mais cuidadores
Um cuidador possui um gerente

create database if not exists zoologico;
use zoologico;

create table animais (
	id int primary key auto_increment,
    nome varchar(50) not null,
    especie varchar(50) not null,
    sexo varchar(20) not null,
    idade int not null,
    localizacao varchar(50)
);


create table gerentes (
	id int primary key auto_increment,
    nome varchar(50) not null
);

create table cuidadores (
	id int primary key auto_increment,
    nome varchar(50) not null,
    gerente_id int not null,
    foreign key (gerente_id) references gerentes(id)
);

create table cuidador_animal (
	animal_id int,
    cuidador_id int,
    foreign key (animal_id) references animais(id),
    foreign key (cuidador_id) references cuidadores(id)
);