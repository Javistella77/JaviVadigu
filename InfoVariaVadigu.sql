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


_buscar -> Busqueda de sp 
_buscar2 -> buscar tablas

Solución indice caso cat prod 

CREATE INDEX IX_SeguimientoEstudio_SeguimientoID]_ ON SeguimientoEstudio([SeguimientoID])
10:11
sino nos prenden fuego catamarca :smile:
10:11
y este
CREATE INDEX IX_SeguimientoEstudio_EstudioGrupoID]_ ON SeguimientoEstudio([EstudioGrupoID])
10:15
mejoro ya bastante tirandole :
update statistics Ocupacion
update statistics EstudioControl
update statistics EstudioSeguimiento
update statistics PAciente
update statistics Turnoencabezado



-- Número de tablas más usadas
DECLARE @TopN INT = 10;

SELECT TOP (@TopN)
    s.name AS SchemaName,
    t.name AS TableName,
    SUM(us.user_seeks + us.user_scans + us.user_lookups + us.user_updates) AS TotalAccesses
FROM sys.dm_db_index_usage_stats us
JOIN sys.tables t ON t.object_id = us.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE us.database_id = DB_ID()
GROUP BY s.name, t.name
ORDER BY TotalAccesses DESC;


 2 ACTUALIZA ALGO INTERNO DEL MOTOR ( Estadisticas) DE LAS TABLAS MAS USADAS ...se debe correr desde SQL Manag...no funka en tools
-- Parámetro: Número de tablas más usadas a considerar
DECLARE @TopN INT = 10;

-- Tabla temporal para almacenar los comandos
DECLARE @SQL NVARCHAR(MAX) = '';

-- Generar comandos de UPDATE STATISTICS
SELECT @SQL = STRING_AGG('UPDATE STATISTICS [' + s.name + '].[' + t.name + '];', CHAR(13))
FROM (
    SELECT 
        OBJECT_ID AS object_id,
        MAX(user_seeks + user_scans + user_lookups) AS usage_count
    FROM sys.dm_db_index_usage_stats
    WHERE database_id = DB_ID()
    GROUP BY OBJECT_ID
) AS usage
JOIN sys.tables t ON t.object_id = usage.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
ORDER BY usage.usage_count DESC
OFFSET 0 ROWS FETCH NEXT @TopN ROWS ONLY;

-- Ejecutar los comandos generados
EXEC sp_executesql @SQL;

3 COMO SABER SI UNA TABLA ( de las mas usadas) necesita indices Y SUGERIR CUALES PONER
DECLARE @TableName NVARCHAR(256) = 'TuNombreTabla';  -- <-- Cambia esto por tu tabla

SELECT 
    OBJECT_NAME(mid.object_id) AS TableName,
    migs.user_seeks, 
    migs.user_scans,
    mid.equality_columns,
    mid.inequality_columns,
    mid.included_columns,
    migs.avg_total_user_cost,
    migs.avg_user_impact,
    'CREATE INDEX IX_' + OBJECT_NAME(mid.object_id) + '_' +
        REPLACE(REPLACE(ISNULL(mid.equality_columns, '') + '_' + ISNULL(mid.inequality_columns, ''), ', ', '_'), '[', '') +
        ' ON ' + OBJECT_NAME(mid.object_id) + '(' + ISNULL(mid.equality_columns, '') +
        CASE WHEN mid.inequality_columns IS NOT NULL THEN ',' + mid.inequality_columns ELSE '' END + ')' +
        ISNULL(' INCLUDE (' + mid.included_columns + ')', '') AS SuggestedIndex
FROM sys.dm_db_missing_index_details mid
JOIN sys.dm_db_missing_index_groups mig ON mid.index_handle = mig.index_handle
JOIN sys.dm_db_missing_index_group_stats migs ON mig.index_group_handle = migs.group_handle
WHERE OBJECT_NAME(mid.object_id) = @TableName
ORDER BY migs.avg_user_impact DESC;
