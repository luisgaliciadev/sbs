SELECT DISTINCT bl.cod_bl, bl.cod_bl_master, bl.num_viaje, t.descrip_tipo, b.nb_buque, uc.cod_untac AS pto_carga, ud.cod_untac AS pto_descarga, p.siglas AS siglas_pais,
c.nb_proveed_benef AS consig, l.siglas AS siglas_linea, bl.cif, a.nombre, count(cod_bl) AS cant_facturas
FROM bl, tipo_carga AS t, buques AS b, puertos AS pc, puertos AS pd, untac AS uc, untac AS ud, pais AS p, consignatarios AS c, linea_naviera AS l, almacen AS a, preliquidacion AS pre
WHERE bl.tipo_carga = t.id_tipo_carga AND bl.cod_buque = b.id_buque AND bl.pto_carga = pc.id_puerto AND bl.pto_descarga = pd.id_puerto AND bl.pto_carga = uc.id_puertos
AND bl.pto_descarga = ud.id_puertos AND bl.pais_origen = p.expr1 AND bl.cod_consig = c.id_beneficiario AND bl.linea_naviera = l.id_linea AND bl.cod_alma = a.cod_alma
AND pre.id_bl = bl.id_bl AND pre.fg_activo <> 0
GROUP BY bl.cod_bl, bl.cod_bl_master, bl.num_viaje, t.descrip_tipo, b.nb_buque, uc.cod_untac, ud.cod_untac, p.siglas, c.nb_proveed_benef, l.siglas, bl.cif, a.nombre