CREATE TABLE Dirección (
 Provincia CHAR(20) NOT NULL,
 Localidad CHAR(20) NOT NULL,
 Calle CHAR(20) NOT NULL,
 Numero INT NOT NULL,
 Piso INT NOT NULL,
 Departamento CHAR(1) NOT NULL,
 Codigo Postal INT NOT NULL
);

ALTER TABLE Dirección ADD CONSTRAINT PK_Dirección PRIMARY KEY (Provincia,Localidad,Calle,Numero,Piso,Departamento);


CREATE TABLE Entidad Financiadora (
 Nombre Entidad Financiadora CHAR(20) NOT NULL
);

ALTER TABLE Entidad Financiadora ADD CONSTRAINT PK_Entidad Financiadora PRIMARY KEY (Nombre Entidad Financiadora);


CREATE TABLE Especialidad (
 Nombre Especialidad CHAR(10) NOT NULL,
 Servicio CHAR(10) NOT NULL
);

ALTER TABLE Especialidad ADD CONSTRAINT PK_Especialidad PRIMARY KEY (Nombre Especialidad);


CREATE TABLE Persona (
 Tipo Doc CHAR(1) NOT NULL,
 Nro Doc INT NOT NULL,
 Provincia CHAR(20) NOT NULL,
 Localidad CHAR(20) NOT NULL,
 Calle CHAR(20) NOT NULL,
 Numero INT NOT NULL,
 Piso INT NOT NULL,
 Departamento CHAR(1) NOT NULL,
 Apellido CHAR(10) NOT NULL,
 Apellido casada CHAR(10),
 Nombre CHAR(10) NOT NULL,
 Sexo CHAR(1) NOT NULL,
 Estado civil CHAR(1) NOT NULL,
 Telefono CHAR(10),
 Celular CHAR(10),
 E-mail CHAR(30),
 Nacionalidad CHAR(10) NOT NULL,
 Lugar Nacimiento CHAR(10) NOT NULL,
 Fecha Nacimiento CHAR(10) NOT NULL
);

ALTER TABLE Persona ADD CONSTRAINT PK_Persona PRIMARY KEY (Tipo Doc,Nro Doc);


CREATE TABLE Procedimiento Médico (
 Codigo Procedimiento CHAR(10) NOT NULL,
 Nombre Especialidad CHAR(10) NOT NULL,
 Nombre CHAR(10) NOT NULL,
 Condiciones VARCHAR(10)
);

ALTER TABLE Procedimiento Médico ADD CONSTRAINT PK_Procedimiento Médico PRIMARY KEY (Codigo Procedimiento);


CREATE TABLE Profesional (
 Nro Matricula INT NOT NULL,
 Tipo Doc CHAR(1) NOT NULL,
 Nro Doc INT NOT NULL,
 Tipo CHAR(10) NOT NULL
);

ALTER TABLE Profesional ADD CONSTRAINT PK_Profesional PRIMARY KEY (Nro Matricula);


CREATE TABLE Puede Aplicar (
 Codigo Procedimiento CHAR(10) NOT NULL,
 Nro Matricula INT NOT NULL
);

ALTER TABLE Puede Aplicar ADD CONSTRAINT PK_Puede Aplicar PRIMARY KEY (Codigo Procedimiento,Nro Matricula);


CREATE TABLE Block de Turnos (
 Nro Matricula INT NOT NULL,
 Fecha DATE NOT NULL,
 Hora Inicio TIME(10) NOT NULL,
 Nombre Especialidad CHAR(10) NOT NULL,
 Hora Fin TIME(10) NOT NULL,
 Estado INT NOT NULL,
 Tipo Agenda CHAR(10) NOT NULL,
 Cantidad Pacientes INT
);

ALTER TABLE Block de Turnos ADD CONSTRAINT PK_Block de Turnos PRIMARY KEY (Nro Matricula,Fecha,Hora Inicio);


