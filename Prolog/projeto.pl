:- initialization(main).

:- dynamic
	alugado(veiculo(_,_,_,_,_)).

veiculo("001", "Carro", "Celta", "Disponível", "2010").
veiculo("002", "Carro", "Palio", "Disponível", "2002").
veiculo("003", "Carro", "Hilux", "Disponível", "2007").
veiculo("004", "Carro", "S10", "Disponível", "2018").
veiculo("005", "Carro", "Corsa", "Disponível", "2000").
veiculo("006", "Carro", "Ferrari", "Disponível", "2010").
veiculo("007", "Carro", "Mclaren", "Disponível", "2010").
veiculo("008", "Moto", "Shineray", "Disponível", "1995").
veiculo("009", "Moto", "Honda", "Disponível", "2006").

imprimeVeiculos() :- findall(Modelo, veiculo(_,_,Modelo,_,_), Veiculos),
                     listaVeiculos(Veiculos, 001).

listaVeiculos([], _).
listaVeiculos([H|T], ID) :-  veiculo(C,_,H,_,_),
                             write(C), 
                             write(" - "), 
                             writeln(H), 
                             ID_Prox is ID + 1, 
                             listaVeiculos(T, ID_Prox).

listaVeiculosDisponiveis():- findall(Modelo, veiculo(_,_,Modelo,_,_), Veiculos),
                             imprimeVeiculosDisponiveis(Veiculos).

imprimeVeiculosDisponiveis([]).		  
imprimeVeiculosDisponiveis([H|T]):- not(alugado(veiculo(_,_,H,_,_))) -> 
                                    veiculo(C,_,H,_,_),
                                    write(C),
                                    write(" - "),
                                    writeln(H),
                                    imprimeVeiculosDisponiveis(T) ;
                                    imprimeVeiculosDisponiveis(T) .

opcao(1) :- writeln("Você selecionou a opção para listar todos os veículo do inventário."),
            imprimeVeiculos().

opcao(2) :- writeln("Você selecionou a opção para listar um veículo do inventário.").

opcao(3) :- writeln("Você selecionou a opção para listar todos os veículos disponíveis do inventário."),
            listaVeiculosDisponiveis().

opcao(4) :- writeln("Você selecionou a opção para listar todos os veículos indisponíveis do inventário.").

opcao(5) :- writeln("Você selecionou a opção para locar um veículo.").

opcao(6) :- writeln("Você selecionou a opção para receber um veículo.").

menuOpcoes() :- 
    writeln("\nSelecione uma das opções abaixo:"), 
    writeln("1 - Listar todos os veículos do inventário."),
    writeln("2 - Visualizar veículo específico do inventário."),
    writeln("3 - Listar os veículos disponíveis."),
    writeln("4 - Listar os veículos indisponíveis."),
    writeln("5 - Realizar Locação de Veículo."),
    writeln("6 - Recebimento de Veiculo."),
    read(A),
    opcao(A),
    menuOpcoes().

main :-
    menuOpcoes().