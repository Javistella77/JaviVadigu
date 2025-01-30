SELECT 
		t.TurnoID,
		Os.Descripcion AS ObraSocial,
		Emp.Descripcion AS Hospital,
		pf.Nombre AS NombreProfesional, 
		td.Descripcion AS TipoAdmision
			
FROM TurnoEncabezado t
INNER JOIN TipoAdmision td  ON t.TipoAdmisionID = td.TipoAdmisionID 
INNER JOIN Empresa Emp ON t.TRN_EmpresaID = Emp.EmpresaID
INNER JOIN Profesional pf ON t.TRN_ProfesionalID = t.TRN_ProfesionalID
INNER JOIN ObraSocial Os ON t.ObraSocialID = Os.ObraSocialID

order by 1 desc
