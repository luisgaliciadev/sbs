SELECT  a.id_bl,a.cod_bl,a.cod_bl_master,b.num_dr,b.carga_neta,b.carga_comp,b.unidad_med,b.cant_piezas,a.num_viaje,a.cod_buque,a.pto_carga,a.pto_descarga,a.pais_origen,a.cod_consig,a.linea_naviera,a.tipo_carga,a.cod_alma,b.fg_reconocido,b.fg_retenido,a.fg_activo,b.estado
FROM        bl as a, deta_bl as b
where tipo_carga=2 and a.id_bl=b.cod_bl and  ((estado>0 AND estado<4) or estado=7)
