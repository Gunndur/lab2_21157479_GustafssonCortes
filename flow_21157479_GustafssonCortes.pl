% % TDA FLOW % %

/*--------MÓDULOS--------*/
:-module(flow_21157479_GustafssonCortes,[get_Id_Flow/2,get_Nmdg_Flow/2,get_Option_Flow/2,is_flow/1,all_flows/1]).

:-use_module(main_21157479_GustafssonCortes,[flow/4]).


/*--------Representación--------
Este TDA representa un flujo en particular sin ningun tipo de repticion de un chatbot, este se representa por un id unico de tipo entero positivo,
un nombre del mensaje propiamente tal del flujo de tipo strinng y un listado de las posibles opciones a escoger, donde cada uno de los elementos es de tipo option.
*/


/*--------Predicados--------
get_Id_Flow(Flow,Id).
get_Nmdg_Flow(Flow,Name_msg).
get_Option_Flow(Flow,Options).
is_flow(List).
all_flows(List).
*/

/*--------Metas--------
 Principal: ---

 Secundario: get_Id_Flow, get_Nmdg_Flow, get_Option_Flow, is_flow(List),
 all_flows(List).

*/

/*--------CONSTRUCTORES--------*/
%En main...


/*--------SELECTORES--------*/

%Descripcion: Selecciona el id del flow.
/*Dom:
  Lista = flow.
  Id = entero(+).
*/
get_Id_Flow([Id,_,_],Id).

%Descripcion: Selecciona el id del flow.
/*Dom:
  Lista = flow.
  Nmdg = string.
*/
get_Nmdg_Flow([_,Nmdg,_],Nmdg).

%Descripcion: Selecciona el id del flow.
/*Dom:
  Lista = flow.
  Options = Lista de opciones.
*/
get_Option_Flow([_,_,Options],Options).


/*--------PERTENENCIA--------*/

%Descripcion: Comprueba que una lista sea tipo flow.
%Dom: Lista.
is_flow([Id,Name_msg,Options]):-
    flow(Id,Name_msg,Options,[Id,Name_msg,Options]).

%Descripcion: Comprueba que toda una lista sea una lista de Flows.
%Dom: Lista (lista de flows).
all_flows([]).
all_flows([H|T]):-
    is_flow(H),
    all_flows(T).


/*--------OTRAS OPERACIONES--------*/
