%Dom:
%NombreEmpleado = symbol
%NombreCargo = symbol
%NombrCargoSuperior = symbol
%NombreSubordinado = symbol

%Predicados:
%empleado(NombreEmpleado, NombreCargo)
%cargo(NombreCargo, NombrCargoSuperior)
%subordinado(NombreEmpleado,NombreSubordinado)

%Metas:
 %Principal:
  %subordinado

 %Secundario:
  %empleado, cargo

%CLAUSULAS:
%Hechos:
empleado(juan,gerente).
empleado(pedro,programador).
empleado(diego,programador).
empleado(sandra,programador).
empleado(gabriela,jefeProyecto).
empleado(jose,director).
cargo(gerente,director).
cargo(jefeProyecto,gerente).
cargo(programador,jefeProyecto).

%Reglas:
%a)
subordinado(NombreEmpleado,NombreSubordinado):-
    empleado(NombreEmpleado, Cargo1),
    empleado(NombreSubordinado, Cargo2),
    cargo(Cargo2, Cargo1).
subordinado(NombreEmpleado,NombreSubordinado):-
    empleado(NombreEmpleado, Cargo1),
    cargo(Cargo2,Cargo1),
    empleado(NombreEmpleadoMedio, Cargo2),
    subordinado(NombreEmpleadoMedio,NombreSubordinado).



%b)
jefeSupremo(NombreEmpleado):-
    empleado(NombreEmpleado, Cargo),
    cargo(_,Cargo),
    not(cargo(Cargo,_)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Dom:
%Nombre: symbol.
%MaxKi: int+.
%ListaPoderes: Lista de symbols.
%ListaTransformaciones: Lista de symbols.

%Predicados:
%personaje(Nombre,MaxKi,ListaPoderes,ListaTransformaciones).
%gana(NombrePersonajeGanador,NombrePersonajePerdedor).
%transforma(NombrePersonaje,Transformacion).
%tecnica(NombrePersonaje,Tecnica).
%member2(Elemento,Lista).

%Metas:
 %Principales:
  %gana,transforma,tecnica.

 %Secundaris:
  %member2,personaje.

%CLAUSULAS:

%Hechos
personaje(goku,150000000,[kamehameha, kaioken,genkidama],[normal,ssj1]).
personaje(krilin,75000,[kamehameha,taioken,kienzan],[normal]).
personaje(freezer,12000000,[blaster],[normal,cincuenta,cien]).
personaje(vegeta,250000,[bigbangattack,finalflash],[normal]).

%Reglas:
%a)
gana(P1,P2):-
    personaje(P1,Ki1,_,_),
    personaje(P2,Ki2,_,_),
    Ki1>Ki2.
%b)

member2(A,[A|_]).
member2(A,[_|T]):-
    member2(A,T).

transforma(P,T):-
    personaje(P,_,_,Lista),
    member2(T,Lista).


%c)
tecnica(P,T):-
    personaje(P,_,Lista,_),
    member2(T,Lista).
