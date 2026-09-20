

-- CREACION DE LAS TABLAS MAESTRAS

--TABLA DISTRITO FISCAL

CREATE TABLE distrito_fiscal(

    id_distrito_fiscal SERIAL PRIMARY KEY,
    nombre_distrito VARCHAR (150) NOT NULL

);

-- TIPO DE PERSONAL
 CREATE TABLE tipo_personal(

    id_tipo_personal SERIAL PRIMARY KEY,
    nombre_tipo_personal VARCHAR (100) NOT NULL,
    descripcion VARCHAR(250)

 );

CREATE TABLE marca(

    id_marca SERIAL PRIMARY KEY,
    nombre_marca VARCHAR NOT NULL

);

CREATE TABLE clasificacion(
    id_clasificacion SERIAL PRIMARY KEY,
    nombre_clasificacion VARCHAR(100) NOT NULL,
    descripcion VARCHAR (250)
);

CREATE TABLE estado_equipo(
    id_estado_equipo SERIAL PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250)


);

CREATE TABLE tipo_mantenimiento(
    id_tipo_mantenimiento SERIAL PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250)
);

CREATE TABLE rol(
    id_rol SERIAL PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);

CREATE TABLE usuario (
id_usuario SERIAL PRIMARY KEY,
usuario VARCHAR(50) NOT NULL UNIQUE,
contrasena VARCHAR(255) NOT NULL,
nombre_completo VARCHAR(150) NOT NULL,
correo_electronico VARCHAR(150),
estado VARCHAR(20) DEFAULT 'ACTIVO',
fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- TABLAS CON UNA DEPENDECIA

CREATE TABLE sede(
    id_sede SERIAL PRIMARY KEY,
    id_distrito_fiscal INT NOT NULL,
    nombre_sede VARCHAR(150) NOT NULL,
    direccion VARCHAR(300),

    CONSTRAINT fk_sede_distrito --sirve para asignar un nombre a una restriccion donde sede (tabla hija) distrito (tabla padre)
    FOREIGN KEY (id_distrito_fiscal)-- clave foranea
    REFERENCES distrito_fiscal(id_distrito_fiscal)--tabla de refrencia o padre
    
);

CREATE TABLE modelo(

    id_modelo SERIAL PRIMARY KEY,
    id_marca INT NOT NULL,
    nombre_modelo VARCHAR(150) NOT NULL,
    descripcion VARCHAR(250),

    CONSTRAINT fk_marca_modelo
    FOREIGN KEY (id_marca)
    REFERENCES marca(id_marca)
);

CREATE TABLE personal(
    id_personal SERIAL PRIMARY KEY,
    id_tipo_personal INT NOT NULL,
    dni VARCHAR(8) UNIQUE,
    nombres VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),

    correo VARCHAR(120),
    telefono VARCHAR(20),

    CONSTRAINT fk_personal_tipo
    FOREIGN KEY (id_tipo_personal)
    REFERENCES tipo_personal(id_tipo_personal)

);

--tablas principales

CREATE TABLE despacho(
    id_despacho SERIAL PRIMARY KEY,
    id_sede INT NOT NULL,
    nombre_despacho VARCHAR(250) NOT NULL,
    tipo_proceso VARCHAR(100),

    CONSTRAINT fk_id_sede
    FOREIGN KEY (id_sede)
    REFERENCES sede(id_sede)
);

CREATE TABLE equipo (
id_equipo SERIAL PRIMARY KEY,
id_modelo INT NOT NULL,
id_clasificacion INT NOT NULL,
id_estado_equipo INT NOT NULL,
codigo_patrimonial VARCHAR(50) NOT NULL UNIQUE,
numero_serie VARCHAR(100) UNIQUE,
observacion VARCHAR(500),
fecha_adquisicion DATE,
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_equipo_modelo
FOREIGN KEY (id_modelo)
REFERENCES modelo(id_modelo),

CONSTRAINT fk_equipo_clasificacion
FOREIGN KEY (id_clasificacion)
REFERENCES clasificacion(id_clasificacion),

CONSTRAINT fk_equipo_estado
FOREIGN KEY (id_estado_equipo)
REFERENCES estado_equipo(id_estado_equipo)
);

