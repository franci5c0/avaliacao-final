
-- 1. Criação do Banco de Dados

create database sistema_finance;

use sistema_finance;

-- 2. Criação de Tabelas

CREATE TABLE clientes ( 
id INT AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(100), 
Data_Nascimento DATE, 
Estado_Civil CHAR(1), 
Sexo CHAR(1), 
Cidade VARCHAR(100), 
idade INT 
); 

INSERT INTO clientes (nome, Data_Nascimento, Estado_Civil, Sexo, Cidade, idade) 
VALUES 
('João', '1988-01-03', 'S', 'M', 'São Paulo', 36), 
('Maria', '1990-02-14', 'C', 'F', 'Rio de Janeiro', 34), 
('Carlos', '1988-01-03', 'S', 'M', 'São Paulo', 36), 
('Ana', '1995-06-21', 'S', 'F', 'Salvador', 28), 
('Pedro', '1988-01-03', 'C', 'M', 'São Paulo', 36);

CREATE TABLE pedidos ( 
id INT AUTO_INCREMENT PRIMARY KEY, 
cliente_id INT, 
produto VARCHAR(100), 
quantidade INT, 
FOREIGN KEY (cliente_id) REFERENCES clientes(id) 
); 

INSERT INTO pedidos (cliente_id, produto, quantidade) VALUES 
(1, 'Produto A', 10), 
(2, 'Produto B', 5), 
(1, 'Produto C', 2); 

CREATE TABLE produtos ( 
id INT AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(100), 
preco DECIMAL(10, 2) 
); 

INSERT INTO produtos (nome, preco) VALUES 
('Produto A', 100.50), 
('Produto B', 200.00), 
('Produto C', 150.75); 

CREATE TABLE estoque ( 
produto_id INT, 
quantidade_disponivel INT
); 

INSERT INTO estoque (produto_id, quantidade_disponivel) VALUES 
(1, 50), 
(2, 20), 
(3, 10);

-- parte 2 / questão 4 --> operações CRUD

-- inserção / questão 4 / parte 2

INSERT INTO clientes (nome, Data_Nascimento, Estado_Civil, Sexo, Cidade, idade) 
VALUES 
('william', '1988-01-03', 'S', 'M', 'parnaíba', 36);

INSERT INTO pedidos (cliente_id, produto, quantidade) VALUES 
(4, 'Produto D', 12);

INSERT INTO produtos (nome, preco) VALUES 
('Produto D', 101.00);

INSERT INTO estoque (produto_id, quantidade_disponivel) VALUES 
(4, 70);

-- leitura do CRUD / questão 4 / parte 2

select * from clientes;

select * from pedidos;

select * from produtos;

select * from estoque;

-- atualização de dados / questão 4 / parte 2 

update clientes set estado_civil = 'C' where id = '6';

update pedidos set quantidade = '11' where id = '4';

update produtos set preco = '90.00' where id = '4';

update estoque set quantidade_disponivel = '50' where produto_id = '4';

-- exclusão de dados / questão 4 / parte 2

delete from clientes where id = '6';

delete from pedidos where id = 4;

delete from estoque where produto_id = 4;

-- parte 2 / questão 5 ---> consultas SQL avançadas

-- consulta de idade (acima de 30 anos) / questão 5 / parte 2

select * from clientes where idade > 30;

-- criação de endereço / questão 5 / parte 2

alter table clientes add column endereço varchar(100);

-- alteração de endereço específico / questão 5 / parte 2

update clientes set endereço = 'rua mangueira mole' where id = 1;

update clientes set endereço = 'rua ariana grande' where id = 2; -- extra

update clientes set endereço = 'rua xandão' where id = 3; -- extra 

update clientes set endereço = 'rua manoel gomes' where id = 4; -- extra

update clientes set endereço = 'rua alisa meu pelo' where id = 5; -- extra

-- deletando pedidos feitos por um cliente específico / questão 5 / parte 2

delete from pedidos where cliente_id = 1; -- pedido do cliente 1 deletado

-- inserindo múltiplos produtos no estoque de uma só vez / questão 5 / parte 2

INSERT INTO estoque (produto_id, quantidade_disponivel) VALUES 
(7, 30), 
(8, 80), 
(9, 20),
(10, 5);

-- atualizando preço de todos os produtos com um aumento de 10% / questão 5 / parte 2

update produtos set preco = preco * 1.1 where id = 1;

update produtos set preco = preco * 1.1 where id = 2;

update produtos set preco = preco * 1.1 where id = 3;

update produtos set preco = preco * 1.1 where id = 4;

select * from clientes;
select * from estoque;
select * from pedidos;
select * from produtos;
