--- Creacion Base de datos ---
------------------------------
CREATE DATABASE
    Base_de_datos_uni;

    
--- Crear Tabla clientes ---
----------------------------
CREATE Table if not exists base_de_datos_uni. Clientes(
    Rut int not null,
    Nombre VARCHAR(50) not null,
    Apellido VARCHAR(50) not null,
    CorreoElectronico VARCHAR(50) not null unique,
    Fecha_Ingreso date not null,
    Ultimo_Acceso date not null,
    Activo VARCHAR(2) not null,
    Tipo VARCHAR(15) not null,
    PRIMARY KEY (Rut),
    constraint CK_Activo CHECK(Activo in ('Si', 'No')),
    constraint CK_Tipo CHECK(Tipo in ('Empresa', 'Persona Natural'))
);


--- Crear tabla Direcciones ---
-------------------------------
CREATE Table if not exists base_de_datos_uni. Direcciones(
    ID_Direccion int not null AUTO_INCREMENT,
    Comuna VARCHAR(50) not null,
    Calle VARCHAR(50) not null,
    Numeracion VARCHAR(50) not null,
    PRIMARY KEY (ID_Direccion)
);



--- Crear tabla Dirreciones Clientes ---
----------------------------------------
CREATE Table if not exists base_de_datos_uni. Dirreciones_Clientes(
    Direccion_ID_Direccion int not null,
    Cliente_Rut int not null,
    Foreign Key (Direccion_ID_Direccion) REFERENCES base_de_datos_uni. Direcciones(ID_Direccion),
    Foreign Key (Cliente_Rut) REFERENCES base_de_datos_uni. Clientes(Rut)
);


--- Crear tabla Pagos ---
-------------------------
CREATE table if not exists base_de_datos_uni. Pagos(
    ID_Pago int not null AUTO_INCREMENT,
    Fecha_Emision date not null,
    Metodo_de_pago VARCHAR(25) not null,
    Cliente_Rut int not null,
    PRIMARY KEY (ID_Pago),
    Foreign Key (Cliente_Rut) REFERENCES base_de_datos_uni. Clientes(Rut)
);


--- Crear tabla Telefonos_Clientes ---
--------------------------------------
CREATE Table if not exists base_de_datos_uni. Telefonos_Clientes(
    Cliente_Rut int not null,
    Telefono int not null,
    Foreign Key (Cliente_Rut) REFERENCES base_de_datos_uni. Clientes(Rut)
);


--- Crear tabla Empresas ---
---------------------------
CREATE Table if not exists base_de_datos_uni. Empresas(
    ID_Empresa int not null AUTO_INCREMENT,
    Cliente_Rut int not null,
    Razon_Social VARCHAR(50) not null,
    Giro int not null,
    PRIMARY KEY (ID_Empresa),
    Foreign Key (Cliente_Rut) REFERENCES base_de_datos_uni. Clientes(Rut)
);

select * from base_de_datos_uni. Empresas;

--- Crear tabla Personas_Naturales ---
--------------------------------------
CREATE Table if not exists base_de_datos_uni. Personas_Naturales(

    ID_Persona int not null AUTO_INCREMENT,
    Cliente_Rut int not null,
    PRIMARY KEY(ID_Persona),
    Foreign Key (Cliente_Rut) REFERENCES base_de_datos_uni. Clientes(Rut)
);


--- Crear tabla Entregas ---
----------------------------
CREATE TABLE if not exists base_de_datos_uni. Entregas(

    ID_Entrega int not null AUTO_INCREMENT,
    Fecha_Entrega date not null,
    Estado VARCHAR (25) not null,
    Fecha_Entrega_Real date,
    PRIMARY KEY (ID_Entrega),
    constraint CK_Estado check(Estado in ('En camino', 'Entregado'))
);


--- Crear tabla Pedidos ---
---------------------------
CREATE Table if not exists base_de_datos_uni. Pedidos(

    ID_Pedido int not null AUTO_INCREMENT,
    Fecha_Pedido DATE not null,
    Forma_de_pago VARCHAR(25) not null,
    Entrega_ID_Entrega int not null,
    PRIMARY KEY (ID_Pedido),
    Foreign Key (Entrega_ID_Entrega) REFERENCES base_de_datos_Uni. Entregas(ID_Entrega)
);


