/*

████████╗███████╗░██████╗████████╗░██████╗
╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔════╝
░░░██║░░░█████╗░░╚█████╗░░░░██║░░░╚█████╗░
░░░██║░░░██╔══╝░░░╚═══██╗░░░██║░░░░╚═══██╗
░░░██║░░░███████╗██████╔╝░░░██║░░░██████╔╝
░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░╚═════╝░

*/

:- include('amistad.pl').

cambiarPreferenciasAPachi :-
  retract(quiereViajar(pachi, rio)).

resetearEstadoDePachi :-
  assert(quiereViajar(pachi, rio)).

:- begin_tests(puedenPlanificarViaje).

test(gachi_planifica_viaje_con_otras_personas, set(Persona == [pachi])):-
  puedenPlanificarViaje(gachi, Persona).

test(gachi_no_puede_planificar_viaje_si_no_comparte_gustos, nondet):-
  cambiarPreferenciasAPachi,
  not(puedenPlanificarViaje(gachi, pachi)),
  resetearEstadoDePachi.

test(lugares_favoritos_de_pachi, set(Lugar = [rio, bariloche])):-
  quiereViajar(pachi, Lugar).

:- end_tests(puedenPlanificarViaje).
