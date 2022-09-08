programa jugadores2
procesos
  proceso juntarFlores(ES flores:numero;ES total:numero)
  comenzar
    mientras (HayFlorEnLaEsquina)
      tomarFlor
      flores:=flores+1
      total:=total+1
  fin
  proceso dejarFlores(E totalf:numero)
  comenzar
    repetir totalf
      depositarFlor
  fin

areas
  AreaJuego:AreaPC(1,1,20,20)
  AreaPerdedor:AreaPC(25,25,25,25)
  AreaInicio1:AreaP(21,21,21,21)
  AreaInicio2:AreaP(22,22,22,22)
  AreaJefe:AreaP(23,23,23,23)
robots
  robot jugador
  variables
    id,MiAv,MiCa,av,ca,flores,total:numero
    ir:boolean
  comenzar
    RecibirMensaje(id,jefe)
    total:=0
    MiAv:=PosAv
    MiCa:=PosCa
    repetir 5
      flores:=0
      Random(av,1,20)
      Random(ca,1,20)
      BloquearEsquina(av,ca)
      Pos(av,ca)
      juntarFlores(flores,total)
      Pos(MiAv,MiCa)
      LiberarEsquina(av,ca)
      EnviarMensaje(id,jefe)
      EnviarMensaje(flores,jefe)
    RecibirMensaje(ir,jefe)
    si (ir)
      Pos(25,25)
      dejarFlores(total)
  fin
  
  robot fiscalizador
  variables
    id,total1,total2,flores1,flores2:numero
  comenzar
    total1:=0
    total2:=0
    EnviarMensaje(1,jugador1)
    EnviarMensaje(2,jugador2)
    repetir 10
      RecibirMensaje(id,*)
      si (id=1)
        RecibirMensaje(flores1,jugador1)
        total1:=total1 + flores1
      sino
        RecibirMensaje(flores2,jugador2)
        total2:=total2 + flores2
    si (total1>total2)
      EnviarMensaje(F,jugador1)
      EnviarMensaje(V,jugador2)
      Informar('el_robot_ganador_es',1)
    sino
      si (total1<total2)
        EnviarMensaje(V,jugador1)
        EnviarMensaje(F,jugador2)
        Informar('el_robot_ganador_es',2)
      sino
        EnviarMensaje(F,jugador1)
        EnviarMensaje(F,jugador2)
        Informar('Empate',0)
  fin

variables
  jugador1,jugador2: jugador
  jefe:fiscalizador
comenzar
  AsignarArea(jugador1,AreaJuego)
  AsignarArea(jugador1,AreaPerdedor)
  AsignarArea(jugador1,AreaInicio1)
  AsignarArea(jugador2,AreaJuego)
  AsignarArea(jugador2,AreaPerdedor)
  AsignarArea(jugador2,AreaInicio2)
  AsignarArea(jefe,AreaJefe)
  Iniciar(jugador1,21,21)
  Iniciar(jugador2,22,22)
  Iniciar(jefe,23,23)
fin
