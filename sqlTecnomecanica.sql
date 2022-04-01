create database Tecnomecanica 
   

create table Persona (
    id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Identificacion varchar(255),
    Nombre varchar(255),
    Apellido varchar(255)
);


create table Vehiculo (
    id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Marca varchar(255),
    Modelo varchar(255),
    Patente varchar(255),
	Año varchar(255),
	id_persona int FOREIGN KEY REFERENCES Persona(id)
);

create table Revision (
    id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	id_Vehiculo int FOREIGN KEY REFERENCES Vehiculo(id),
    Aprobado bit,
    observaciones varchar(255),
	id_persona int FOREIGN KEY REFERENCES Persona(id),
	Fecha_Revision date
);

create table Tipo_revison (
    id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nombre varchar(255),
);

create table Inspeccion (
    id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	id_Revision int FOREIGN KEY REFERENCES Revision(id),
    id_TipoRevision int FOREIGN KEY REFERENCES Tipo_revison(id),
    observaciones varchar(255),
	Estado bit,
	id_persona int FOREIGN KEY REFERENCES Persona(id),
);

--llenado de campos primera consulta 
insert into Persona  (Identificacion,Nombre,Apellido) VALUES  ('1023456879','JONATHAN','FIQUE')
insert into Vehiculo (Marca,Modelo,Patente,Año,id_persona) VALUES ('AKT','EVO R3','jpd83d','2015',1)
insert into Revision (id_Vehiculo,Aprobado,observaciones,id_persona,Fecha_Revision) VALUES (3,0,'no revisado',1,'01-04-2022')
insert into Tipo_revison (Nombre) VALUES ('Inspeccion Luces')
insert into Inspeccion (id_Revision,id_TipoRevision,observaciones,Estado,id_persona) VALUES (2,1,'Luces ok',1,1)


--- select para obtebner historia por patente o placa para colombia 
select Identificacion,Persona.Nombre,Marca,patente,Aprobado,Revision.observaciones, Tipo_revison.Nombre,
Inspeccion.Estado,Inspeccion.observaciones
from Persona
inner join Vehiculo on Persona.id = Vehiculo.id_persona
inner join Revision on Persona.id = Revision.id_persona
inner join Inspeccion on Inspeccion.id_Revision = Revision.id
inner join Tipo_revison on  Tipo_revison.id =Inspeccion.id_TipoRevision
order by Patente

select * from Tipo_revison