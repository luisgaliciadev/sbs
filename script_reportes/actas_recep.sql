SELECT a.cod_acta,a.id_bl,a.cod_bl,c.num_dr,b.cod_bl_master,c.carga_neta,c.carga_comp,c.cant_piezas,c.unidad_med,a.cod_consig,a.cod_buque,a.viaje,a.fecha_atr,a.fecha_recp,a.fecha_cre,a.cod_alma,a.fg_activo
from acta_recep as a, bl as b, deta_bl as c
where a.id_bl=b.id_bl and a.cod_bl=b.cod_bl and a.viaje=b.num_viaje and a.id_bl=c.cod_bl 