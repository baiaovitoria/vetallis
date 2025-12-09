use vetallis_db_2_0;

#TABELA USUARIO

insert into usuario (usuario_senha, usuario_email, usuario_nome, usuario_cpf, usuario_cargo) values 
("1234","teste@gmail.com","teste","12345678910","gerente");
insert into usuario (usuario_senha, usuario_email, usuario_nome, usuario_cpf, usuario_cargo) values
("5678","mariaeduardamartinscavallaro@gmail.com", "maria eduarda martins cavallaro","49089469818","diretora"),
("9102", "enzobueno@gmail.com", "enzo","49083719898","desempregado");

update usuario 
set usuario_nome = 'Ana'
where usuario_id = 1;
update usuario
set usuario_cargo = 'professora'
where usuario_id = 2;
update usuario
set usuario_senha = '123a'
where usuario_id = 3;

select *
from usuario;
select usuario_nome 
from usuario 
where usuario_id = 3;
select usuario_cargo, usuario_email
from usuario 
where usuario_id = 2;

delete 
from usuario 
where usuario_id = 3;
delete 
from usuario 
where usuario_id = 1;
delete 
from usuario 
where usuario_id = 2;


#TABELA PRODUTO
insert into produto (produto_nome, produto_quantidade, produto_descricao, produto_lote,produto_cog_barra, produto_categoria) values
("dipirona",13, "cura dor de cabeça","12A","1234567890123","vacina"),
("novalgina",22,"tira cancer","1514B","2345678901234","comprimido"),
("B12",47,"boba muscular","27200C","3456789012345","charope");

update produto
set produto_nome = 'febre amarela'
where produto_id = 1;
update produto
set produto_quantidade = 2
where produto_id = 2;
update produto
set produto_lote = '145L'
where produto_id = 3;

select *
from produto;
select produto_nome 
from produto 
where produto_quantidade >10;
select produto_lote,produto_descricao
from produto
where produto_id = 2;

delete 
from produto
where produto_id = 3;
delete 
from produto
where produto_id = 1;
delete 
from produto 
where produto_id = 2;

#TABELA PEDIDO_SAIDA

insert into pedido_saida (pedido_saida_lote, pedido_saida_nome, pedido_saida_categoria, pedido_saida_quantidade, usuario_usuario_id, produto_produto_id) values
("1540M","paracetamou", "comprimido",2,4,4),
("2000P","losartana","charope",80,5,5),
("13999LU","rivotriu","vacina",200,6,6);

update pedido_saida
set pedido_saida_nome = 'aspirina'
where produto_produto_id = 4;
update pedido_saida
set pedido_saida_categoria = 'vacina'
where produto_produto_id = 5;
update pedido_saida
set pedido_saida_quantidade = 38
where produto_produto_id = 6;

select *
from pedido_saida;
select pedido_saida_nome
from pedido_saida
where usuario_usuario_id = 5;
select pedido_saida_nome,pedido_saida_quantidade
from pedido_saida
where usuario_usuario_id = 6;

delete 
from pedido_saida
where pedido_saida_id = 4;
delete 
from pedido_saida
where pedido_saida_id = 5;
delete 
from pedido_saida
where pedido_saida_id = 6;

#TABELA PEDIDO_ENTRADA
insert into pedido_entrada (pedido_ent_lote, pedido_ent_nome, pedido_ent_categoria, pedido_ent_quantidade,pedido_ent_descricao, usuario_usuario_id, produto_produto_id) values
("1540M","paracetamou", "comprimido",2,"dor de cabeça",4,4),
("2000P","losartana","charope",80,"dor nas costas",5,5),
("13999LU","rivotriu","vacina",200,"passar vomito",6,6);

update pedido_entrada
set pedido_ent_nome = 'aspirina'
where produto_produto_id = 4;
update pedido_entrada
set pedido_ent_categoria = 'vacina'
where produto_produto_id = 5;
update pedido_entrada
set pedido_ent_quantidade = 38
where produto_produto_id = 6;

select *
from pedido_entrada;
select pedido_ent_nome
from pedido_entrada
where usuario_usuario_id = 5;
select pedido_ent_nome,pedido_ent_quantidade
from pedido_entrada
where usuario_usuario_id = 6;

