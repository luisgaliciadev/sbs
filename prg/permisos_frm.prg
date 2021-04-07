LPARAMETERS Vcod_mod
conex=SQLCONNECT("bppc")
IF conex > 0 
	lsql="select * from permisos_usuarios"
	resp=SQLEXEC(conex, lsql, "permisos_usuarios")
	IF resp>0
		SELECT permisos_usuarios
		GO top
	ELSE
		MESSAGEBOX("Disculpe, error en la consulta por favor comunicarse con el Dpto. de Informática .",0+16,"Error de conexión")
	ENDIF 
ELSE
	MESSAGEBOX("Disculpe, no existe conexión con el servidor.",0+16,"Error de conexión")
ENDIF 

SET EXACT ON
SELECT permisos_usuarios
GO TOP
LOCATE FOR cod_mod=Vcod_mod AND cedula=Vgc_usuario
IF FOUND()
	RETURN permiso
ELSE
	MESSAGEBOX("Disculpe, no posee permisos para el módulo",0+16,"Mensaje")
	RETURN '0' 
ENDIF 
SET EXACT OFF 