--TABLAS TRANSACCIONALES
CREATE TABLE asignacion_equipo (
id_asignacion SERIAL PRIMARY KEY,
id_equipo INT NOT NULL,
id_despacho INT NOT NULL,
id_personal INT NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin DATE,
observacion VARCHAR(500),
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,


CONSTRAINT fk_asignacion_equipo
FOREIGN KEY (id_equipo)
REFERENCES equipo(id_equipo),

CONSTRAINT fk_asignacion_despacho
FOREIGN KEY (id_despacho)
REFERENCES despacho(id_despacho),

CONSTRAINT fk_asignacion_personal

FOREIGN KEY (id_personal)
REFERENCES personal(id_personal)
);

CREATE TABLE mantenimiento (
id_mantenimiento SERIAL PRIMARY KEY,
id_equipo INT NOT NULL,
id_tipo_mantenimiento INT NOT NULL,
fecha_mantenimiento DATE NOT NULL,
diagnostico TEXT,
trabajo_realizado TEXT,
repuesto TEXT,
responsable_mantenimiento VARCHAR(150),
observacion TEXT,
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_mantenimiento_equipo
FOREIGN KEY (id_equipo)
REFERENCES equipo(id_equipo),

CONSTRAINT fk_mantenimiento_tipo

FOREIGN KEY (id_tipo_mantenimiento)
REFERENCES tipo_mantenimiento(id_tipo_mantenimiento)
);

CREATE TABLE usuario_rol (
id_usuario_rol SERIAL PRIMARY KEY,
id_usuario INT NOT NULL,
id_rol INT NOT NULL,

CONSTRAINT fk_usuario_rol_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuario(id_usuario),

CONSTRAINT fk_usuario_rol_rol
FOREIGN KEY (id_rol)
REFERENCES rol(id_rol),

CONSTRAINT uq_usuario_rol
UNIQUE(id_usuario, id_rol)
);


-- =====================================================
-- DISTRITO FISCAL
-- =====================================================

INSERT INTO distrito_fiscal(nombre_distrito)
VALUES
('Distrito Fiscal de Ayacucho'),
('Distrito Fiscal de Lima');


-- =====================================================
-- TIPO PERSONAL
-- =====================================================

INSERT INTO tipo_personal(nombre_tipo_personal, descripcion)
VALUES
('Fiscal Provincial', 'Fiscal titular'),
('Asistente en Funcion Fiscal', 'Apoyo administrativo');


-- =====================================================
-- MARCA
-- =====================================================

INSERT INTO marca(nombre_marca)
VALUES
('KYOCERA'),
('HP');


-- =====================================================
-- CLASIFICACION
-- =====================================================

INSERT INTO clasificacion(nombre_clasificacion, descripcion)
VALUES
('Multifuncional', 'Equipo multifuncional'),
('Impresora', 'Equipo de impresion');


-- =====================================================
-- ESTADO EQUIPO
-- =====================================================

INSERT INTO estado_equipo(nombre_estado, descripcion)
VALUES
('OPERATIVO', 'Equipo funcionando'),
('MANTENIMIENTO', 'Equipo en mantenimiento');


-- =====================================================
-- TIPO MANTENIMIENTO
-- =====================================================

INSERT INTO tipo_mantenimiento(nombre_tipo, descripcion)
VALUES
('PREVENTIVO', 'Mantenimiento preventivo'),
('CORRECTIVO', 'Mantenimiento correctivo');


-- =====================================================
-- ROL
-- =====================================================

INSERT INTO rol(nombre_rol)
VALUES
('ADMINISTRADOR'),
('TECNICO');


-- =====================================================
-- USUARIO
-- =====================================================

