-- Proyecto Farmacia
-- Table: FARMACIA
CREATE TABLE FARMACIA (
    id_farmacia int NOT NULL auto_increment,
    name varchar(20) NOT NULL,
    adress varchar(30) NOT NULL,
    social_security varchar(30),
    franchise varchar(30),
    owner varchar(30) NOT NULL,
    employees int,
    tel int NOT NULL,
    description varchar(200),
    CONSTRAINT PK_FARMACIA PRIMARY KEY (id_farmacia,name)
);
-- Table: DROGUERIA
CREATE TABLE DROGUERIA (
    id_drogueria int NOT NULL auto_increment,
    name varchar(20) NOT NULL,
    adress varchar(30),
    tel int NOT NULL,
    started date,
    description varchar(200),
    CONSTRAINT PK_DROGUERIA PRIMARY KEY (id_drogueria)
);
-- Table: LABORATORIO
CREATE TABLE LABORATORIO (
    id_laboratorio int NOT NULL auto_increment,
    name varchar(20) NOT NULL,
    adress varchar(30),
    tel int NOT NULL,
    started date,
    description varchar(200),
    CONSTRAINT PK_LABORATORIO PRIMARY KEY (id_laboratorio)
);
-- Table: MEDICAMENTO_LAB
CREATE TABLE MEDICAMENTO_LAB (
    id_medicamento_lab int NOT NULL auto_increment,
    name varchar(20) NOT NULL,
    stock int,
    type varchar(20),
	sold int,
    ##provider_idProvider int NOT NULL,
    ##lab_idLaboratorio int NOT NULL,
    description varchar(200),
    CONSTRAINT PK_MEDICAMENTO_LAB PRIMARY KEY (id_medicamento_lab)
);
-- Table: EMPLEADO
CREATE TABLE EMPLEADO (
    id_empleado int NOT NULL auto_increment,
    name varchar(20) NOT NULL,
    last_name varchar(20) NOT NULL,
    started date NOT NULL,
    position_job varchar(20) NOT NULL,
	DNI int NOT NULL,
    age int,
    work_shift varchar(10),
    tel int NOT NULL,
    description varchar(200),
    CONSTRAINT PK_EMPLEADO PRIMARY KEY (id_empleado)
);
-- Table: CLIENTE
CREATE TABLE CLIENTE (
    id_cliente int NOT NULL auto_increment,
    name varchar(20) NOT NULL,
    last_name varchar(20) NOT NULL,
	DNI int NOT NULL,
    email varchar(40),
    prescription text NOT NULL,
    tel int NOT NULL,
    description varchar(200),
    CONSTRAINT PK_CLIENTE PRIMARY KEY (id_cliente)
);
-- Table: OBRA_SOCIAL
CREATE TABLE OBRA_SOCIAL (
    id_obra_social int NOT NULL auto_increment,
    name varchar(20) NOT NULL,
    adress varchar(20),
    tel int NOT NULL,
    agreement text NOT NULL, 
    started date,
    description varchar(200),
    CONSTRAINT PK_OBRA_SOCIAL PRIMARY KEY (id_obra_social)
);
-- Table: MEDICAMENTO_PROPIO
CREATE TABLE MEDICAMENTO_PROPIO (
    id_medicamento_propio int NOT NULL auto_increment,
    name varchar(20) NOT NULL,
    stock int,
    type varchar(20),
    components text,
	sold int,
    description varchar(200),
    CONSTRAINT PK_MEDICAMENTO_PROPIO PRIMARY KEY (id_medicamento_propio)
);


-- foreign keys
-- Reference: FK_MEDICAMENTOLAB_PROVIDER (table: MEDICAMENTO_LAB)
ALTER TABLE MEDICAMENTO_LAB ADD CONSTRAINT FK_MEDICAMENTOLAB_PROVIDER FOREIGN KEY FK_MEDICAMENTOLAB_PROVIDER (id_medicamento_lab)
    REFERENCES DROGUERIA (id_drogueria);
-- Reference: FK_MEDICAMENTOLAB_LAB_BRAND (table: MEDICAMENTO_LAB)
ALTER TABLE MEDICAMENTO_LAB ADD CONSTRAINT FK_MEDICAMENTOLAB_LAB_BRAND FOREIGN KEY FK_MEDICAMENTOLAB_LAB_BRAND (id_medicamento_lab)
    REFERENCES LABORATORIO (id_laboratorio);
    
-- Reference: FK_EMPLEADO_FARMACIA (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EMPLEADO_FARMACIA FOREIGN KEY FK_EMPLEADO_FARMACIA (id_empleado)
    REFERENCES FARMACIA (id_farmacia);
    
-- Reference: FK_CLIENTE_FARMACIA (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_FARMACIA FOREIGN KEY FK_CLIENTE_FARMACIA (id_cliente)
    REFERENCES FARMACIA (id_farmacia);
-- Reference: FK_CLIENTE_OBRA_SOCIAL (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT FK_CLIENTE_OBRA_SOCIAL FOREIGN KEY FK_CLIENTE_OBRA_SOCIAL (id_cliente)
    REFERENCES OBRA_SOCIAL (id_obra_social);
    
-- Reference: FK_MEDICAMENTOPROPIO_FARMACIA (table: MEDICAMENTO_PROPIO)
ALTER TABLE MEDICAMENTO_PROPIO ADD CONSTRAINT FK_MEDICAMENTOPROPIO_FARMACIA FOREIGN KEY FK_MEDICAMENTOPROPIO_FARMACIA (id_medicamento_propio)
    REFERENCES FARMACIA (id_farmacia);