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

listaVeiculosIndisponiveis() :- writeln("Veiculos Indisponiveis:"),
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


opcao(1) :- writeln("Voce selecionou a opcao para listar todos os veiculos do inventario."),
imprimeVeiculos().

opcao(2) :- writeln("Voce selecionou a opcao para listar um veiculo do inventario."),
read(Id),
verificaVeiculo(Id),
veiculo(Id, Tipo, Modelo, Ano),
write("ID: "),
write(Id),
write(" Tipo: "),
write(Tipo),
write(" Modelo: "),
write(Modelo),
write(" Ano: "),
writeln(Ano).

opcao(3) :- writeln("Voce selecionou a opcao para listar todos os veiculos disponiveis do inventario."),
listaVeiculosDisponiveis().

opcao(4) :- writeln("Voce selecionou a opcao para listar todos os veiculos indisponiveis do inventario."),
listaVeiculosIndisponiveis().

opcao(5) :- writeln("Voce selecionou a opcao para locar um veiculo."),
alugarVeiculo().

opcao(6) :- writeln("Voce selecionou a opcao para receber um veiculo."). % Preciso que alguém faça

menuOpcoes() :-
writeln("\nSelecione uma das opcoes abaixo:"),
writeln("1 - Listar todos os veiculos do inventario."),
writeln("2 - Visualizar veiculo especifico do inventario."),
writeln("3 - Listar os veiculos disponiveis."),
writeln("4 - Listar os veiculos indisponiveis."),
writeln("5 - Realizar Locacao de Veiculo."),
writeln("6 - Recebimento de Veiculo."),
read(A),
opcao(A),
menuOpcoes().

main :-
menuOpcoes().


