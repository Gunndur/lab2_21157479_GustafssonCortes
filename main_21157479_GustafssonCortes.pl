/*Predicados:
option(Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword,Option).

*/

/*Metas:
 Principal: option,

 Secundario:

*/

%CLAUSULAS:
%Hechos:
query(O1,O2):-
    option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1),
    option("hola", "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2).


%Reglas:

/*-------------- Requerimientos funcionales --------------*/

%2)

 /*Descripción: Crea una opción a escoger, esta construye una opción para un flujo de un chatbot, siendo estos
 unicos mediante su propio id. Cada opción se une a un chatbot y un flujo específicos.
 */

 /*Dom:
 code = entero(+).
 message = string.
 ChatbotCodeLink = entero(+).
 InitialFlowCodeLink =entero(+).
 Keyword = Lista de strings.
 Option = option.
 */

option(Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword,Option):-
    string(Message),
    positivo_mayor_que_cero(Code),
    positivo_mayor_que_cero(ChatbotCodeLink),
    positivo_mayor_que_cero(InitialFlowCodeLink),
    all_string(Keyword),
    Option = [Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword].


positivo_mayor_que_cero(Numero):-
    integer(Numero), Numero >= 0.

all_string([]).
all_string([H|T]):-
    string(H),
    all_string(T).


%3)

 /*Descripción:
  id = entero(+).
  name-msg = string.
  Option = Lista de options.
  Flow = flow
 */

 /*Dom:

 */

flow(Id,Name_msg,Option,Flow):-
    positivo_mayor_que_cero(Id),
    string(Name_msg),
    all_options(Option),
    delete_duplicate_option(Option,NOption),
    Flow = [Id,Name_msg,NOption].

is_option([Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword]):-
    option(Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword,[Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword]).

all_options([]).
all_options(H|T):-
    is_option(H),
    all_options(T).

delete_duplicate_id([],Aux,Aux).
delete_duplicate_id([[Code|T1]|T2],Aux,Result):-
    cons([Code|T1],Aux,NAux),
    (is_id_in_list(Code,Aux) ->
        delete_duplicate_id(T2,Aux,Result);
        delete_duplicate_id(T2,NAux,Result)).

delete_duplicate_option(Option,NOption):-
    delete_duplicate_id(Option,[],NOption).

is_id_in_list(_,[]).
is_id_in_list(Id,[[H|_]|T]):-
    Id = H;
    is_id_in_list(Id,T).

cons(A,B,[A|B]).


%4)

 /*Descripción:

 */

 /*Dom:

 */
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% append(Lista1,[Elem], Lista2).

flowAddOption([Id,Name_msg,Options],Option, NFlow):-
    append(Options,[Option],NOptions),
    delete_duplicate_option(NOptions, NNOptions),
    flow(Id,Name_msg,NNOptions,NFlow).






%5)

 /*Descripción:

 */

 /*Dom:

 */


