PARAMETERS Total
  * Autor: Anselmo Antonio Ortiz Alcocer
  Dimension aUnidades(9), aDecenas(14), aCentenas(10)
  aUnidades(1) = 'UN'
  aUnidades(2) = 'DOS'
  aUnidades(3) = 'TRES'
  aUnidades(4) = 'CUATRO'
  aUnidades(5) = 'CINCO'
  aUnidades(6) = 'SEIS'
  aUnidades(7) = 'SIETE'
  aUnidades(8) = 'OCHO'
  aUnidades(9) = 'NUEVE'
  aDecenas(1) = 'DIEZ'
  aDecenas(2) = 'ONCE'
  aDecenas(3) = 'DOCE'
  aDecenas(4) = 'TRECE'
  aDecenas(5) = 'CATORCE'
  aDecenas(6) = 'QUINCE'
  aDecenas(7) = 'VEINTE'
  aDecenas(8) = 'TREINTA'
  aDecenas(9) = 'CUARENTA'
  aDecenas(10) = 'CINCUENTA'
  aDecenas(11) = 'SESENTA'
  aDecenas(12) = 'SETENTA'
  aDecenas(13) = 'OCHENTA'
  aDecenas(14) = 'NOVENTA'
  aCentenas(1) = 'CIEN'
  aCentenas(2) = 'DOSCIENTOS'
  aCentenas(3) = 'TRESCIENTOS'
  aCentenas(4) = 'CUATROCIENTOS'
  aCentenas(5) = 'QUINIENTOS'
  aCentenas(6) = 'SEISCIENTOS'
  aCentenas(7) = 'SETECIENTOS'
  aCentenas(8) = 'OCHOCIENTOS'
  aCentenas(9) = 'NOVECIENTOS'
 
  vTotal = str(int(Total), 12)
 
  Do case
    Case empty(val(vTotal))
      Texto = 'CERO PESOS'
 
    Case val(vTotal) = 1
      Texto = 'UN PESO'
 
    Otherwise
      tCientos     = obt_cant(substr(vTotal,10,3))
      tMiles       = obt_cant(substr(vTotal,7,3))
      tMillones    = obt_cant(substr(vTotal,4,3))
      tMilMillones = obt_cant(substr(vTotal,1,3))
 
      tCientos = tCientos
      tMiles = iif(empty(tMiles), '', ;
               iif(tMiles='UN', '', tMiles + ' ') + 'MIL ')
      tMillones = iif(empty(tMillones), '', ;
               tMillones + ' MILLON' + iif(tMillones='UN', ' ', 'ES ') +;
               iif(empty(tMiles + tCientos), 'DE', ''))
      tMilMillones = iif(empty(tMilMillones), '', ;
               iif(tMilMillones='UN', '', tMilMillones + ' ') + 'MIL ' +;
               iif(empty(tMillones), 'MILLONES ', ' ') +;
               iif(empty(tMillones + tMiles + tCientos), 'DE', ''))
 
      Texto = strtran(tMilMillones + tMillones + tMiles + tCientos, '  ', ' 
') + ' PESOS'
  Endcase
 
Return Texto + iif(!empty(Total), ' CON ' + strtran(transform(int((total - 
int(total)) * 100), '**'), '*', '0') + '/100 M.N.', '')
 
Function obt_cant(valor)
  Public Unidades, Decenas, Centenas
 
  If empty(val(valor))
    Return ''
  Endif
 
  Store '' to tUnidades, tDecenas, tCentenas
  Unidades = int(val(substr(valor,3,1))) &&          123
  Decenas  = int(val(substr(valor,2,1))) && vTotal = 999
  Centenas = int(val(substr(valor,1,1))) &&          ^^^
  valor = int(val(valor))
 
  tUnidades = iif(!empty(unidades), aUnidades(Unidades), '')
 
  If !empty(decenas)
    If decenas = 1
      tDecenas = iif(val(right(str(valor,3),2)) >= 10 and
val(right(str(valor,3),2)) <= 15, aDecenas(val(right(str(valor,3),2)) - 9),
'DIECI' + tUnidades)
      tUnidades = ''
    Else
      tDecenas = aDecenas(decenas + 5)
      if !empty(unidades)
        * QUITAR LOS ASTERISCOS SI NO NOS GUSTA QUE CONVIERTA
        * 35 COMO TREINTICINCO SINO COMO TREINTA Y CINCO...
        *If Decenas <= 2
          tDecenas = left(tDecenas, len(tDecenas) - 1) + 'I'
        *Else
        *  tDecenas = tDecenas + ' Y '
        *Endif
 
      Endif
    Endif
  Endif
 
  If !empty(centenas)
    tCentenas = aCentenas(centenas)
    If valor > 100
      If centenas = 1
        tCentenas = tCentenas + 'TO '
      Else
        tCentenas = tCentenas + ' '
      Endif
    Endif
  Endif
 
Return tCentenas + tDecenas + tUnidades