CREATE TABLE Cobertura (
 Nombre Cobertura CHAR(10) NOT NULL,
 Nombre Entidad Financiadora CHAR(20) NOT NULL
);

ALTER TABLE Cobertura ADD CONSTRAINT PK_Cobertura PRIMARY KEY (Nombre Cobertura);


CREATE TABLE Cubre (
 Codigo Procedimiento CHAR(10) NOT NULL,
 Nombre Cobertura CHAR(10) NOT NULL,
 Exención CHAR(10),
 Valor copago CHAR(10) NOT NULL,
 Documentación CHAR(10) NOT NULL
);

ALTER TABLE Cubre ADD CONSTRAINT PK_Cubre PRIMARY KEY (Codigo Procedimiento,Nombre Cobertura);


CREATE TABLE Es Experto En (
 Nombre Especialidad CHAR(10) NOT NULL,
 Nro Matricula INT NOT NULL
);

ALTER TABLE Es Experto En ADD CONSTRAINT PK_Es Experto En PRIMARY KEY (Nombre Especialidad,Nro Matricula);


CREATE TABLE Paciente (
 Nro Paciente INT NOT NULL,
 Tipo Doc CHAR(1) NOT NULL,
 Nro Doc INT NOT NULL,
 Nombre Cobertura CHAR(10) NOT NULL,
 Condicion IVA CHAR(10) NOT NULL,
 Numero Afiliado INT NOT NULL,
 Numero de Historia Clinica INT NOT NULL
);

ALTER TABLE Paciente ADD CONSTRAINT PK_Paciente PRIMARY KEY (Nro Paciente);


CREATE TABLE Turno (
 Nro Turno CHAR(10) NOT NULL,
 Tipo Turno CHAR(10) NOT NULL,
 Monto a abonar FLOAT(10) NOT NULL,
 Nro Paciente INT NOT NULL,
 Fecha DATE NOT NULL,
 Hora TIME(10) NOT NULL,
 Duración INT NOT NULL
);

ALTER TABLE Turno ADD CONSTRAINT PK_Turno PRIMARY KEY (Nro Turno);


CREATE TABLE Turno de Diagnóstico (
 Nro Turno CHAR(10) NOT NULL,
 Tipo Turno CHAR(10) NOT NULL,
 Nro Matricula INT NOT NULL,
 Fecha DATE NOT NULL,
 Hora TIME(10) NOT NULL,
 Duración CHAR(10) NOT NULL,
 N° consultorio INT
);

ALTER TABLE Turno de Diagnóstico ADD CONSTRAINT PK_Turno de Diagnóstico PRIMARY KEY (Nro Turno);


CREATE TABLE Turno de Quirófano y Cama (
 Nro Turno CHAR(10) NOT NULL,
 Nro Matricula INT NOT NULL,
 N° quirofano INT,
 N° cama INT
);

ALTER TABLE Turno de Quirófano y Cama ADD CONSTRAINT PK_Turno de Quirófano y Cama PRIMARY KEY (Nro Turno);


CREATE TABLE Tiene Procedimiento (
 Codigo Procedimiento CHAR(10) NOT NULL,
 Nro Turno CHAR(10) NOT NULL
);

ALTER TABLE Tiene Procedimiento ADD CONSTRAINT PK_Tiene Procedimiento PRIMARY KEY (Codigo Procedimiento,Nro Turno);


ALTER TABLE Persona ADD CONSTRAINT FK_Persona_0 FOREIGN KEY (Provincia,Localidad,Calle,Numero,Piso,Departamento) REFERENCES Dirección (Provincia,Localidad,Calle,Numero,Piso,Departamento);


ALTER TABLE Procedimiento Médico ADD CONSTRAINT FK_Procedimiento Médico_0 FOREIGN KEY (Nombre Especialidad) REFERENCES Especialidad (Nombre Especialidad);


ALTER TABLE Profesional ADD CONSTRAINT FK_Profesional_0 FOREIGN KEY (Tipo Doc,Nro Doc) REFERENCES Persona (Tipo Doc,Nro Doc);


