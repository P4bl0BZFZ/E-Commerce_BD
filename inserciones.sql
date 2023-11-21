-- Active: 1700089552463@@127.0.0.2@3306@base_de_datos_uni
--- Clientes ---
----------------
INSERT into base_de_datos_uni. clientes (Rut, Nombre, Apellido, CorreoElectronico, Fecha_ingreso, Ultimo_Acceso, Activo, Tipo)
    VALUES
    (211233214, 'Sony', 'Francia', 'SonyFrancia@gmail.com', '2023-04-03', '2023-04-04', 'Si', 'Empresa'),
    (232341231, 'Ester', 'Rincon', 'Ester@gmail.com', '2023-04-01', '2023-04-03', 'Si', 'Persona Natural'),
    (213342345, 'Markel', 'Bellido', 'Markel@gmail.com', '2023-04-03', '2023-04-03', 'Si', 'Persona Natural'),
    (223442212, 'Estrella', 'Suarez', 'Estrella@gmail.com', '2023-04-01', '2023-04-04', 'No', 'Persona Natural'),
    (210948807, 'Iñigo', 'Mañas', 'Iñigo@gmail.com', '2023-02-12', '2023-03-10', 'No', 'Persona Natural'),
    (123554423, 'Sony', 'España', 'SonyEspaña@gmail.com', '2023-03-03', '2023-03-12', 'No', 'Empresa'),
    (256574564, 'Sony', 'Italia', 'SonyItalia@gmail.com', '2023-02-01', '2023-02-21', 'No', 'Empresa'),
    (123412231, 'Pepsi', 'Iberia', 'PepsiIberia@gmail.com', '2023-04-23', '2023-08-04', 'Si', 'Empresa'),
    (109755435, 'Movistar', 'España', 'MovistarEspaña@gmail.com', '2023-10-03', '2023-10-11', 'Si', 'Empresa'),
    (122344242, 'Silvia', 'Ceballos', 'Silvia@gmail.com', '2023-01-03', '2023-04-04', 'No', 'Persona Natural');


--- Direccion ---
-----------------
INSERT into base_de_datos_uni. direcciones(Comuna, Calle, Numeracion)
    VALUES
    ('Puente Alto', 'Artura Prat', 144),
    ('Puente Alto', 'Esmeralda', 130), 
    ('Puente Alto', 'Las Rosas', 128), 
    ('Puente Alto', 'Lautaro', 127), 
    ('Puente Alto', 'Los Aromos', 127);


--- Direcciones-Clientes ---
----------------------------
INSERT into base_de_datos_uni. dirreciones_clientes(Direccion_ID_Direccion, Cliente_Rut)
    VALUES
    (1,109755435),
    (2,122344242), 
    (3,123412231), 
    (4,123554423), 
    (5,210948807), 
    (1,211233214), 
    (2,213342345), 
    (3,223442212), 
    (4,232341231), 
    (5,256574564);


--- Telefonos-Clientes ---
--------------------------
INSERT into base_de_datos_uni. telefonos_clientes(Cliente_Rut, Telefono)
    VALUES
    (109755435, 937491163),
    (109755435, 954561215), 
    (122344242, 925635426),
    (122344242, 999854657), 
    (123412231, 952255232), 
    (123554423, 923212426), 
    (210948807, 921235246), 
    (211233214, 912112141), 
    (213342345, 921354112), 
    (223442212, 974458124),
    (223442212, 911221411), 
    (232341231, 924441331), 
    (256574564, 977845111);


--- Empresa ---
---------------
INSERT into base_de_datos_uni. empresas(Cliente_Rut, Razon_Social, Giro)
    VALUES
    (109755435, 'Telefónica Móviles España, S.A.U.', 5000000),
    (123412231, 'Pepsico Iberia Servicios Centrales, S.L', 4100000),
    (123554423, 'Sony Music Entertainment España', 6000000),
    (211233214, 'Sony Music Entertainment Francia', 2000000),
    (256574564, 'Sony Music Entertainment Italia', 7000000);


--- Persona Natural ---
-----------------------
INSERT INTO base_de_datos_uni. personas_naturales(Cliente_Rut)
    VALUES
    (122344242),
    (210948807),
    (213342345),
    (223442212), 
    (232341231); 


--- Pagos ---
-------------
INSERT INTO base_de_datos_uni. pagos(Fecha_Emision, Metodo_de_pago, Cliente_Rut)
    VALUES
    ('2023-04-04', 'Debito', 122344242),
    ('2023-03-03', 'Debito', 232341231),
    ('2023-03-08', 'Debito', 213342345), 
    ('2023-03-04', 'Debito', 109755435),
    ('2023-04-03', 'Debito', 123554423);

--- Entregas ---
----------------
INSERT INTO base_de_datos_uni. entregas(Fecha_Entrega, Estado, Fecha_Entrega_real)
    VALUES
    ('2023-03-15', 'Entregado', '2023-03-16'),
    ('2023-03-10', 'Entregado', '2023-03-10'), 
    ('2023-05-15', 'Entregado', '2023-05-25'), 
    ('2023-05-15', 'Entregado', '2023-05-20'), 
    ('2023-10-11', 'Entregado', '2023-10-29');
