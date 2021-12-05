CREATE  TABLE "public".ciudad ( 
	id_ciudad            integer  NOT NULL ,
	nombre_ciudad        varchar(255)   ,
	CONSTRAINT ciudad_pkey PRIMARY KEY ( id_ciudad )
 );

CREATE  TABLE "public".cliente ( 
	cedula_cliente       integer  NOT NULL ,
	nombre_cliente       varchar(255)   ,
	apellido_cliente     varchar(255)   ,
	CONSTRAINT cliente_pkey PRIMARY KEY ( cedula_cliente )
 );

CREATE  TABLE "public".sucursal ( 
	cod_sucursal         varchar(255)  NOT NULL ,
	direccion_sucursal   varchar(255)   ,
	telefono_sucursal    varchar(255)   ,
	CONSTRAINT sucursal_pkey PRIMARY KEY ( cod_sucursal )
 );

CREATE  TABLE "public".tiempo ( 
	cod_tiempo           varchar(255)  NOT NULL ,
	fecha_ingreso        date   ,
	fecha_salida         date   ,
	CONSTRAINT tiempo_pkey PRIMARY KEY ( cod_tiempo )
 );

CREATE  TABLE "public".thenvios ( 
	cod_tiempo           varchar  NOT NULL ,
	cedula_cliente       integer  NOT NULL ,
	cod_sucursal         varchar  NOT NULL ,
	ciudad_destino       integer  NOT NULL ,
	ciudad_origen        integer  NOT NULL ,
	hecho                smallint   ,
	CONSTRAINT thenvios_pkey PRIMARY KEY ( cod_tiempo, cedula_cliente, cod_sucursal, ciudad_destino, ciudad_origen )
 );

ALTER TABLE "public".thenvios ADD CONSTRAINT thenvios_ciudad_destino_fkey FOREIGN KEY ( ciudad_destino ) REFERENCES "public".ciudad( id_ciudad );

ALTER TABLE "public".thenvios ADD CONSTRAINT thenvios_ciudad_origen_fkey FOREIGN KEY ( ciudad_origen ) REFERENCES "public".ciudad( id_ciudad );

ALTER TABLE "public".thenvios ADD CONSTRAINT thenvios_cedula_cliente_fkey FOREIGN KEY ( cedula_cliente ) REFERENCES "public".cliente( cedula_cliente );

ALTER TABLE "public".thenvios ADD CONSTRAINT thenvios_cod_sucursal_fkey FOREIGN KEY ( cod_sucursal ) REFERENCES "public".sucursal( cod_sucursal );

ALTER TABLE "public".thenvios ADD CONSTRAINT thenvios_cod_tiempo_fkey FOREIGN KEY ( cod_tiempo ) REFERENCES "public".tiempo( cod_tiempo );
