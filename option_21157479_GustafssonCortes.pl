% % TDA OPTION % %

/*--------MÓDULOS--------*/
:-module(option_21157479_GustafssonCortes,[is_option/1,all_options/1,is_id_in_list/2,positivo_mayor_que_cero/1,all_string/1,cons/3,unir/3,get_Code_Option/2,get_Message_Option/2,get_CCL_Option/2,get_IFCL_Option/2,get_Keyword_Option/2]).

:-use_module(main_21157479_GustafssonCortes,[option/6]).

/*--------Representación--------
Este TDA representa las opciones/respuestas que puede optar el usuario ante el chatbot, se constituye por un id unico de tipo entero positivo,
un mensaje que entregar de tipo string, el link del id del chatbot asociado de tipo entero positivo al igual que el id del flow inicial
y también posee una lista de las palabras claves, que cada una es de tipo string.
*/


/*--------Predicados--------
is_option([Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword]).
all_options(List).
is_id_in_list(Id,List).
positivo_mayor_que_cero(Numero).
all_string(List).
cons(A,B,C).
unir(L1,Elemento,L2).
get_Code_Option(Option,Code).
get_Message_Option(Option,Message).
get_CCL_Option(Option,CCL).
get_IFCL_Option(Option,IFCL).
get_Keyword_Option(Option,Keyword).
*/

/*--------Metas--------
 Principal: --- .

 Secundario: is_option, all_options, delete_duplicate_id,
 delete_duplicate_option, is_id_in_list, positivo_mayor_que_cero,
 all_string, cons, unir, get_Code_Option, get_Message_Option,
 get_CCL_Option, get_IFCL_Option, get_Keyword_Option.

*/

/*--------CONSTRUCTORES--------*/
%En main...


/*--------SELECTORES--------*/

%Descripcion: Selecciona el codigo del option.
/*Dom:
  Option = option.
  Code = entero(+).
*/
get_Code_Option([Code,_,_,_,_],Code).

%Descripcion:
/*Dom:
  Option = option.
  Message = string.
*/
get_Message_Option([_,Message,_,_,_],Message).

%Descripcion: Selecciona el link del chatbot de un option.
/*Dom:
  Option = option.
  ChatbotCodeLink = entero(+).
*/
get_CCL_Option([_,_,ChatbotCodeLink,_,_],ChatbotCodeLink).

% Descripcion: Selecciona el código del link inicial del flow de un
% option.
/*Dom:
  Option = option.
  InitialFlowCodeLink = entero(+).
*/
get_IFCL_Option([_,_,_,InitialFlowCodeLink,_],InitialFlowCodeLink).

%Descripcion: Selecciona las o el Keywors de un option.
/*Dom:
  Option = option.
  Keyword = Lista de strings.
*/
get_Keyword_Option([_,_,_,_,Keyword],Keyword).



/*--------PERTENENCIA--------*/


%Descripcion: Comprueba que una lista sea tipo Option.
%Dom: Lista.
is_option([Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword]):-
    option(Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword,[Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword]).


%Descripcion: Comprueba que toda una lista sea una lista de Options.
%Dom: Lista (lista de options).
all_options([]).
all_options([H|T]):-
    is_option(H),
    all_options(T).


% Descripcion: Comprueba que una lista sea una lista de strings.
% Dom: Lista.
all_string([]).
all_string([H|T]):-
    string(H),
    all_string(T).



/*--------OTRAS OPERACIONES--------*/

% Descripcion: Verifica si un id especifico se encuentra en una lista.
/*Dom:
  ID = entero(+).
  Lista = lista de strings.
*/
is_id_in_list(Id,[[Id|_]|_]).
is_id_in_list(Id,[[_|_]|T]):-
    is_id_in_list(Id,T).


% Descripcion: Une un elemento a una lista y retorna una segunda lista
% con ese elemento integrado.
/*Dom:
  Lista, Lista2 = Listas del mismo elemento.
  Elemento = symbol.
*/
unir(Lista1,[Elem], Lista2):-
    append(Lista1, [Elem], Lista2).


% Descripcion: Cons
% Dom: Número x Lista x Lista.
cons(A,B,[A|B]).


% Descripcion: Verifica que el numero sea mayor o igual a cero.
% Dom: Número = entero(+).
positivo_mayor_que_cero(Numero):-
    integer(Numero), Numero >= 0.







