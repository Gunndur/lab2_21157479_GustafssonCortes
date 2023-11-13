%MÓDULOS
:-module(main_21157479_GustafssonCortes,[option/6,flow/4,flowAddOption/3,chatbot/6]).
:-use_module(option_21157479_GustafssonCortes).
:-use_module(flow_21157479_GustafssonCortes).
:-use_module(chatbot_21157479_GustafssonCortes).
:-use_module(system_21157479_GustafssonCortes).
:-use_module(user_21157479_GustafssonCortes).
:-use_module(chatHistory_21157479_GustafssonCortes).
%#################################################################

/*Predicados:
option(Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword,Option).
flow(Id,Name_msg,Option,Flow).
flowAddOption([Id,Name_msg,Options],Option, NFlow).
*/

/*Metas:
 Principal: option, flow, flowAddOption.

 Secundario: --- .

*/

%CLAUSULAS:
%Hechos:

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

%3)

 /*Descripción: Funcion que construye un flujo de un chatbot.
 */

 /*Dom:
  Id = entero(+).
  Name_msg = string.
  Option = Lista de options.
  Flow = flow.
 */

flow(Id,Name_msg,Option,Flow):-
    positivo_mayor_que_cero(Id),
    string(Name_msg),
    all_options(Option),
    Flow = [Id,Name_msg,Option].

%4)

 /*Descripción: Modifica un flujo para poder añadirle una nueva opción, pero primero verifica que no esté repetida
 mediante su id, si está repetida la opción, no es agregada y se mantiene el flujo inicial.
 */

 /*Dom:
  Id = entero(+).
  Name_msg = string.
  Options = Lista de options.
  Option = option.
  NFlow = flow.
 */

flowAddOption([Id,Name_msg,Options],Option, NFlow):-
    get_Code_Option(Option,Code),
    not(is_id_in_list(Code,Options)),
    unir(Options,[Option],NOptions),
    flow(Id,Name_msg,NOptions,NFlow).

%5)

 /*Descripción: Función que crea un chatbot con un id único.
 */

 /*Dom:
 ChatbotID (int)
 Name (String)
 WelcomeMessage (String)
 StartFlowId(int)
 Flows (Lista de 0 o más flujos)
 Chabot
 */

chatbot(ChatbotID,Name,WelcomeMessage,StartFlowId,Flows,Chatbot):-
    positivo_mayor_que_cero(ChatbotID),
    string(Name),
    string(WelcomeMessage),
    positivo_mayor_que_cero(StartFlowId),
    all_flows(Flows),
    Chatbot = [ChatbotID,Name,WelcomeMessage,StartFlowId,Flows].
