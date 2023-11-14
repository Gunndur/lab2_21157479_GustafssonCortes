% % TDA CHATHISTORY % %

/*--------MÓDULOS--------*/
:-module(chatHistory_21157479_GustafssonCortes,[chatHistory/2,get_String_ChatHistory/2,is_ChatHistory/1]).

/*--------Representación--------
Este TDA representa una fecha y hora de forma exacta, siendo estos de tipo entero positivo.
*/


/*--------Predicados--------
chatHistory(String,ChatHistory).
get_String_ChatHistory(ChatHistory,String).
is_ChatHistory(List).
*/

/*--------Metas--------
 Principal: chatHistory.

 Secundario: get_String_ChatHistory, is_ChatHistory.

*/

/*--------CONSTRUCTORES--------*/
chatHistory(String,ChatHistory):-
    string(String),
    ChatHistory = [String].


/*--------SELECTORES--------*/

%Descripcion: Selecciona el nombre del sistema.
/*Dom:
 System = system.
 Name = string.
*/
get_String_ChatHistory([String],String).


/*--------PERTENENCIA--------*/
%Descripcion: Comprueba que una lista sea tipo system.
%Dom: Lista.
is_ChatHistory([String]):-
    chatHistory(String,[String]).


/*--------OTRAS OPERACIONES--------*/
