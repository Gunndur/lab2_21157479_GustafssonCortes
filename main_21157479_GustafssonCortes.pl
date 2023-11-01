
/*Predicados:
option(Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword,Option).

*/

/*Metas:
 Principal: option,

 Secundario:

*/

%CLAUSULAS:
%Hechos:
option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], o1).
option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], o2).


%Reglas:

/*-------------- Requerimientos funcionales --------------*/

%1)

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
    Option = [Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword].
