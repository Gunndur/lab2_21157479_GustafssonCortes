% % TDA OPTION % %

:-module(option_21157479_GustafssonCortes,[]).

/*Representación:
Este TDA representa las opciones/respuestas que puede optar el usuario ante el chatbot, se constituye por un id unico de tipo entero positivo,
un mensaje que entregar de tipo string, el link del id del chatbot asociado de tipo entero positivo al igual que el id del flow inicial
y también posee una lista de las palabras claves, que cada una es de tipo string.
*/


/*Predicados
is_option([Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword]).
all_options(List).
delete_duplicate_id(List,A,B).
delete_duplicate_option(Option,NOption).
is_id_in_list(Id,List).
positivo_mayor_que_cero(Numero).
all_string(List).
cons(A,B,C).
*/

/*Metas:
 Principal: --- .

 Secundario: is_option, all_options, delete_duplicate_id,
 delete_duplicate_option, is_id_in_list, positivo_mayor_que_cero,
 all_string, cons.

*/

%CLAUSULAS:
%Hechos: --- .

%Reglas:

%Descripcion: Comprueba que una lista sea tipo Option.
is_option([Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword]):-
    option(Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword,[Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword]).

%Descripcion: Comprueba que toda una lista sea una lista de Options.
all_options([]).
all_options(H|T):-
    is_option(H),
    all_options(T).

% Descripcion: Elimina los duplicados verificando el id.
delete_duplicate_id([],Aux,Aux).
delete_duplicate_id([[Code|T1]|T2],Aux,Result):-
    cons([Code|T1],Aux,NAux),
    (is_id_in_list(Code,Aux) ->
        delete_duplicate_id(T2,Aux,Result);
        delete_duplicate_id(T2,NAux,Result)).

% Descripcion: Elimina los duplicacos entre opciones, verificando por
% medio del id.
delete_duplicate_option(Option,NOption):-
    delete_duplicate_id(Option,[],NOption).

% Descripcion: Verifica si un id especifico se encuentra en una lista.
is_id_in_list(_,[]).
is_id_in_list(Id,[[H|_]|T]):-
    Id = H;
    is_id_in_list(Id,T).

% Descripcion: Cons...
cons(A,B,[A|B]).

% Descripcion: Verifica que el numero sea mayor o igual a cero.
positivo_mayor_que_cero(Numero):-
    integer(Numero), Numero >= 0.

% Descripcion: Comprueba que una lista sea una lista de strings.
all_string([]).
all_string([H|T]):-
    string(H),
    all_string(T).
