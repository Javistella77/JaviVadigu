-- Habilitar Turneros utlizando ArbolItem

-- Se habilitan turneros MVC AMB, LAB, IMG, ODO (es igual en todos los ambientes)
UPDATE ArbolItem
 SET Link = '@/TurnoInmediatoAmbulatorio', Descripcion = 'Gestión de Turnos'
 WHERE ArbolItemID = 3
UPDATE ArbolItem
 SET Link = '@/TurnoInmediatoAmbulatorio', Descripcion = 'Turnos Call Center'
 WHERE ArbolItemID = 719
UPDATE ArbolItem
 SET Link = '@/TurnoInmediatoImagen', Descripcion = 'Turnos'
 WHERE ArbolItemID = 138
UPDATE ArbolItem
 SET Link = '@/TurnoInmediatoLaboratorio', Descripcion = 'Turnos'
 WHERE ArbolItemID = 143
UPDATE ArbolItem
 SET Link = '@/TurnoInmediatoOdontologia', Descripcion = 'Turnos'
 WHERE ArbolItemID = 317

	-- Ocultar ArbolItem

-- Se ocultan agendas viejas para crear turnos (es igual en todos los ambientes)
UPDATE ArbolItem
 SET Visible = 0
 WHERE ArbolItemID IN (85, 150, 151, 318)
