:- dynamic hayQuimica/2.
hayQuimica(gachi, pachi).
hayQuimica(gachi, susy).
hayQuimica(susy, rulo).
hayQuimica(tuki, fede).
hayQuimica(Persona, pipi):-seLlevanBien(Persona, susy).

seLlevanBien(Persona, OtraPersona):-hayQuimica(Persona, OtraPersona).
seLlevanBien(Persona, OtraPersona):-hayQuimica(OtraPersona, Persona).

:- dynamic quiereViajar/2.
quiereViajar(gachi, rio).
quiereViajar(gachi, bariloche).
quiereViajar(pachi, rio).
quiereViajar(pachi, bariloche).
quiereViajar(susy, puertoMadryn).
quiereViajar(tuki, rio).
quiereViajar(tuki, bariloche).
quiereViajar(fede, cataratas).

puedenPlanificarViaje(Persona1, Persona2):-
  seLlevanBien(Persona1, Persona2),
  forall(quiereViajar(Persona1, Lugar), quiereViajar(Persona2, Lugar)).
