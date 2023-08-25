/*
En la ciudad existen 2 robots corredores, un robot jefe y un robot limpiador. 
Los corredores corren cada uno por una avenida diferente con el objetivo de pasar la calle 60. 
Para esto cada corredor deberá calcular valores random entre 2 y 20 y avanzar esa cantidad de pasos.
Esto lo deberá repetir hasta alcanzar su objetivo (superar la calle 60). 
Cuando un corredor termina deberá avisar al jefe e indicarle cuántas de las esquinas por las que pasó tenían al menos 1 papel y 1 flor. 
El jefe debe informar qué robot corredor es el primero en terminar y la cantidad de esquinas contadas por este. 
El limpiador debe juntar todos los papeles de la calle 30. 
El robot limpiador, comienza en la esquina (1, 30).
El robot corredor 1 comienza en la esquina (35, 1).
El robot corredor 2 comienza en la esquina (45, 1).
El robot jefe está en la esquina (1,1)
*/

programa corredores
procesos
  proceso contar(ES masde:numero)
  variables
    flores,papeles:numero
  comenzar
    flores:=0
    papeles:=0
    mientras (HayFlorEnLaEsquina)
      tomarFlor
      flores:=flores+1
    mientras (HayPapelEnLaEsquina)
      tomarPapel
      papeles:=papeles+1
    si (flores>=1) && (papeles>=1)
      masde:=masde+1
    repetir flores
      depositarFlor
    repetir papeles
      depositarPapel
  fin

  proceso juntarPapeles
  comenzar
    mientras(HayPapelEnLaEsquina)
      tomarPapel
  fin
areas
  AreaCorredor1:AreaPC(35,1,35,79)
  AreaCorredor2:AreaPC(45,1,45,79)
  AreaLimpiador:AreaPC(1,30,100,30)
  AreaJefe:AreaP(1,1,1,1)
robots
  robot corredor
  variables
    pasos,id,masde:numero
  comenzar
    masde:=0
    RecibirMensaje(id,jefe)
    mientras(PosCa<60)
      Random(pasos,2,20)
      repetir pasos
        si (PosCa=29)
          BloquearEsquina(PosAv,PosCa+1)
        contar(masde)
        mover
        si (PosCa=31)
          LiberarEsquina(PosAv,PosCa - 1)
    EnviarMensaje(id,jefe)
    Informar('esquinas_mas_',masde)
    EnviarMensaje(masde,jefe)
  fin

  robot limpiador
  comenzar
    derecha
    repetir 99
      si (PosAv=34) || (PosAv=44)
        BloquearEsquina(PosAv+1,PosCa)
      juntarPapeles
      mover
      si (PosAv=36) || (PosAv=46)
        LiberarEsquina(PosAv -1,PosCa)
    juntarPapeles
  fin

  robot coordinador
  variables
    id,contador1,contador2:numero
  comenzar
    contador1:=0
    contador2:=0
    EnviarMensaje(1,corredor1)
    EnviarMensaje(2,corredor2)
    repetir 2
      RecibirMensaje(id,*)
      si (id=1)
        RecibirMensaje(contador1,corredor1)
      sino
        RecibirMensaje(contador2,corredor2)
    si (contador1>contador2)
      Informar('el_corredor_ganador_es',1)
    sino
      si (contador1<contador2)
        Informar('el_corredor_ganador_es',2)
      sino
        Informar('empate',0)
  fin
variables
  corredor1,corredor2:corredor
  jefe:coordinador
  limpiador1:limpiador
comenzar
  AsignarArea(corredor1,AreaCorredor1)
  AsignarArea(corredor2,AreaCorredor2)
  AsignarArea(limpiador1,AreaLimpiador)
  AsignarArea(jefe,AreaJefe)
  Iniciar(corredor1,35,1)
  Iniciar(corredor2,45,1)
  Iniciar(limpiador1,1,30)
  Iniciar(jefe,1,1)
fin