--- Crear tabla Pedidos_Clientes ---
------------------------------------
CREATE Table if not exists base_de_datos_uni. Pedidos_Clientes(

    N°pedido_cliente int not null AUTO_INCREMENT,
    Cliente_Rut int not null,
    Pedido_ID_Pedido int not null,
    Pedido_Entrega_ID_Entrega int not null,
    PRIMARY KEY (N°pedido_cliente),
    Foreign Key (Cliente_Rut) REFERENCES base_de_datos_uni. Clientes(Rut),
    Foreign Key (Pedido_ID_Pedido) REFERENCES base_de_datos_uni. Pedidos(ID_Pedido),
    Foreign Key (Pedido_Entrega_ID_Entrega) REFERENCES base_de_datos_uni. Pedidos(Entrega_ID_Entrega)
);


--- Crear tabla Documentos_Facturacion ---
-----------------------------------------
CREATE Table if not exists base_de_datos_uni. Documentos_Facturacion(

    ID_Documento_Facturacion int not null AUTO_INCREMENT,
    Fecha_Creacion date not null,
    Tipo VARCHAR(50) not null,
    Fecha_Pago date not null,
    Pedido_ID_Pedido int not null,
    Pedido_Entrega_ID_Entrega int not null,
    PRIMARY key (ID_Documento_Facturacion),
    Foreign Key (Pedido_ID_Pedido) REFERENCES base_de_datos_uni. Pedidos(ID_Pedido),
    Foreign Key (Pedido_Entrega_ID_Entrega) REFERENCES base_de_datos_uni. Pedidos(Entrega_ID_Entrega)
);


--- Crear tabla Documento_Facturacion_Cliente ---
-------------------------------------------------
CREATE TABLE if not exists base_de_datos_uni. Documento_Facturacion_Cliente(

    DF_ID_Documento_Facturacion int not null,
    DF_Pedido_ID_Pedido int not null,
    DF_Entrega_ID_Entrega int not null,
    Cliente_Rut int not null,
    Foreign Key (DF_ID_Documento_Facturacion) 
        REFERENCES base_de_datos_uni. Documentos_Facturacion(ID_Documento_Facturacion),
    Foreign Key (DF_Pedido_ID_Pedido) 
        REFERENCES base_de_datos_uni. Documentos_Facturacion(Pedido_ID_Pedido),
    Foreign Key (CLiente_Rut) REFERENCES base_de_datos_uni. Clientes(Rut)
);


--- Crear tabla Productos ---
-----------------------------
CREATE Table if not exists base_de_datos_uni. Productos(

    ID_Producto int not null AUTO_INCREMENT,
    Nombre_Producto VARCHAR(50) not null,
    Presentacion VARCHAR(50) not null,
    Descripcion VARCHAR(50) not null,
    Clasificacion VARCHAR(50) not null,
    Precio_Base int not null,
    PRIMARY KEY (ID_Producto),
    constraint CK_Clasificacion check(Clasificacion in ('Chocolateria', 'Panaderia', 'Pasteleria'))
);


--- Crear tabla Promociones ---
-------------------------------
CREATE Table if not exists base_de_datos_uni. Promociones(

    ID_Promocion int not null AUTO_INCREMENT,
    Nombre VARCHAR(50) not null,
    Descripcion VARCHAR(50) not null,
    Codigo_Activacion VARCHAR(50) not null UNIQUE,
    Porcentaje_Descuento FLOAT not null,
    Periodo_Valido date not null,
    PRIMARY KEY (ID_Promocion)
);


--- Crear tabla Precios_de_Temporada ---
----------------------------------------
CREATE Table if not exists base_de_datos_uni. Precios_de_Temporada(

    ID_Precio_Temporada int not null AUTO_INCREMENT,
    Descuento float not null,
    Precio int not null,
    IVA float not null,
    Fecha_Inicio date not null,
    Fecha_Fin date not null,
    PRIMARY KEY (ID_Precio_Temporada)
);


--- Crear tabla Productos_Pasteleria ---
----------------------------------------
CREATE Table if not exists base_de_datos_uni. Productos_Pasteleria(

    ID_Producto_Pasteleria int not null AUTO_INCREMENT,
    Producto_ID_Producto int not null,
    PRIMARY KEY (ID_Producto_Pasteleria),
    Foreign Key (Producto_ID_Producto) REFERENCES base_de_datos_uni. Productos(ID_Producto)
);


--- Crear tabla Productos_Panaderia ---
---------------------------------------
CREATE Table if not exists base_de_datos_uni. Productos_Panaderia(

    ID_Producto_Panaderia int not null AUTO_INCREMENT,
    Producto_ID_Producto int not null,
    PRIMARY KEY (ID_Producto_Panaderia),
    Foreign Key (Producto_ID_Producto) REFERENCES base_de_datos_uni. Productos(ID_Producto)
);


