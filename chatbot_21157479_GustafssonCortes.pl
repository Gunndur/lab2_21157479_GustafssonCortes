% % TDA CHATBOT % %

/*--------MÓDULOS--------*/
:-module(chatbot_21157479_GustafssonCortes,[get_Id_CB/2,get_Name_CB/2,get_WM_CB/2,get_SF_CB/2,get_Flows_CB/2,is_chatbot/1,all_chatbots/1,chatbotAddFlowAUX/4]).

:-use_module(main_21157479_GustafssonCortes,[chatbot/6]).



/*--------Representación--------
Este TDA representa un chatbot, este posee un id unico tipo entero mayor que cero, un nombre de tipo string, un mensaje de presentación de tipo string,
el id del flow inicial asociado de tipo entero positivo y una lista de los flujos, donde cada uno de los flujos es de tipo flow.
*/


/*--------Predicados--------
get_Id_CB(Chatbot,ChatbotID).
get_Name_CB(Chatbot,Name).
get_WM_CB(Chatbot,WelcomeMessage).
get_SF_CB(Chatbot,StartFlowId).
get_Flows_CB(Chatbot,Flows).
is_chatbot(List).
all_chatbots(List).
chatbotAddFlowAUX(Flows,Flow,Aux,Resultado).
*/

/*--------Metas--------
 Principal: ---

 Secundario: get_Id_CB, get_Name_CB, get_WM_CB, get_SF_CB,
 get_Flows_CB, is_chatbot, all_chatbots, chatbotAddFlowAUX.

*/

/*--------CONSTRUCTORES--------*/
%En main...

/*--------SELECTORES--------*/

%Descripcion: Selecciona el Id del chatbot.
/*Dom:
 Chatbot = chatbot.
 ChatbotID = entero(+).
*/
get_Id_CB([ChatbotID,_,_,_,_],ChatbotID).

%Descripcion: Selecciona el Id del chatbot.
/*Dom:
 Chatbot = chatbot.
 Name = string.
*/
get_Name_CB([_,Name,_,_,_],Name).

%Descripcion: Selecciona el Id del chatbot.
/*Dom:
 Chatbot = chatbot.
 WelcomeMessage = string.
*/
get_WM_CB([_,_,WelcomeMessage,_,_],WelcomeMessage).

%Descripcion: Selecciona el Id del chatbot.
/*Dom:
 Chatbot = chatbot.
 StartFlowId = entero(+).
*/
get_SF_CB([_,_,_,StartFlowId,_],StartFlowId).

%Descripcion: Selecciona los flujos del chatbot.
/*Dom:
 Chatbot = chatbot.
 Flows = lista de flujos.
*/
get_Flows_CB([_,_,_,_,Flows],Flows).


/*--------PERTENENCIA--------*/
%Descripcion: Comprueba que una lista sea tipo chatbot.
%Dom: Lista.
is_chatbot([ChatbotID,Name,WelcomeMessage,StartFlowId,Flows]):-
    chatbot(ChatbotID,Name,WelcomeMessage,StartFlowId,Flows,[ChatbotID,Name,WelcomeMessage,StartFlowId,Flows]).

% Descripcion: Comprueba que toda una lista sea una lista de chatbots,
% usando recursión de cola.
% Dom: Lista (lista de flows).
all_chatbots([]).
all_chatbots([H|T]):-
    is_chatbot(H),
    all_chatbots(T).


/*--------OTRAS OPERACIONES--------*/

% Descripcion: Añade recursivamente a una lista auxiliar un flow, usando
% recursión cola.
/*Dom:
  Lista = lista de flows.
  Flow = flow.
  Aux = lista vacía.
  Resultado = lista de flows.
*/
chatbotAddFlowAUX([],Flow,Aux,[Flow|Aux]).
chatbotAddFlowAUX([H|T],Flow,Aux,Resultado):-
    chatbotAddFlowAUX(T,Flow,[H|Aux],Resultado).
