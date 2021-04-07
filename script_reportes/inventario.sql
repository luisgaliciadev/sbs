SELECT     c.cod_conte, i.cod_iso, c.imo AS IMO, c.precinto, a.nombre, c.modulo, c.bay, c.fila, c.piso, c.estatus, 
CASE c.condicion WHEN '1' THEN 'NORMAL' WHEN '2' THEN 'DAÑADO' ELSE 'OXIDADO' END AS CONDICION, l.siglas, uc.cod_untac AS carga, 
ud.cod_untac AS descarga, b.nb_buque, bl.cod_bl, c.ultimo_viaje, es.ds_estado AS estado
FROM  contenedor AS c, codigo_iso_contenedor AS i, almacen AS a, linea_naviera AS l, buques AS b, bl, untac AS uc, untac AS ud, puertos AS pc,  
puertos AS pd, IMO AS im, estados_carga AS es  
WHERE c.cod_iso = i.id_iso AND (c.cod_alma) = a.cod_alma AND c.linea_naviera = l.id_linea AND c.ultimo_buque = b.id_buque AND c.ultimo_bl = bl.id_bl AND  
c.ultimo_puerto_carga = uc.id_puertos AND c.ultimo_puerto_descarga = ud.id_puertos AND c.ultimo_puerto_carga = (pc.id_puerto) AND  
c.ultimo_puerto_descarga = (pd.id_puerto) AND c.ultimo_estado = es.id_estado and c.imo=im.imo_clasificacion and a.cod_alma=6 and( ultimo_EStado=1 or ultimo_EStado=2 or ultimo_EStado=3 or ultimo_EStado=6 or ultimo_EStado=7)