--- Crear tabla Productos_Chocolateria ---
------------------------------------------
CREATE TABLE if not exists base_de_datos_uni. Productos_Chocolateria(

    ID_Producto_Chocolateria int not null AUTO_INCREMENT,
    Producto_ID_Producto int not null,
    PRIMARY KEY (ID_Producto_Chocolateria),
    Foreign Key (Producto_ID_Producto) REFERENCES base_de_datos_uni. Productos(ID_Producto)
);


--- Crear tabla Precios_Temporada_Productos ---
-----------------------------------------------
CREATE TABLE if not exists base_de_datos_uni. Precios_Temporada_Productos(

    Producto_ID_Producto int not null,
    Precio_Temporada_ID_Precio_Temporada int not null,
    Foreign Key (Producto_ID_Producto) 
        REFERENCES base_de_datos_uni. Productos(ID_Producto),
    Foreign Key (Precio_Temporada_ID_Precio_Temporada) 
        REFERENCES base_de_datos_uni. Precios_de_Temporada(ID_Precio_Temporada)
);


--- Crear tabla Promociones_Productos ---
-----------------------------------------
CREATE Table if not exists base_de_datos_uni. Promociones_Productos(

    Producto_ID_Producto int not null,
    Promocion_ID_Promocion int not null,
    Foreign Key (Producto_ID_Producto) 
        REFERENCES base_de_datos_uni. Productos(ID_Producto),
    Foreign Key (Promocion_ID_Promocion) 
        REFERENCES base_de_datos_uni. Promociones(ID_Promocion)
);


--- Crear tabla Pedidos_Productos ---
-------------------------------------
CREATE Table if not exists base_de_datos_uni. Pedidos_Productos(
    N°pedido_producto int not null AUTO_INCREMENT,
    Pedido_ID_Pedido int not null,
    Pedido_Entrega_ID_Entrega int not null,
    Producto_ID_Producto int not null,
    PRIMARY KEY (N°pedido_producto),
    Foreign Key (Pedido_ID_Pedido) 
        REFERENCES base_de_datos_uni. Pedidos(ID_Pedido),
    Foreign Key (Pedido_Entrega_ID_Entrega) 
        REFERENCES base_de_datos_uni. Pedidos(Entrega_ID_Entrega),
    Foreign Key (Producto_ID_Producto) 
        REFERENCES base_de_datos_uni. Productos(ID_Producto)
);

select C.Rut, C.CorreoElectronico, P.Nombre_Producto from base_de_datos_uni.Clientes C left join base_de_datos_uni.Pedidos_Clientes PC on C.Rut = PC.Cliente_Rut
left join base_de_datos_uni.Pedidos_Productos PP on PC.Pedido_ID_Pedido = PP.Pedido_ID_Pedido left join base_de_datos_uni.Productos P on PP.Producto_ID_Producto = P.ID_Producto;
    
select E.ID_Empresa, E.Razon_Social, D.Comuna, D.Calle from base_de_datos_uni.Empresas E inner join base_de_datos_uni.Clientes C on E.Cliente_Rut = C.Rut
inner join base_de_datos_uni.Dirreciones_Clientes DC on C.Rut = DC.Cliente_Rut inner join base_de_datos_uni.Direcciones D on DC.Direccion_ID_Direccion = D.ID_Direccion;

select Clientes.Rut, Clientes.Nombre, Clientes.Apellido, Direcciones.Comuna, Direcciones.Calle, Direcciones.Numeracion, Pagos.ID_Pago, Pagos.Fecha_Emision, Pagos.Metodo_de_pago
from Clientes left join Dirreciones_Clientes on Clientes.Rut = Dirreciones_Clientes.Cliente_Rut left join Direcciones on Dirreciones_Clientes.Direccion_ID_Direccion = Direcciones.ID_Direccion
left join Pagos on Clientes.Rut = Pagos.Cliente_Rut;

select clientes.rut Cliente_Rut, clientes.nombre Nombre_Cliente, count(pedidos_productos.N°pedido_producto) Cantidad_Productos_Vendidos
from clientes left join pedidos_clientes on clientes.rut = pedidos_clientes.cliente_rut left join pedidos_productos on pedidos_clientes.pedido_id_pedido = pedidos_productos.pedido_id_pedido
group by clientes.rut, clientes.nombre order by Cantidad_Productos_Vendidos desc;






