select a.id_pase,b.id_bl,b.cod_bl,b.cod_bl_master,a.num_dr,a.unidad,a.cant_piezas,a.peso,a.cod_alma,a.fecha_cre,a.fg_activo
from pase_cs as a,bl as b
where a.cod_bl=b.id_bl and a.cod_alma=b.cod_alma