delete 
from pedido_entrada
where pedido_ent_id = 1;
delete 
from pedido_entrada
where pedido_ent_id = 2;
delete 
from pedido_entrada
where pedido_ent_id = 3;

#TABELA LISTA COMPRA
alter table lista_compra
add column lista_compra_status varchar (45);

insert into lista_compra (lista_compra_nome, lista_compra_quantidade, lista_compra_valor,produto_produto_id,lista_compra_status) values
("comprar dipirona",12,50.00,4,"vencendo"),
("comprar losartano",100,200.50,5,"esgotado"),
("comprar novalgina",30,100.00,6,"esgotando");

update lista_compra
set lista_compra_nome = ' comprar aspirina'
where produto_produto_id = 4;
update lista_compra
set lista_compra_valor = 150.00
where produto_produto_id = 5;
update lista_compra
set lista_compra_status = 'venceu'
where produto_produto_id = 6;

select *
from lista_compra;
select lista_compra_nome
from lista_compra
where produto_produto_id = 5;
select lista_compra_nome,lista_compra_valor
from lista_compra
where produto_produto_id = 6;

delete 
from lista_compra
where lista_compra_id = 1;
delete 
from lista_compra
where lista_compra_id = 2;
delete 
from lista_compra
where lista_compra_id = 3;

insert into controle_saida (controle_saida_motivo, controle_saida_quantidade, controle_saida_nome,controle_saida_data,pedido_saida_pedido_saida_id) values
("dor de barriga",2,"dipirona","2025-12-04",7),
("verme",3,"vermifog","2025-12-05",8),
("colica",5,"buscopa","2025-12-06",9);

update controle_saida
set controle_saida_motivo = 'dor de cabeça'
where pedido_saida_pedido_saida_id = 7;
update controle_saida
set controle_saida_quantidade = 16
where pedido_saida_pedido_saida_id = 8;
update controle_saida
set controle_saida_data = '2025-12-03'
where pedido_saida_pedido_saida_id = 9;

select *
from controle_saida;
select controle_saida_nome
from controle_saida
where pedido_saida_pedido_saida_id = 8;
select controle_saida_nome,controle_saida_data
from controle_saida
where pedido_saida_pedido_saida_id = 9;

delete 
from controle_saida
where controle_saida_id = 4;
delete 
from controle_saida
where controle_saida_id = 5;
delete 
from controle_saida
where controle_saida_id = 6;

#TABELA CONTROLE ENTRADA

insert into controle_entrada (controle_entrada_quantidade,controle_entrada_nome, controle_entrada_descricao,controle_entrada_data,pedido_entrada_pedido_ent_id) values
(3,"dipirona","dor","2025-12-04",4),
(4,"vermifog","verme","2025-12-05",5),
(5,"buscopa","colica","2025-12-06",6);

update controle_entrada
set controle_entrada_nome = 'buscofem'
where pedido_entrada_pedido_ent_id = 4;
update controle_entrada
set controle_entrada_quantidade = 16
where pedido_entrada_pedido_ent_id = 5;
update controle_entrada
set controle_entrada_data = '2025-12-03'
where pedido_entrada_pedido_ent_id = 6;

select *
from controle_entrada;
select controle_entrada_nome
from controle_entrada
where pedido_entrada_pedido_ent_id = 5;
select controle_entrada_nome,controle_entrada_data
from controle_entrada
where pedido_entrada_pedido_ent_id = 6;

delete 
from controle_entrada
where pedido_entrada_pedido_ent_id = 4;
delete 
from controle_entrada
where pedido_entrada_pedido_ent_id = 5;
delete 
from controle_entrada
where pedido_entrada_pedido_ent_id = 6;

#tabela historico saida 

INSERT INTO historico_saida (historico_saida_quantidade, historico_saida_data, controle_saida_controle_saida_id)
VALUES (7, '2025-09-13', 7),
(9, '2025-09-01', 8),
(12, '2025-12-03', 9);

UPDATE historico_saida
SET historico_saida_quantidade = 16
WHERE controle_saida_controle_saida_id= 7;
UPDATE historico_saida
SET historico_saida_data = '2025-11-13'
WHERE controle_saida_controle_saida_id= 8;

