/*
Dos robots floreros deben juntar flores de esquinas aleatorias en una zona rectangular de 10 de alto por 20 de ancho cuyo vértice inferior izquierdo es la esquina (9,9). 
Cada robot florero tendrá una cantidad de oportunidades para seleccionar esquinas aleatorias y juntar en ellas todas las flores que encuentre. 
Un robot coordinador indicará a cada florero cuántas oportunidades tendrá para seleccionar esquinas. 
La cantidad de oportunidades será un valor aleatorio entre 2 y 5.
Una vez que los floreros hayan completado la cantidad de oportunidades que se les indicó, el coordinador deberá informar qué robot juntó más flores e indicar a dicho robot que se posicione en la esquina (9,9).
Los robots floreros inician en las equinas (1,1) y (2,1) respectivamente, y el robot coordinador inicia en la esquina (3,1).
*/

programa floreros
procesos
  proceso juntarFlores(ES flores:numero)
  comenzar
    mientras (HayFlorEnLaEsquina)
      tomarFlor
      flores:=flores + 1
  fin
areas
  AreaRectangulo:AreaPC(9,9,29,19)
  AreaInicio1:AreaP(1,1,1,1)
  AreaInicio2:AreaP(2,1,2,1)
  AreaInicioC:AreaP(3,1,3,1)
robots
  robot florero
  variables
    avenidarandom,callerandom,miavenida,micalle,flores,id,oportunidades:numero
    ganar:boolean
  comenzar
    flores:=0
    miavenida:=PosAv
    micalle:=PosCa
    RecibirMensaje(id,jefe)
    RecibirMensaje(oportunidades,jefe)
    repetir oportunidades
      Random(avenidarandom,9,29)
      Random(callerandom,9,19)
      BloquearEsquina(avenidarandom,callerandom)
      Pos(avenidarandom,callerandom)
      juntarFlores(flores)
      Pos(miavenida,micalle)
      LiberarEsquina(avenidarandom,callerandom)
    EnviarMensaje(id,jefe)
    EnviarMensaje(flores,jefe)
    RecibirMensaje(ganar,jefe)
    si (ganar)
      Pos(9,9)
  fin
  
  robot coordinador
  variables
    id,oportunidades,flores1,flores2:numero
  comenzar
    EnviarMensaje(1,florero1)
    EnviarMensaje(2,florero2)
    Random(oportunidades,2,5)
    EnviarMensaje(oportunidades,florero1)
    Random(oportunidades,2,5)
    EnviarMensaje(oportunidades,florero2)
    repetir 2
      RecibirMensaje(id,*)
      si (id=1)
        RecibirMensaje(flores1,florero1)
      sino
        RecibirMensaje(flores2,florero2)
    si(flores1>flores2)
      EnviarMensaje(V,florero1)
      EnviarMensaje(F,florero2)
      Informar('el_robot_ganador_es',1)
    sino
      si (flores1<flores2)
        EnviarMensaje(F,florero1)
        EnviarMensaje(V,florero2)
        Informar('el_robot_ganador_es',2)
      sino
        EnviarMensaje(F,florero1)
        EnviarMensaje(F,florero2)
        Informar('Empate',0)
  fin

variables
  florero1,florero2:florero
  jefe:coordinador
comenzar
  AsignarArea(florero1,AreaInicio1)
  AsignarArea(florero1,AreaRectangulo)
  AsignarArea(florero2,AreaInicio2)
  AsignarArea(florero2,AreaRectangulo)
  AsignarArea(jefe,AreaInicioC)
  Iniciar(florero1,1,1)
  Iniciar(florero2,2,1)
  Iniciar(jefe,3,1)
fin