ALTER TABLE Puede Aplicar ADD CONSTRAINT FK_Puede Aplicar_0 FOREIGN KEY (Codigo Procedimiento) REFERENCES Procedimiento Médico (Codigo Procedimiento);
ALTER TABLE Puede Aplicar ADD CONSTRAINT FK_Puede Aplicar_1 FOREIGN KEY (Nro Matricula) REFERENCES Profesional (Nro Matricula);


ALTER TABLE Block de Turnos ADD CONSTRAINT FK_Block de Turnos_0 FOREIGN KEY (Nro Matricula) REFERENCES Profesional (Nro Matricula);
ALTER TABLE Block de Turnos ADD CONSTRAINT FK_Block de Turnos_1 FOREIGN KEY (Nombre Especialidad) REFERENCES Especialidad (Nombre Especialidad);


ALTER TABLE Cobertura ADD CONSTRAINT FK_Cobertura_0 FOREIGN KEY (Nombre Entidad Financiadora) REFERENCES Entidad Financiadora (Nombre Entidad Financiadora);


ALTER TABLE Cubre ADD CONSTRAINT FK_Cubre_0 FOREIGN KEY (Codigo Procedimiento) REFERENCES Procedimiento Médico (Codigo Procedimiento);
ALTER TABLE Cubre ADD CONSTRAINT FK_Cubre_1 FOREIGN KEY (Nombre Cobertura) REFERENCES Cobertura (Nombre Cobertura);


ALTER TABLE Es Experto En ADD CONSTRAINT FK_Es Experto En_0 FOREIGN KEY (Nombre Especialidad) REFERENCES Especialidad (Nombre Especialidad);
ALTER TABLE Es Experto En ADD CONSTRAINT FK_Es Experto En_1 FOREIGN KEY (Nro Matricula) REFERENCES Profesional (Nro Matricula);


ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_0 FOREIGN KEY (Tipo Doc,Nro Doc) REFERENCES Persona (Tipo Doc,Nro Doc);
ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_1 FOREIGN KEY (Nombre Cobertura) REFERENCES Cobertura (Nombre Cobertura);


ALTER TABLE Turno ADD CONSTRAINT FK_Turno_0 FOREIGN KEY (Nro Paciente) REFERENCES Paciente (Nro Paciente);


ALTER TABLE Turno de Diagnóstico ADD CONSTRAINT FK_Turno de Diagnóstico_0 FOREIGN KEY (Nro Turno) REFERENCES Turno (Nro Turno);
ALTER TABLE Turno de Diagnóstico ADD CONSTRAINT FK_Turno de Diagnóstico_1 FOREIGN KEY (Nro Matricula) REFERENCES Profesional (Nro Matricula);
ALTER TABLE Turno de Diagnóstico ADD CONSTRAINT FK_Turno de Diagnóstico_2 FOREIGN KEY (Nro Matricula,Fecha,Hora) REFERENCES Block de Turnos (Nro Matricula,Fecha,Hora Inicio);


ALTER TABLE Turno de Quirófano y Cama ADD CONSTRAINT FK_Turno de Quirófano y Cama_0 FOREIGN KEY (Nro Turno) REFERENCES Turno (Nro Turno);
ALTER TABLE Turno de Quirófano y Cama ADD CONSTRAINT FK_Turno de Quirófano y Cama_1 FOREIGN KEY (Nro Matricula) REFERENCES Profesional (Nro Matricula);


ALTER TABLE Tiene Procedimiento ADD CONSTRAINT FK_Tiene Procedimiento_0 FOREIGN KEY (Codigo Procedimiento) REFERENCES Procedimiento Médico (Codigo Procedimiento);
ALTER TABLE Tiene Procedimiento ADD CONSTRAINT FK_Tiene Procedimiento_1 FOREIGN KEY (Nro Turno) REFERENCES Turno de Diagnóstico (Nro Turno);