SELECT * FROM historico_saida;
SELECT historico_saida_quantidade FROM historico_saida
WHERE  historico_saida_quantidade >10;
SELECT historico_saida_data FROM historico_saida
WHERE historico_saida_quantidade =12;

DELETE FROM historico_saida
WHERE controle_saida_controle_saida_id=7;
DELETE FROM historico_saida
WHERE controle_saida_controle_saida_id=8;
DELETE FROM historico_saida
WHERE controle_saida_controle_saida_id =9;

#TABELA HISTORICO ENTRADA

INSERT INTO historico_entrada (historico_entrada_quantidade, historico_entrada_data, controle_entrada_controle_entrada_id) VALUES
( 20,'2025-12-04',4),
( 50,'2025-12-05',5),
(105, '2025-12-06', 6);

UPDATE historico_entrada
SET historico_entrada_data = '2026-01-05'
WHERE controle_entrada_controle_entrada_id =10;
UPDATE historico_entrada
SET historico_entrada_quantidade = 280 
WHERE controle_entrada_controle_entrada_id = 12;
UPDATE historico_entrada
SET historico_entrada_data= '2025-12-06'
WHERE controle_entrada_controle_entrada_id = 11; 
UPDATE historico_saida
SET historico_saida_data = '2025-09-01'
WHERE controle_saida_controle_saida_id= 13;

SELECT * FROM historico_entrada;
SELECT historico_entrada_data
FROM historico_entrada
WHERE controle_entrada_controle_entrada_id = 10;
SELECT historico_entrada_quantidade, historico_entrada_data
FROM historico_entrada
WHERE controle_entrada_controle_entrada_id= 12;

DELETE 
FROM historico_entrada
WHERE historico_entrada_id = 1;
DELETE 
FROM historico_entrada
WHERE historico_entrada_id = 2;
DELETE 
FROM historico_entrada
WHERE historico_entrada_id = 3;

INSERT INTO  dados_sensor(dados_sensor_nome, dados_sensor_tipo, dados_sensor_local, dados_sensor_status, dados_sensor_data_install) VALUES
('DHT11','umidade', 'cant parede sul', 'funcionando','2025-12-10'),
('RC522','rfid', 'cant parede norte', 'delay','2025-12-15'),
('lcd','display', 'cant parede oeste', 'quebrado','2025-12-20');

UPDATE dados_sensor
SET dados_sensor_nome = 'dht49'
WHERE dados_sensor_id = 1;
UPDATE dados_sensor
SET dados_sensor_tipo = 'calor'
WHERE dados_sensor_id = 2;
UPDATE dados_sensor
SET dados_sensor_local = 'parede norte'
WHERE dados_sensor_id = 3;

SELECT *
FROM dados_sensor;
SELECT dados_sensor_nome
FROM dados_sensor
WHERE dados_sensor_id = 2;
SELECT dados_sensor_nome, dados_sensor_tipo
FROM dados_sensor
WHERE dados_sensor_id = 3;

DELETE 
FROM dados_sensor
WHERE dados_sensor_id = 1;
DELETE 
FROM dados_sensor
WHERE dados_sensor_id = 2;
DELETE 
FROM dados_sensor
WHERE dados_sensor_id = 3;

#TABELA HISTORICO SENSOR
insert into historico_sensor (historico_sensor_dados, dados_sensor_dados_sensor_id) values
("sensor parado",1),
("sensor quebrado",2),
("sensor funcionando",3);

update historico_sensor
set historico_sensor_dados = 'funcionando'
where dados_sensor_dados_sensor_id = 1;
update historico_sensor
set historico_sensor_dados = 'parado'
where dados_sensor_dados_sensor_id = 2;
update historico_sensor
set historico_sensor_dados = 'quebrado'
where dados_sensor_dados_sensor_id = 3;

select *
from historico_sensor;
select historico_sensor_dados
from historico_sensor
where dados_sensor_dados_sensor_id = 1;
select historico_sensor_dados
from historico_sensor
where dados_sensor_dados_sensor_id = 2;

delete 
from historico_sensor
where dados_sensor_dados_sensor_id = 1;
delete 
from historico_sensor
where dados_sensor_dados_sensor_id = 2;
delete 
from historico_sensor
where dados_sensor_dados_sensor_id = 3;