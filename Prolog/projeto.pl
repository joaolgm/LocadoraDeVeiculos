:- initialization(main).

:- dynamic
 locado(veiculo(_,_,_,_)).

veiculo(1, "Carro", "Celta", "2010").
veiculo(2, "Carro", "Palio", "2002").
veiculo(3, "Carro", "Hilux", "2007").
veiculo(4, "Carro", "S10", "2018").
veiculo(5, "Carro", "Corsa", "2000").
veiculo(6, "Carro", "Ferrari", "2010").
veiculo(7, "Carro", "Mclaren", "2010").
veiculo(8, "Moto", "Shineray", "1995").
veiculo(9, "Moto", "Honda", "2006").

imprimeVeiculos() :- findall(Modelo, veiculo(_,_,Modelo,_), Veiculos),
                     listaVeiculos(Veiculos, 001).

listaVeiculos([], _).
listaVeiculos([H|T], ID) :-  veiculo(C,_,H,_),
                             write(C), 
                             write(" - "), 
                             writeln(H), 
                             ID_Prox is ID + 1, 
                             listaVeiculos(T, ID_Prox).

listaVeiculosDisponiveis():- findall(Modelo, veiculo(_,_,Modelo,_), Veiculos),
                             imprimeVeiculosDisponiveis(Veiculos).

imprimeVeiculosDisponiveis([]).    
imprimeVeiculosDisponiveis([H|T]):- not(locado(veiculo(_,_,H,_))) -> 
                                    veiculo(C,_,H,_),
                                    write(C),
                                    write(" - "),
                                    writeln(H),
                                    imprimeVeiculosDisponiveis(T) ;
                                    imprimeVeiculosDisponiveis(T) .

listaVeiculosIndisponiveis() :- writeln("Os filmes alugados são:"),
                                forall(locado(Veiculo),
                                writeln(Veiculo)).

alugarVeiculo() :- writeln("Insira o ID do veiculo a ser alugado:"),
                   read(Id),
                   verificaVeiculo(Id),
                   veiculo(Id, Tipo, Modelo, Ano),
                   realizaAluguel(Id, Tipo, Modelo, Ano).

verificaVeiculo(Id) :- call(veiculo(Id,_,_,_)), !;
                       call(locado(veiculo(Id,_,_,_))), !;
                       writeln("Veículo não consta no inventário.").

realizaAluguel(Id, Tipo, Modelo, Ano) :- assertz(locado(veiculo(Id, Tipo, Modelo, Ano))),
                                         write("Veículo alugado com sucesso.").


opcao(1) :- writeln("Você selecionou a opção para listar todos os veículo do inventário."),
            imprimeVeiculos().

opcao(2) :- writeln("Você selecionou a opção para listar um veículo do inventário."). % Preciso que alguem faça

opcao(3) :- writeln("Você selecionou a opção para listar todos os veículos disponíveis do inventário."),
            listaVeiculosDisponiveis().

opcao(4) :- writeln("Você selecionou a opção para listar todos os veículos indisponíveis do inventário."),
            listaVeiculosIndisponiveis().

opcao(5) :- writeln("Você selecionou a opção para locar um veículo."),
            alugarVeiculo().

opcao(6) :- writeln("Você selecionou a opção para receber um veículo."). % Preciso que alguém faça

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