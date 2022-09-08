/*Escriba un programa donde existen 4 robots jugadores y 1 robot jefe. 
Cada robot jugador debe recorrer una  avenida determinada de la siguiente manera: 
elige un número al azar entre 1 y 7 y debe avanzar tantos pasos como indica el número (sin caerse de la ciudad) mientras avanza debe juntar todos los papeles de cada esquina.  
Cuando llega a la calle 100 le avisa al robot jefe. 
El robot jefe debe informar qué número de robot terminó  primero y el número de robot que terminó segundo. 
Notas: 
El robot jefe inicia en la esquina (1,1). 
El robot jugador 1 inicia en la esquina (2,1) y recorre la avenida 2. 
El robot jugador 2 inicia en la esquina (3,1) y recorre la avenida 3. 
El robot jugador 3 inicia en la esquina (4,1) y recorre la avenida 4. 
El robot jugador 4 inicia en la esquina (5,1) y recorre la avenida 5.
*/

programa jugadores
procesos
  proceso juntarPapeles
  comenzar
    mientras (HayPapelEnLaEsquina)
      tomarPapel
  fin
areas
  AreaJefe:AreaP(1,1,1,1)
  AreaJugador1:AreaP(2,1,2,100)
  AreaJugador2:AreaP(3,1,3,100)
  AreaJugador3:AreaP(4,1,4,100)
  AreaJugador4:AreaP(5,1,5,100)
robots
  robot jugador
  variables    
    id,pasos:numero
  comenzar
    RecibirMensaje(id,RobotJefe)
    mientras (PosCa<100)
      Random(pasos,1,7)
      repetir pasos
        juntarPapeles
        si (PosCa<100)
          mover
    EnviarMensaje(id,RobotJefe)
  fin

  robot jefe
  variables
    primero,segundo,id:numero
  comenzar
    EnviarMensaje(1,jugador1)
    EnviarMensaje(2,jugador2)
    EnviarMensaje(3,jugador3)
    EnviarMensaje(4,jugador4)
    RecibirMensaje(id,*)
    primero:=id
    RecibirMensaje(id,*)
    segundo:=id
    RecibirMensaje(id,*)
    RecibirMensaje(id,*)
    Informar('el-ganador-es',primero)
    Informar('el-segundo-es',segundo)
  fin

variables
  RobotJefe:jefe
  jugador1:jugador
  jugador2:jugador
  jugador3:jugador
  jugador4:jugador
comenzar
  AsignarArea(RobotJefe,AreaJefe)
  AsignarArea(jugador1,AreaJugador1)
  AsignarArea(jugador2,AreaJugador2)
  AsignarArea(jugador3,AreaJugador3)
  AsignarArea(jugador4,AreaJugador4)
  Iniciar(RobotJefe,1,1)
  Iniciar(jugador1,2,1)
  Iniciar(jugador2,3,1)
  Iniciar(jugador3,4,1)
  Iniciar(jugador4,5,1)
fin