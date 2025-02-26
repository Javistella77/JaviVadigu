--                                              Eliminar trigger 
DISABLE TRIGGER TR_TipoAdmisionAud_upd ON TurnoEncabezado

--                                             Verificar que quede desabilitado 
y esto para verificar que quedo deshabilado:
Select
    name AS TriggerName,
    is_disabled AS IsDisabled
FROM sys.triggers
WHERE name = 'TR_TipoAdmisionAud_upd';
