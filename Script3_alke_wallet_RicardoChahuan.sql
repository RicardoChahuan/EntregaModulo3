-- drop database alke_wallet;
use alke_wallet;
-- ALTER SCHEMA `alke_wallet`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_spanish_ci ;
create database alke_wallet;

create table usuario(
user_id int not null primary key auto_increment,
nombre  varchar(45) not null,
correo_electronico varchar(100) not null,
contrasena varchar(45) not null,
saldo int not null
);


create table moneda(
currency_id int not null primary Key auto_increment,
currency_name varchar(30),
currency_symbol char(2),
user_id int,
constraint FK_user_id  foreign key (user_id) references usuario(user_id)
);

create table transaccion(
transaccion_id int not null primary key auto_increment,
sender_user_id int not null,
receiver_user_id int not null,
importe int not null,
transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
user_id int,
currency_id int,
constraint FK_user_id2  foreign key (user_id) references usuario(user_id),
constraint FK_currency_id  foreign key (currency_id) references moneda(currency_id)
);

create table estado_user(
estadoUser_id int not null primary Key auto_increment,
glosa_estado varchar(45)
);

create table estado_transaccion(
estadoTransaccion_id int not null primary Key auto_increment,
glosa_estado varchar(45)
);

insert into usuario (nombre, correo_electronico, contrasena, saldo)
values ('Felipe', 'felipe@gmail.com', 'felipe', 200);
insert into usuario (nombre, correo_electronico, contrasena, saldo)
values ('Javier', 'javier@gmail.com', 'javier', 0);
insert into usuario (nombre, correo_electronico, contrasena, saldo)
values ('Ricardo', 'rchahuan2001@gmail.com', 'primeras', 100);

insert into moneda(currency_name, currency_symbol)
values ('pesos', '$');
insert into moneda(currency_name, currency_symbol)
values ('dolar', 'U$');
insert into moneda(currency_name, currency_symbol)
values ('euro', '€');

insert into estado_user(glosa_estado)
values ('activo');
insert into estado_user(glosa_estado)
values ('inactivo');

insert into estado_transaccion(glosa_estado)
values('iniciada');
insert into estado_transaccion(glosa_estado)
values('terminada');

insert into transaccion(sender_user_id, receiver_user_id, importe, user_id, currency_id)
values(1, 2, 200, 1,3);
insert into transaccion(sender_user_id, receiver_user_id, importe, user_id, currency_id)
values(2, 3, 250, 2, 1);
insert into transaccion(sender_user_id, receiver_user_id, importe, user_id, currency_id)
values(2, 3, 250, 3, 1);
insert into transaccion(sender_user_id, receiver_user_id, importe, user_id, currency_id)
values(2, 3, 250, 2, 1);
insert into transaccion(sender_user_id, receiver_user_id, importe, user_id, currency_id)
values(2, 3, 250, 2, 2);
insert into transaccion(sender_user_id, receiver_user_id, importe, user_id, currency_id)
values(2, 1, 50, 3, 3);

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico
select * from moneda where user_id=3;

-- Consulta para obtener todas las transacciones registradas Consulta para obtener todas las transacciones realizadas por un
-- usuario específico
select * from transaccion where user_id in (1, 3);

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico
select * from usuario;
update usuario 
set correo_electronico = 'felipe@hormail.com'
where user_id=1;

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa)
select * from transaccion;
delete from transaccion where user_id=1