INSERT INTO base_de_datos_uni. entregas(Fecha_Entrega, Estado)
    VALUES
    ('2023-04-15', 'En camino'), 
    ('2023-03-10', 'En camino');


--- Pedidos ---
---------------
INSERT INTO base_de_datos_uni. pedidos(Fecha_Pedido, Forma_de_pago, Entrega_ID_Entrega)
    VALUES
    ('2023-03-15', 'Debito', 1),
    ('2023-03-10', 'Debito', 2), 
    ('2023-05-15', 'Debito', 3), 
    ('2023-05-15', 'Debito', 4), 
    ('2023-10-11', 'Debito', 5), 
    ('2023-04-15', 'Debito', 6),
    ('2023-03-10', 'Debito', 7);


--- Pedido Cliente ---
----------------------
INSERT INTO base_de_datos_uni. pedidos_clientes(Cliente_Rut, Pedido_ID_Pedido, Pedido_Entrega_ID_Entrega)
    VALUES
    (122344242, 1, 1),
    (122344242, 4, 4), 
    (232341231, 2, 2),
    (232341231, 3, 3), 
    (213342345, 5, 5), 
    (109755435, 6, 6), 
    (123554423, 7, 7);


--- Documento Facturacion ---
-----------------------------
INSERT INTO base_de_datos_uni. documentos_facturacion(Fecha_Creacion, Tipo, Fecha_Pago, Pedido_ID_pedido, Pedido_entrega_id_entrega)
    VALUES
    ('2023-03-15', 'Factura', '2023-03-15', 1, 1),
    ('2023-03-15', 'Factura', '2023-03-15', 4, 4), 
    ('2023-05-15', 'Factura', '2023-05-15', 2, 2), 
    ('2023-05-15', 'Factura', '2023-05-15', 3, 3), 
    ('2023-10-11', 'Factura', '2023-10-11', 5, 5), 
    ('2023-04-15', 'Factura', '2023-04-15', 6, 6), 
    ('2023-03-10', 'Factura', '2023-03-10', 7, 7);


--- Documento Facturacion cliente ---
-------------------------------------
INSERT INTO base_de_datos_uni. documento_facturacion_cliente(
    DF_ID_Documento_Facturacion, DF_Pedido_ID_Pedido, DF_Entrega_ID_Entrega, Cliente_Rut)
    VALUES
    (1, 1, 1, 122344242),
    (2, 4, 4, 122344242), 
    (3, 2, 2, 232341231), 
    (4, 3, 3, 232341231), 
    (5, 5, 5, 213342345), 
    (6, 6, 6, 109755435), 
    (7, 7, 7, 123554423);


--- Producto ---
----------------
INSERT INTO base_de_datos_uni. productos(Nombre_Producto, Presentacion, Descripcion, Clasificacion, Precio_base)
    VALUES
    ('Galletas', '50g', 'Galletas marinela 50g', 'Pasteleria', 2000),
    ('Azucar Micropulverizada ', '10g', 'Azucar vital Micropulverizada  10g', 'Pasteleria', 500),
    ('Esencia de vainilla', '50ml', 'Esencia sabor vainilla 50ml', 'Pasteleria', 200),
    ('Galletas', '100g', 'Galletas marinela 100g', 'Pasteleria', 1000),
    ('Azucar Micropulverizada', '50g', 'Azucar vital micropulverizada 50g', 'Pasteleria', 5000),
    ('Levadura', '50g', 'Levadura Iñigo 50g', 'Panaderia', 200), 
    ('Levadura', '100g', 'Levadura Iñigo 100g', 'Panaderia', 400),  
    ('Pan de molde', '300g', 'Pan de molde bimbo 300g', 'Panaderia', 2000),  
    ('Pan de molde ', '500g', 'Pan de molde bimbo 500g', 'Panaderia', 3500),  
    ('Harina', '500g', 'Harina asus 500g', 'Panaderia', 1000),  
    ('Sahne nuss', '50g', 'Chocolate Sahne nuss pequeño 50g', 'Chocolateria', 500), 
    ('Sahne nuss ', '100g', 'Chocolate Sahne nuss  mediano 100g', 'Chocolateria', 1000),  
    ('Sahne nuss ', '250g', 'Chocolate Sahne nuss grande 250g', 'Chocolateria', 2000),  
    ('Trencito', '50g', 'Chocolate Trencito pequeño 50g', 'Chocolateria', 400),  
    ('Trencito', '250g', 'Chocolate Trencito grande 250g', 'Chocolateria', 1600);


--- Pasteleria ---
------------------
INSERT INTO base_de_datos_uni. productos_pasteleria(Producto_id_producto)
    VALUES
    (1),
    (2), 
    (3), 
    (4), 
    (5);


