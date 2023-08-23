-- apagando banco de dados
drop database dbPadariaCarmel;
-- criando banco de dados
create database dbPadariaCarmel;
-- acessando banco de dados
use dbPadariaCarmel;

-- criando as tabelas
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(15),
cpf char(14) unique,
endereco varchar(100),
numero varchar(10),
bairro varchar(100),
cidade varchar(100),
estado char(2),
cep char(9),
primary key(codFunc)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(10),
primary key(codCli)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cnpj char(18) not null unique,
primary key(codForn));

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(14) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

-- insert into tbUsuarios(nome,senha,codFunc)values(@nome,@senha,@codFunc);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
dataEntrada date,
horaEntrada time,
quantidade decimal(9,2),
valorUnit decimal(9,2),
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn));

create table tbVendas(
codVenda int not null auto_increment,
codUsu int not null,
codCli int not null,
codProd int not null,
dataVenda date,
quantidade decimal(9,2),
valorTotal decimal(9,2),
primary key(codVenda),
foreign key(codUsu) references tbUsuarios(codUsu),
foreign key(codCli) references tbClientes(codCli),
foreign key(codProd) references tbProdutos(codProd));



insert into tbFuncionarios	(nome,email,telCel,cpf,	endereco,numero,bairro,cidade,estado,cep)values('Senac Largo Treze','sac@sp.senac.br','(11) 95824-7859','258.365.952-88','Rua Dr. Antônio Bento','355','Santo Amaro','São Paulo','SP','04750-000');
insert into tbUsuarios(nome,senha,codFunc) values('senac','senac',1);

	

desc tbFuncionarios;
select * from tbFuncionarios;

desc tbUsuarios;
select * from tbUsuarios;

-- pesquisa por codigo
select nome from tbFuncionarios where codFunc = 1;

-- pesquisa por nome
select nome from tbFuncionarios where nome like '%a%';

select * from tbFuncionarios where nome like '%a%';

-- alterar funcionario
-- update tbFuncionarios set nome = @nome,email =@email,telCel=@telCel,cpf=@cpf,endereco=@endereco,numero=@numero,bairro=@bairro,cidade=@cidade,estado=@estado,cep=@cep where codFunc=@codFunc;

-- excluir funcionário
-- delete from tbFuncionarios where codFunc=1;


-- buscar usuario e senha se exite no banco de dados

select * from tbUsuarios where nome = 'senac' and senha = 'senac';

