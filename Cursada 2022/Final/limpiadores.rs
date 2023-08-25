programa limpiadores
procesos
  proceso juntarFlores(ES flores:numero)
  comenzar
    mientras (HayFlorEnLaEsquina)
      tomarFlor
      flores:=flores+1
  fin
  proceso lado(ES flores:numero)
  comenzar
    repetir 8
      juntarFlores(flores)
      mover
  fin
areas
  AreaJefe:AreaP(1,1,1,1)
  Cuadrado1:AreaP(3,1,11,9)
  Cuadrado2:AreaP(20,1,28,9)

robots
  robot limpiador
  variables
    id,flores:numero
  comenzar
    RecibirMensaje(id,jefe)
    repetir 4
      flores:=0
      lado(flores)
      EnviarMensaje(id,jefe)
      EnviarMensaje(flores,jefe)
      derecha
  fin

  robot coordinador
  variables
    id,total1,total2,flores1,flores2:numero
  comenzar
    total1:=0
    total2:=0
    EnviarMensaje(1,limpiador1)
    EnviarMensaje(2,limpiador2)
    repetir 8
      RecibirMensaje(id,*)
      si (id=1)
        RecibirMensaje(flores1,limpiador1)
        total1:=total1+flores1
      sino
        RecibirMensaje(flores2,limpiador2)
        total2:=total2+flores2
    si (total1>total2)
      Informar('el_limpiador_ganador_es',1)
    sino
      si (total1<total2)
        Informar('el_limpiador_ganador_es',2)
      sino
        Informar('Empate',0)
  fin

variables
  limpiador1,limpiador2:limpiador
  jefe:coordinador
comenzar
  AsignarArea(limpiador1,Cuadrado1)
  AsignarArea(limpiador2,Cuadrado2)
  AsignarArea(jefe,AreaJefe)
  Iniciar(limpiador1,3,1)
  Iniciar(limpiador2,20,1)
  Iniciar(jefe,1,1)
fin
