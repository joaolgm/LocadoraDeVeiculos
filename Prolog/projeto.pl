:- initialization(main).

opcao(1) :- write("Você selecionou a opção para adicionar um veículo ao inventário.").

opcao(2) :- write("Você selecionou a opção para remover um veículo do inventário.").

opcao(3) :- write("Você selecionou a opção para visualizar um veículo do inventário.").

opcao(4) :- write("Você selecionou a opção para listar todos os veículos do inventário.").

opcao(5) :- write("Você selecionou a opção para listar todos os veículos disponíveis do inventário.").

opcao(6) :- write("Você selecionou a opção para listar todos os veículos indisponíveis do inventário.").

opcao(7) :- write("Você selecionou a opção para locar um veículo.").

opcao(8) :- write("Você selecionou a opção para receber um veículo.").

menuOpcoes() :- 
    writeln("\nSelecione uma das opções abaixo:"), 
    writeln("1 - Adicionar veículo ao inventário."),
    writeln("2 - Remover veículo ao inventário."),
    writeln("3 - Visualizar veículo do inventário."),
    writeln("4 - Listar todos os veículos do inventário."),
    writeln("5 - Listar os veículos disponíveis."),
    writeln("6 - Listar os veículos indisponíveis."),
    writeln("7 - Realizar Locação de Veículo."),
    writeln("8 - Recebimento de Veiculo."),
    read(A),
    opcao(A),
    menuOpcoes().

main :-
    menuOpcoes().