-- Crear la base de datos
drop database if exists WebVenta_MaMiDaJu;
create database WebVenta_MaMiDaJu;
use WebVenta_MaMiDaJu;

-- Crear la tabla productos si no existe
create table if not exists productos(
    id int,
    nombre varchar(20),
    precio float,
    categoria varchar(20),
    fecha_creacion date,
    stock int,
    constraint pk1 primary key (id)
);

-- Crear la tabla compras_detalles si no existe
create table if not exists compras_detalles(
    id int,
    compra_id int,
    producto_id int,
    precio float,
    cantidad int,
    constraint pk2 primary key (id),
    constraint fk1 foreign key (compra_id) references compras(id),
    constraint fk2 foreign key (producto_id) references productos(id)
);

-- Crear la tabla productos_opciones si no existe
create table if not exists productos_opciones(
    id int,
    opcion_id int,
    producto_id int,
    constraint pk3 primary key (id),
    constraint fk3 foreign key (opcion_id) references opciones(id),
    constraint fk4 foreign key (producto_id) references productos(id)
);

-- Crear la tabla productos_categorias si no existe
create table if not exists productos_categorias(
    id int,
    producto_id int,
    categoria_id int,
    constraint pk4 primary key (id),
    constraint fk5 foreign key (producto_id) references productos(id),
    constraint fk6 foreign key (categoria_id) references categorias(id)
);

-- Crear la tabla compras si no existe
create table if not exists compras(
    id int,
    cliente_id int,
    total float,
    envio_direccion varchar(50),
    compra_direccion varchar(50),
    compra_email varchar(40),
    compra_fecha date,
    compra_estado varchar(10),
    constraint pk5 primary key (id)
    constraint fk7 foreign key (cliente_id) references clientes(id)
);

-- Crear la tabla opciones si no existe
create table if not exists opciones(
    id int,
    opcion_nombre varchar(25),
    constraint pk6 primary key (id),
);

-- Crear la tabla categorias si no existe
create table if not exists categorias(
    id int,
    nombre varchar(20),
    descripcion varchar(350),
    constraint pk7 primary key (id),
);

-- Crear la tabla clientes si no existe
create table if not exists clientes(
    id int,
    email varchar(35),
    contraseña varchar(25),
    nombre varchar(20),
    -- El tipo de dato aquí definido es para permitir el almacenamiento de PDFs en la BBDD
    factura VARBINARY(MAX),
    pordefecto_envio_direccion varchar(50),
    pais (15),
    telefono int,
    constraint pk8 primary key (id),
);