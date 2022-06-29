-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-11 02:17:00.357

-- tables
-- Table: MEDICO
CREATE TABLE MEDICO (
    id_medico int  NOT NULL,
    id_secretaria int  NOT NULL,
    username varchar(20)  NOT NULL,
    password varchar(255)  NOT NULL,
    especialidad varchar(50)  NOT NULL,
    nombre_medico varchar(50)  NOT NULL,
    CONSTRAINT MEDICOS_AK_USERNAME UNIQUE (username) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT PK_MEDICO PRIMARY KEY (id_medico)
);

-- Table: OBRA_SOCIAL
CREATE TABLE OBRA_SOCIAL (
    nombre_corto varchar(10)  NOT NULL,
    id_obra_social int  NOT NULL,
    nombre_largo varchar(50)  NULL,
    CONSTRAINT PK_OBRA_SOCIAL PRIMARY KEY (id_obra_social)
);

-- Table: PACIENTE
CREATE TABLE PACIENTE (
    dni_paciente int  NOT NULL,
    nombre_paciente varchar(50)  NOT NULL,
    apellido varchar(50)  NOT NULL,
    password varchar(255)  NOT NULL,
    direccion varchar(50)  NOT NULL,
    id_afiliado int  NULL,
    telefono varchar(16)  NOT NULL,
    id_obra_social int  NULL,
    CONSTRAINT PK_PACIENTE PRIMARY KEY (dni_paciente)
);

-- Table: SECRETARIA
CREATE TABLE SECRETARIA (
    id_secretaria int  NOT NULL,
    username varchar(20)  NOT NULL,
    password varchar(255)  NOT NULL,
    CONSTRAINT PK_SECRETARIA PRIMARY KEY (id_secretaria)
);

-- Table: TRABAJA_CON
CREATE TABLE TRABAJA_CON (
    id_medico int  NOT NULL,
    id_obra_social int  NOT NULL,
    CONSTRAINT PK_TRABAJA_CON PRIMARY KEY (id_medico,id_obra_social)
);

-- Table: TURNO
CREATE TABLE TURNO (
    id_turno int  NOT NULL,
    id_medico int  NOT NULL,
    dni_paciente int  NULL,
    disponible boolean  NOT NULL,
    fecha datetime  NOT NULL,
    CONSTRAINT PK_TURNO PRIMARY KEY (id_turno)
);

-- foreign keys
-- Reference: MEDICO_SECRETARIA (table: MEDICO)
ALTER TABLE MEDICO ADD CONSTRAINT MEDICO_SECRETARIA
    FOREIGN KEY (id_secretaria)
    REFERENCES SECRETARIA (id_secretaria)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PACIENTE_OBRA_SOCIAL (table: PACIENTE)
ALTER TABLE PACIENTE ADD CONSTRAINT PACIENTE_OBRA_SOCIAL
    FOREIGN KEY (id_obra_social)
    REFERENCES OBRA_SOCIAL (id_obra_social)
    ON DELETE  SET NULL 
    ON UPDATE  CASCADE 
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: TRABAJA_CON_MEDICO (table: TRABAJA_CON)
ALTER TABLE TRABAJA_CON ADD CONSTRAINT TRABAJA_CON_MEDICO
    FOREIGN KEY (id_medico)
    REFERENCES MEDICO (id_medico)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: TRABAJA_CON_OBRA_SOCIAL (table: TRABAJA_CON)
ALTER TABLE TRABAJA_CON ADD CONSTRAINT TRABAJA_CON_OBRA_SOCIAL
    FOREIGN KEY (id_obra_social)
    REFERENCES OBRA_SOCIAL (id_obra_social)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: TURNO_MEDICO (table: TURNO)
ALTER TABLE TURNO ADD CONSTRAINT TURNO_MEDICO
    FOREIGN KEY (id_medico)
    REFERENCES MEDICO (id_medico)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: TURNO_PACIENTE (table: TURNO)
ALTER TABLE TURNO ADD CONSTRAINT TURNO_PACIENTE
    FOREIGN KEY (dni_paciente)
    REFERENCES PACIENTE (dni_paciente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