INSERT INTO usuario
(
    usuario,
    contrasena,
    nombre_completo,
    correo_electronico,
    estado
)
VALUES
(
    'jpariona',
    '123456',
    'Jenry Pariona',
    'jpariona@mpfn.gob.pe',
    'ACTIVO'
),
(
    'efelix',
    '123456',
    'Evelyn Felix',
    'efelix@mpfn.gob.pe',
    'ACTIVO'
);


-- =====================================================
-- SEDE
-- =====================================================

INSERT INTO sede
(
    id_distrito_fiscal,
    nombre_sede,
    direccion
)
VALUES
(
    1,
    'Sede Central Ayacucho',
    'Jr. Asamblea 100'
),
(
    2,
    'Sede Central Lima',
    'Av. Abancay 500'
);


-- =====================================================
-- MODELO
-- =====================================================

INSERT INTO modelo
(
    id_marca,
    nombre_modelo,
    descripcion
)
VALUES
(
    1,
    'ECOSYS M3645idn',
    'Multifuncional Kyocera'
),
(
    2,
    'LaserJet M428fdw',
    'Multifuncional HP'
);


-- =====================================================
-- PERSONAL
-- =====================================================

INSERT INTO personal
(
    id_tipo_personal,
    dni,
    nombres,
    apellido_paterno,
    apellido_materno,
    correo,
    telefono
)
VALUES
(
    1,
    '45871234',
    'Carlos Alberto',
    'Mendoza',
    'Rios',
    'cmendoza@mpfn.gob.pe',
    '999888777'
),
(
    2,
    '46782345',
    'Maria Elena',
    'Quispe',
    'Huaman',
    'mquispe@mpfn.gob.pe',
    '988777666'
);


-- =====================================================
-- DESPACHO
-- =====================================================

INSERT INTO despacho
(
    id_sede,
    nombre_despacho,
    tipo_proceso
)
VALUES
(
    1,
    'Despacho Fiscal Provincial',
    'Proceso Penal'
),
(
    2,
    'Despacho Fiscal Lima',
    'Proceso Civil'
);


-- =====================================================
-- EQUIPO
-- =====================================================

INSERT INTO equipo
(
    id_modelo,
    id_clasificacion,
    id_estado_equipo,
    codigo_patrimonial,
    numero_serie,
    observacion,
    fecha_adquisicion
)
VALUES
(
    1,
    1,
    1,
    'PAT-0001',
    'KY-123456',
    'Equipo en buen estado',
    '2025-01-15'
),
(
    2,
    2,
    2,
    'PAT-0002',
    'HP-654321',
    'Equipo requiere mantenimiento',
    '2025-03-20'
);


-- =====================================================
-- ASIGNACION EQUIPO
-- =====================================================

INSERT INTO asignacion_equipo
(
    id_equipo,
    id_despacho,
    id_personal,
    fecha_inicio,
    fecha_fin,
    observacion
)
VALUES
(
    1,
    1,
    1,
    '2026-01-10',
    NULL,
    'Equipo asignado al despacho'
),
(
    2,
    2,
    2,
    '2026-02-15',
    NULL,
    'Equipo asignado al personal'
);


-- =====================================================
-- MANTENIMIENTO
-- =====================================================

INSERT INTO mantenimiento
(
    id_equipo,
    id_tipo_mantenimiento,
    fecha_mantenimiento,
    diagnostico,
    trabajo_realizado,
    repuesto,
    responsable_mantenimiento,
    observacion
)
VALUES
(
    1,
    1,
    '2026-03-10',
    'Equipo funcionando correctamente',
    'Limpieza general y revision',
    'Ninguno',
    'Tecnico TI',
    'Mantenimiento preventivo realizado'
),
(
    2,
    2,
    '2026-04-15',
    'Problema de impresion',
    'Revision y cambio de componente',
    'Rodillo de impresion',
    'Tecnico TI',
    'Equipo operativo despues del mantenimiento'
);


-- =====================================================
-- USUARIO ROL
-- =====================================================

INSERT INTO usuario_rol
(
    id_usuario,
    id_rol
)
VALUES
(
    1,
    1
),
(
    2,
    2
);