--- Panaderia ---
-----------------
INSERT INTO base_de_datos_uni. productos_panaderia(Producto_id_producto)
    VALUES
    (6),
    (7), 
    (8), 
    (9), 
    (10); 


--- Chocolateria ---
--------------------
INSERT INTO base_de_datos_uni. productos_chocolateria(Producto_id_producto)
    VALUES
    (11),
    (12), 
    (13), 
    (14), 
    (15); 


--- Promociones ---
-------------------
INSERT INTO base_de_datos_uni. promociones(Nombre, Descripcion, Codigo_activacion, Porcentaje_descuento, periodo_valido)
    VALUES
    ('San valentin', 'Feliz dia de los enamorados', 'Supersanvalentin1', 12.5, '2023-02-14'),
    ('San valentin', 'Feliz dia de los enamorados', 'Supersanvalentin2', 2.5, '2023-02-14'), 
    ('Año nuevo', 'Feliz año nuevo', 'añonuevo2024-01', 22.5, '2024-01-30'), 
    ('Año nuevo', 'Feliz año nuevo', 'añonuevo2024-02', 55.5, '2024-01-30'), 
    ('Navidad', 'Feliz navidad', 'nuevanavidad2024-01', 25.5, '2023-12-25'), 
    ('Navidad', 'Feliz navidad', 'nuevanavidad2024-02', 49.9, '2023-12-25');


--- Precio temporada ---
------------------------
INSERT INTO base_de_datos_uni. precios_de_temporada(Descuento, Precio, IVA, Fecha_Inicio, Fecha_fin)
    VALUES
    (2.5, 2194, 12.5, '2023-03-20', '2023-06-21'),
    (2.5, 548, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 219, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 1097, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 5484, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 219, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 439, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 2194, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 3839, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 1097, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 548, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 1097, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 2194, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 439, 12.5, '2023-03-20', '2023-06-21'), 
    (2.5, 1755, 12.5, '2023-03-20', '2023-06-21'), 
    (5.5, 2126, 12.5, '2023-06-21', '2023-09-23'),
    (5.5, 532, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 213, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 1063, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 5316, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 213, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 425, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 2126, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 3721, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 1063, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 532, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 1063, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 2126, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 425, 12.5, '2023-06-21', '2023-09-23'), 
    (5.5, 1701, 12.5, '2023-06-21', '2023-09-23'), 
    (9.9, 2027, 12.5, '2023-09-23', '2023-12-22'),
    (9.9, 507, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 203, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 1014, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 5068, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 203, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 405, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 2027, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 3548, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 1014, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 507, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 1014, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 2027, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 405, 12.5, '2023-09-23', '2023-12-22'), 
    (9.9, 1622, 12.5, '2023-09-23', '2023-12-22'), 
    (22.5, 1744, 12.5, '2023-12-22', '2024-03-20'),
    (22.5, 436, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 174, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 872, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 4359, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 174, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 349, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 1744, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 3052, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 872, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 436, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 872, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 1744, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 349, 12.5, '2023-12-22', '2024-03-20'), 
    (22.5, 1395, 12.5, '2023-12-22', '2024-03-20');


--- Precio temporada producto ---
---------------------------------
INSERT INTO base_de_datos_uni. precios_temporada_productos(Producto_ID_Producto, Precio_temporada_ID_Precio_temporada)
    VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (1, 16),
    (2, 17),
    (3, 18),
    (4, 19),
    (5, 20),
    (6, 21),
    (7, 22),
    (8, 23),
    (9, 24),
    (10, 25),
    (11, 26),
    (12, 27),
    (13, 28),
    (14, 29),
    (15, 30),
    (1, 31),
    (2, 32),
    (3, 33),
    (4, 34),
    (5, 35),
    (6, 36),
    (7, 37),
    (8, 38),
    (9, 39),
    (10, 40),
    (11, 41),
    (12, 42),
    (13, 43),
    (14, 44),
    (15, 45),
    (1, 46),
    (2, 47),
    (3, 48),
    (4, 49),
    (5, 50),
    (6, 51),
    (7, 52),
    (8, 53),
    (9, 54),
    (10, 55),
    (11, 56),
    (12, 57),
    (13, 58),
    (14, 59),
    (15, 60);


--- Promociones productos ---
-----------------------------
INSERT INTO base_de_datos_uni. promociones_productos(Producto_id_producto, promocion_id_promocion)
    VALUES
    (13 ,1),
    (15 ,2), 
    (5 ,3), 
    (2 ,4), 
    (3 ,5), 
    (9 ,6);


--- Pedidos Productos ---
-------------------------
INSERT INTO base_de_datos_uni. pedidos_productos(
    Pedido_Id_Pedido, Pedido_entrega_Id_entrega, Producto_ID_Producto)
    VALUES
    (1, 1, 13),
    (2, 2, 12), 
    (3, 3, 1), 
    (4, 4, 5), 
    (5, 5, 15), 
    (6, 6, 4), 
    (7, 7, 8);

 





    
    