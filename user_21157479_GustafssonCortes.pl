% % TDA USER % %

/*--------MÓDULOS--------*/
:-module(user_21157479_GustafssonCortes,[is_user/1,all_users/1]).

/*--------Representación--------
Este TDA representa un usuario con su nombre como id de tipo entero positivo y con un historial del chat propio de tipo chatHystory.
*/


/*--------Predicados--------
is_user(List).
all_users(List).
*/

/*--------Metas--------
 Principal: --- .

 Secundario: is_user, all_users.

*/

/*--------CONSTRUCTORES--------*/

/*--------SELECTORES--------*/

/*--------PERTENENCIA--------*/
%Descripcion: Comprueba que una lista sea tipo system.
%Dom: string.
is_user(Name):-
    string(Name).

%Descripcion: Comprueba que toda una lista sea una lista de sistemas.
%Dom: Lista (lista de flows).
all_users([]).
all_users([H|T]):-
    is_user(H),
    all_users(T).



/*--------OTRAS OPERACIONES--------*/
