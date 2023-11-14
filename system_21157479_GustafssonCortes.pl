% % TDA SYSTEM % %

/*--------MÓDULOS--------*/
:-module(system_21157479_GustafssonCortes,[get_Name_System/2,get_ICCL_System/2,get_CB_System/2,get_History_System/2,get_Users_System/2,get_Fecha_System/2,get_Estado_System/2,is_system/1,all_systems/1]).

:-use_module(main_21157479_GustafssonCortes,[system/4]).

/*--------Representación--------
Este TDA representa un sistema, que consiste un nombre de tipo string, un id del chatbot inicializado en el sistema de tipo entero positivo,
una lista de chatbots, donde cada chatbot es de tipo chatbot, también consiste en una lista de usuarios donde cada elemento es de tipo user
y un historial del chat de tipo chatHistory, con su correspondiente hora.
*/


/*--------Predicados--------
get_Name_System(System,Name)
get_ICCL_System(System,InitialChatbotCodeLink).
get_CB_System(System,Chatbots).
get_History_System(System,History).
get_Users_System(System,Users).
get_Fecha_System(System,Fecha).
get_Estado_System(System,Estado).
is_system(List).
all_systems(List).
*/

/*--------Metas--------
 Principal: ---

 Secundario: get_Name_System, get_ICCL_System, get_CB_System,
 get_History_System, get_Users_System, get_Fecha_System,
 get_Estado_System, is_system, all_systems.

*/

/*--------CONSTRUCTORES--------*/
%En main...

/*--------SELECTORES--------*/

%Descripcion: Selecciona el nombre del sistema.
/*Dom:
 System = system.
 Name = string.
*/
get_Name_System([Name,_,_,_,_,_,_],Name).


% Descripcion: Selecciona el link del codigo del chatbot inicial
% del sistema.
/*Dom:
 System = system.
 InitialChatbotCodeLink = entero(+).
*/
get_ICCL_System([_,InitialChatbotCodeLink,_,_,_,_,_],InitialChatbotCodeLink).


%Descripcion: Selecciona el nombre del sistema.
/*Dom:
 System = system.
 Chatbots = lista de chatbots.
*/
get_CB_System([_,_,Chatbots,_,_,_,_],Chatbots).


%Descripcion: Selecciona el historial del sistema.
/*Dom:
 System = system.
 History = string.
*/
get_History_System([_,_,_,History,_,_,_],History).


%Descripcion: Selecciona los usuarios del sistema.
/*Dom:
 System = system.
 Users = lista de usuarios.
*/
get_Users_System([_,_,_,_,Users,_,_],Users).


%Descripcion: Selecciona la fecha del sistema.
/*Dom:
 System = system.
 Fecha = File.
*/
get_Fecha_System([_,_,_,_,_,Fecha,_],Fecha).


%Descripcion: Selecciona estado del sistema.
/*Dom:
 System = system.
 Estado = string.
*/
get_Estado_System([_,_,_,_,_,_,Estado],Estado).

/*--------PERTENENCIA--------*/

%Descripcion: Comprueba que una lista sea tipo system.
%Dom: Lista.
is_system([Name,InitialChatbotCodeLink,Chatbots,History,Users,Fecha,Estado]):-
    system(Name,InitialChatbotCodeLink,Chatbots,[Name,InitialChatbotCodeLink,Chatbots,History,Users,Fecha,Estado]).

%Descripcion: Comprueba que toda una lista sea una lista de sistemas.
%Dom: Lista (lista de flows).
all_systems([]).
all_systems([H|T]):-
    is_system(H),
    all_systems(T).


/*--------OTRAS OPERACIONES--------*/
