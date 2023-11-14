/*--------MÓDULOS--------*/
:-module(main_21157479_GustafssonCortes,[option/6,flow/4,flowAddOption/3,chatbot/6,chatbotAddFlow/3,system/4,systemAddChatbot/3,systemAddUser/3,systemLogin/3,systemLogout/2]).
:-use_module(option_21157479_GustafssonCortes).
:-use_module(flow_21157479_GustafssonCortes).
:-use_module(chatbot_21157479_GustafssonCortes).
:-use_module(system_21157479_GustafssonCortes).
:-use_module(user_21157479_GustafssonCortes).
:-use_module(chatHistory_21157479_GustafssonCortes).
%#################################################################

/*--------------Predicados--------------
option(Code,Message,ChatbotCodeLink,InitialFlowCodeLink,Keyword,Option).
flow(Id,Name_msg,Option,Flow).
flowAddOption([Id,Name_msg,Options],Option, NFlow).
chatbot(ChatbotID,Name,WelcomeMessage,StartFlowId,Flows,Chatbot).
chatbotAddFlow(Chatbot,Flow,NChatbot).
system(Name,InitialChatbotCodeLink,Chatbots,System).
systemAddChatbot(System,Chatbot,NSystem).
systemAddUser(System,User,NSystem).
systemLogin(System,User,SystemConected).
systemLogout(System,SystemDesconected).
systemTalkRec(System,Message,NSystem).
systemSynthesis(System,User,String).
systemSimulate(System,MaxInteractions,Seed,NSystem).
*/

/*--------------Metas--------------
 Principal: option, flow, flowAddOption, chatbot, chatbotAddFlow,
 system, systemAddChatbot, systemAddUser, systemLogin, systemLogout,
 systemTalkRec, systemSynthesis, systemSimulate.

 Secundario: --- .

*/


/*-------------- Requerimientos funcionales --------------*/


%2)option.

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



%3)flow.

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



%4)flowAddOption.

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



%5)chatbot.

 /*Descripción: Función que crea un chatbot con un id único.
 */

 /*Dom:
 ChatbotID = entero(+).
 Name = string.
 WelcomeMessage = string.
 StartFlowId = entero(+).
 Flows = lista flows.
 Chabot = chatbot.
 */
chatbot(ChatbotID,Name,WelcomeMessage,StartFlowId,Flows,Chatbot):-
    positivo_mayor_que_cero(ChatbotID),
    string(Name),
    string(WelcomeMessage),
    positivo_mayor_que_cero(StartFlowId),
    all_flows(Flows),
    Chatbot = [ChatbotID,Name,WelcomeMessage,StartFlowId,Flows].




%6)chatbotAddFlow.

 /*Descripción: Añade un nuevo flujo a un chatbot, verificando que esté no se repita, esto se valida mediante el id del flujo, si es así, no se añade
 y da false. Añadir que se debe implementar un tipo de recursión, en este caso se usó la recursión ?????????????????.
 */

 /*Dom:
 Chatbot = chatbot.
 Flow = flow.
 NChatbot = chatbot.
 */

chatbotAddFlow([ChatbotID,Name,WelcomeMessage,StartFlowId,Flows],Flow,NChatbot):-
    get_Id_Flow(Flow, Id),
    not(is_id_in_list(Id,Flows)),
    chatbotAddFlowAUX(Flows,Flow,[],NFlows),
    reverse(NFlows, NNFlows),
    chatbot(ChatbotID,Name,WelcomeMessage,StartFlowId,NNFlows,NChatbot).



%7)system.

 /*Descripción: Función que construye un sistema de chatbots y deja registro de la fecha de creación. Este también contiene el historial del chat de cada usuario,
donde este mismo lo puede visualizar cuando lo desee, pero se resetea.
 */

 /*Dom:
 Name = string.
 InitialChatbotCodeLink = entero(+).
 Chatbots = lista chatbots.
 System = system.
 */
