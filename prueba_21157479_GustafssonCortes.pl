% % SCRIPT DE PRUEBAS % %

/*--------M�DULOS--------*/
:-use_module(main_21157479_GustafssonCortes).




/*--------SCRIPT DE PRUEBAS (entregado por la pauta)--------*/


option(1, "1) Viajar", 12, 1, ["viajar", "turistear", "conocer"], OP1),
option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2),
flow(1, "flujo1", [OP1], F10),
flowAddOption(F10, OP2, F11),
% flowAddOption(F10, OP1, F12).%si esto se descomenta, debe dar false, porque es opci�n con id duplicada.

chatbot(0, "Inicial", "Bienvenido\n�Qu� te gustar�a hacer?", 1, [F11], CB0), %solo a�ade una ocurrencia de F11

%Chatbot1
option(1, "1) New York, USA", 1, 2, ["USA", "Estados Unidos", "New York"], OP3),
option(2, "2) Par�s, Francia", 1, 1, ["Paris", "Eiffel"], OP4),
option(3, "3) Torres del Paine, Chile", 1, 1, ["Chile", "Torres", "Paine", "Torres Paine", "Torres del Paine"], OP5),
option(4, "4) Volver", 0, 1, ["Regresar", "Salir", "Volver"], OP6),

%Opciones segundo flujo Chatbot1
option(1, "1) Central Park", 1, 2, ["Central", "Park", "Central Park"], OP7),
option(2, "2) Museos", 1, 2, ["Museo"], OP8),
option(3, "3) Ning�n otro atractivo", 1, 3, ["Museo"], OP9),
option(4, "4) Cambiar destino", 1, 1, ["Cambiar", "Volver", "Salir"], OP10),
option(1, "1) Solo", 1, 3, ["Solo"], OP11),
option(2, "2) En pareja", 1, 3, ["Pareja"], OP12),
option(3, "3) En familia", 1, 3, ["Familia"], OP13),
option(4, "4) Agregar m�s atractivos", 1, 2, ["Volver", "Atractivos"], OP14),
option(5, "5) En realidad quiero otro destino", 1, 1, ["Cambiar destino"], OP15),
flow(1, "Flujo 1 Chatbot1\n�D�nde te Gustar�a ir?", [OP3, OP4, OP5, OP6], F20),
flow(2, "Flujo 2 Chatbot1\n�Qu� atractivos te gustar�a visitar?", [OP7, OP8, OP9, OP10], F21),
flow(3, "Flujo 3 Chatbot1\n�Vas solo o acompa�ado?", [OP11, OP12, OP13, OP14, OP15], F22),
chatbot(1, "Agencia Viajes",  "Bienvenido\n�D�nde quieres viajar?", 1, [F20, F21, F22], CB1),

%Chatbot2
option(1, "1) Carrera T�cnica", 2, 1, ["T�cnica"], OP16),
option(2, "2) Postgrado", 2, 1, ["Doctorado", "Magister", "Postgrado"], OP17),
option(3, "3) Volver", 0, 1, ["Volver", "Salir", "Regresar"], OP18),
flow(1, "Flujo 1 Chatbot2\n�Qu� te gustar�a estudiar?", [OP16, OP17, OP18], F30),
chatbot(2, "Orientador Acad�mico",  "Bienvenido\n�Qu� te gustar�a estudiar?", 1, [F30], CB2),

system("Chatbots Paradigmas", 0, [CB0], S0),

% systemAddChatbot(S0, CB0, S1), %si esto se descomenta, debe dar false, porque es chatbot id duplicado.

systemAddChatbot(S0, CB1, S01),
systemAddChatbot(S01, CB2, S02),
systemAddUser(S02, "user1", S2),
systemAddUser(S2, "user2", S3),

% systemAddUser(S3, "user2", S4), %si esto se descomenta, debe dar false, porque es username duplicado

systemAddUser(S3, "user3", S5),

% systemLogin(S5, "user8", S6), %si esto se descomenta, debe dar false ;user8 no existe.

systemLogin(S5, "user1", S7),

% systemLogin(S7, "user2", S8), %si esto se descomenta, debe dar false, ya hay usuario con login

systemLogout(S7, S9),
systemLogin(S9, "user2", S10).


/*
systemTalkRec(S10, "hola", S11),
systemTalkRec(S11, "1", S12),
systemTalkRec(S12, "1", S13),
systemTalkRec(S13, "Museo", S14),
systemTalkRec(S14, "1", S15),
systemTalkRec(S15, "3", S16),
systemTalkRec(S16, "5", S17),
systemSynthesis(S17, "user2", Str1),
systemSimulate(S3, 5, 32131, S99).

*/












