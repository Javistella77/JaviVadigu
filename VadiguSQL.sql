# JaviVadigu
Querys SQL

--                                              CREAR KITS DE MEDICAMENTO +500 Unidades

Select * from Empresa where EmpresaID = 11

Select * from CentroSubStock where EmpresaID = 11 AND CentroSubStockID = 0

Select * from FarmaciaCentroSubStock where EmpresaID = 11 AND CentroSubStockID = 0

Select SUM(Cantidad) from FarmaciaCentroSSMovimiento where MedicamentoID = 10292 and EmpresaID = 11 AND CentroSubStockID = 0

-- DROP TABLE #TMP_Stock


------------------------------------

Select DISTINCT FCSS.EmpresaID, FCSS.CentroSubStockID, FCSSM.VademecumID, FCSS.MedicamentoID, FCSS.PresentacionID 
INTO #TMP_Stock
from FarmaciaCentroSubStock FCSS
inner join FarmaciaCentroSSMovimiento FCSSM on FCSSM.EmpresaID = FCSS.EmpresaID
										And FCSSM.CentroSubStockID =  FCSS.CentroSubStockID
										And FCSSM.MedicamentoID = FCSS.MedicamentoID
where FCSS.EmpresaID = 11 
AND FCSS.CentroSubStockID = 0
--AND FCSS.MedicamentoID = 10292





INSERT INTO FarmaciaCentroSSMovimiento (EmpresaID, CentroSubStockID, VademecumID, MedicamentoID, PresentacionID, Cantidad, FarmaciaMotivoAjusteID, NumeroLote, FechaVencimiento, Observaciones)
Select 
	t.EmpresaID,
	t.CentroSubStockID,
	t.VademecumID,
	t.MedicamentoID,
	t.PresentacionID,
	10000 as  Cantidad,
	4 as FarmaciaMotivoAjusteID,
	1111 as NumeroLote,
	'2026-01-01' as FechaVencimiento,
	'Test-31651' as Observaciones
from #TMP_Stock t

Select * from MedicamentoKit

Select * from MedicamentoKitItem where MedicamentoKitID = 7

INSERT INTO MedicamentoKitItem (MedicamentoKitID, VademecumID, MedicamentoID, PresentacionID, Cantidad)
Select top 600 
	7 as MedicamentoKitID,
	t.VademecumID,
	t.MedicamentoID,
	t.PresentacionID,
	100 as Cantidad

from #TMP_Stock t

--                                              Consultas urgencia donde tenemos internacionid

Select * from urgencia where internacionid = '3341';
go
select * from internacion where internacionid = '3341';
go
select * from ocupacion where internacionid = '3341';
go
select * from UrgenciaFinAtencion where urgenciaid = '3214';

//                                                  Averiguar nombre de tabla por elemento 								
								
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'estudioGrupoID'; -- valor a remplazar	


--                                                             Convenios

	-- prod

select * from ConvenioOSconceptoPrecio -- ok
where ConvenioOSconceptoFactID in (
        select ConvenioOsConceptoFactID from ConvenioOSconceptoFact -- 
                where ConvenioObraSocialID in ( 
                        select ConvenioObraSocialID from convenioobrasocial
                        where ObraSocialID = 186)
)

select * from PreLiquidacionProfesional -- ok
where ConvenioOsConcProfesionalID in (
        select ConvenioOsConcProfesionalID from ConvenioOsConcProfesional -- 
        where ConvenioOSconceptoFactID in (        
                select ConvenioOsConceptoFactID from ConvenioOSconceptoFact -- 
                where ConvenioObraSocialID in ( 
                        select ConvenioObraSocialID from convenioobrasocial
                        where ObraSocialID = 186)
        )
)

select * from ConvenioOsConcProfesional -- ok
where ConvenioOSconceptoFactID in (        
        select ConvenioOsConceptoFactID from ConvenioOSconceptoFact -- 
        where ConvenioObraSocialID in ( 
        select ConvenioObraSocialID from convenioobrasocial
        where ObraSocialID = 186)
        )



select * from ConvenioOsConcCoseguro -- ok
where ConvenioOsConceptoFactID in (
        select ConvenioOsConceptoFactID from ConvenioOSconceptoFact -- 
        where ConvenioObraSocialID in ( 
        select ConvenioObraSocialID from convenioobrasocial
        where ObraSocialID = 186)
        )


select * from ConvenioOSconceptoFact -- ok
where ConvenioObraSocialID in ( 
        select ConvenioObraSocialID from convenioobrasocial
        where ObraSocialID = 186)

select * from ConvOSnomCapSync -- ok
where ConvenioObraSocialID in (
        select ConvenioObraSocialID from convenioobrasocial
        where ObraSocialID = 186)

select * from ConvOSvademecumSync -- ok
where ConvenioObraSocialID in (
        select ConvenioObraSocialID from convenioobrasocial
        where ObraSocialID = 186)

select * from ConvenioObraSocial -- ok
where ObraSocialID = 186

-- fin convenio

select * from Paciente
where ObraSocialID = 186

select PlanesID,* from InternacionEncabezado
where ObraSocialID = 186

select PlanesID,* from PacienteObraSocial
where ObraSocialID = 186

select planesid,ObraSocialID, * from TurnoEncabezado
where ObraSocialID = 186

update TurnoEncabezado -- okok
set ObraSocialID = 0, PlanesID = null
where ObraSocialID = 186

select * from Planes -- con datos ok borrado por front
where ObraSocialID = 186

delete from cuentaCorriente2  -- ok
where ObraSocialID = 186

DBCC CHECKIDENT (cuentaCorriente2, RESEED, 0)


--                                          Borrar info_Configuracion por usuario id 

	
select * from usuario where username = 'smoreyra' -- 4000
select * from InformePermiso where usuarioid = 4000
select * from INF_Configuracion where usuarioid = 4000
--delete from INF_Configuracion where usuarioid = 4000



Modificar ClienteID 

ClienteDescripcion = ClienteID
--------------------------------------
MSI = 1
HospitalJuanDPeron = 2
MinisteriodeSaludProvinciaDeCordoba = 3
ProvinciaDeFormosa = 4
CiudadDeBuenosAires = 5
HospitalLaCaleraProvinciaDeCordoba = 6
ProvinciaDeSanJuan = 7
Asemedis = 8
Merlo = 9
HaciendoCamino = 10
Prefectura = 11
BpsUruguay = 12
Osplad = 13
Catamarca = 14
Jujuy = 15
Orien = 16
Osde = 17
Albya = 18
CMSJ = 19
Formosa = 20
Mexico = 21
CLC = 22
-- Para consultar que ClienteID es el ambiente donde estoy:
Select Valor as ClienteID from ParametroSistemaValor where ParametroSistemaID = 'CLIENTEID'
-- Para cambiar el ClienteID por un rato y volverlo como estaba:
UPDATE ParametroSistemaValor
SET Valor = *** poner el ID del cliente ***
WHERE ParametroSistemaID = 'CLIENTEID'
-- Para voverlo como estaba antes
UPDATE ParametroSistemaValor
SET Valor = *** poner el ID del cliente que estaba antes.***
WHERE ParametroSistemaID = 'CLIENTEID'