system(Name,InitialChatbotCodeLink,Chatbots,System):-
    string(Name),
    positivo_mayor_que_cero(InitialChatbotCodeLink),
    all_chatbots(Chatbots),
    get_time(Fecha),
    System = [Name,InitialChatbotCodeLink,Chatbots,[],[],Fecha,"sesion_inactiva"].
    %Se guardará además el historial del chat y los usuarios en el sistema como una lista vacía para cada uno.
    %Es guardada también la fecha de creacion del sistema. También se guarda automaticamente como una sesión inactiva para el systemLogin.



%8)systemAddChatbot.

 /*Descripción: Función que añade un nuevo chatbot a la lista de chatbots de un sistema en específico, pero primero verifica que este nuevo chatbot,
por medio de su id, no se repita. Si está repetido, dará false.
 */

 /*Dom:
 System = system.
 Chatbot = chatbot.
 NSystem = system.
 */
systemAddChatbot([Name,InitialChatbotCodeLink,Chatbots,History,Users,Fecha,Estado],Chatbot,NSystem):-
    get_Id_CB(Chatbot,Id),
    not(is_id_in_list(Id,Chatbots)),
    unir(Chatbots,[Chatbot],NChatbots),
    NSystem = [Name,InitialChatbotCodeLink,NChatbots,History,Users,Fecha,Estado].



%9)systemAddUser.

 /*Descripción: Añade un nuevo usuario al sistema, verificando que no se repita su nombre en otros usuarios, ya que si es así, dará false.
 */

 /*Dom:
 System = system.
 User = string.
 NSystem = system.
 */
systemAddUser([Name,InitialChatbotCodeLink,Chatbots,History,Users,Fecha,Estado],User,NSystem):-
    is_user(User),
    not(member(User,Users)),
    unir(Users,[User],NUsers),
    NSystem = [Name,InitialChatbotCodeLink,Chatbots,History,NUsers,Fecha,Estado].


%10)systemLogin.

 /*Descripción: Hace iniciar al usuario de sesión en el sistema, pero primero se comprueba que no esté "conectado", que no haya nadie con su misma id (su nombre).
 */

 /*Dom:
 System = system.
 User = string.
 SystemConected = system.

 */
systemLogin([Name,InitialChatbotCodeLink,Chatbots,History,Users,Fecha,Estado],User,SystemConected):-
    Estado == "sesion_inactiva",
    is_user(User),
    member(User,Users),
    SystemConected = [Name,InitialChatbotCodeLink,Chatbots,History,Users,Fecha,User].



%11)systemLogout.

 /*Descripción: Permite cerrar la sesión abierta anteriormente por un mismo usuario.
 */

 /*Dom:
 System = system.
 System2 = system.
 */
systemLogout([Name,InitialChatbotCodeLink,Chatbots,_,Users,Fecha,Estado],System2):-
    not(Estado == "sesion_inactiva"),
    System2 = [Name,InitialChatbotCodeLink,Chatbots,[],Users,Fecha,"sesion_inactiva"].



%12)systemTalkRec.

 /*Descripción: Función que permite al usuario interactuar con el chatbot, revisando previamente que el usuario haya iniciado sesión.
 */

 /*Dom:
 System = system.
 Message = string.
 NSystem = system.
 */




%13)systemSynthesis.

 /*Descripción: Entrega una síntesis del chatbot o los chatbots para un usuario en particular a partir de chatHistory que está en el respectivo sistema.
 */

 /*Dom:
 System = system.
 User = string.
 String = string.

 */




%14)systemSimulate.

 /*Descripción: Permite que exista una simulación de interacción entre dos chatbots. De forma pseudoaleatoria, se da la posibilidad de que interactuen de forma “realista”,
 si no hay más interacciones, la simulación termina, esto es al igual con la cota superior, que es el número máximo de interacciones.
 */

 /*Dom:
 System = system.
 MaxInteractions = entero(+).
 Seed = entero(+).
 NSystem = system.
 */
