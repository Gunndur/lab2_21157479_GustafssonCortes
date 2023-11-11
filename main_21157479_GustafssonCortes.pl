%MÓDULOS
:-use_module(option_21157479_GustafssonCortes.pl).

%#################################################################

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

%3)

 /*Descripción: Funcion que construye un flujo de un chatbot identificado mediante su id y verifica que las
 opciones creadas no se repitan.
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
    delete_duplicate_option(Option,NOption),
    Flow = [Id,Name_msg,NOption].

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
