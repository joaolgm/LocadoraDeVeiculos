:- initialization(main).

:- dynamic
locado(veiculo(_,_,_,_)).

imprimeVeiculos() :- findall(Modelo, veiculo(_,_,Modelo,_), Veiculos),
listaVeiculos(Veiculos, 001).

listaVeiculos([], _).
listaVeiculos([H|T], ID) :-  veiculo(Id,Tipo,H,Ano),
exibirInformacoes(Id,Tipo,H,Ano),
ID_Prox is ID + 1,
listaVeiculos(T, ID_Prox).

exibirInformacoes(Id,Tipo,H,Ano) :- write("ID: "),
write(Id),
write("/"),
write(" Tipo: "),
write(Tipo),
write("/"),
write(" Modelo: "),
write(H),
write("/"),
write(" Ano: "),
writeln(Ano).

% Lista todos os veiculos disponiveis no sistema
listaVeiculosDisponiveis():- writeln("Veiculos Disponiveis:"),
findall(Modelo, veiculo(_,_,Modelo,_), Veiculos),
imprimeVeiculosDisponiveis(Veiculos).

imprimeVeiculosDisponiveis([]).
% Imprime todos os veiculos disponiveis no sistema
imprimeVeiculosDisponiveis([H|T]):- not(locado(veiculo(Id,Tipo,H,Ano))) ->
veiculo(Id,Tipo,H,Ano),
exibirInformacoes(Id,Tipo,H,Ano),
imprimeVeiculosDisponiveis(T) ;
imprimeVeiculosDisponiveis(T) .

imprimeVeiculosIndisponiveis([]).
% Imprime todos os veiculos indisponiveis no sistema
imprimeVeiculosIndisponiveis([H|T]):- locado(veiculo(Id,Tipo,H,Ano)) ->
veiculo(Id,Tipo,H,Ano),
exibirInformacoes(Id,Tipo,H,Ano),
imprimeVeiculosIndisponiveis(T) ;
imprimeVeiculosIndisponiveis(T) .

% Lista todos os veiculos indisponiveis no sistema
listaVeiculosIndisponiveis():- writeln("Veiculos Indisponiveis:"),
findall(Modelo, veiculo(_,_,Modelo,_), Veiculos),
imprimeVeiculosIndisponiveis(Veiculos).

% Aluga um veiculo do sistema a partir do ID
alugarVeiculo() :- writeln("Insira o ID do veiculo a ser alugado:"),
read(Id),
verificaVeiculo(Id),
veiculo(Id, Tipo, Modelo, Ano),
realizaAluguel(Id, Tipo, Modelo, Ano).

% Recebe um veiculo de volta para o sistema a partir do ID
receberVeiculo() :- writeln("Insira o ID do veiculo a ser devolvido:"),
read(Id),
verificaVeiculo(Id),
veiculo(Id, Tipo, Modelo, Ano),
realizaDevolucao(Id, Tipo, Modelo, Ano).

% Verifica dados de algum veiculo a partir do ID
verificaVeiculo(Id) :- call(veiculo(Id,_,_,_)), !;
call(locado(veiculo(Id,_,_,_))), !;
writeln("Veiculo não consta no inventário.").

realizaAluguel(Id, Tipo, Modelo, Ano) :- assertz(locado(veiculo(Id, Tipo, Modelo, Ano))),
write("Veiculo alugado com sucesso.").

realizaDevolucao(Id, Tipo, Modelo, Ano) :- retract(locado(veiculo(Id, Tipo, Modelo, Ano))),
write("Veiculo removido com sucesso.").

% Adiciona um veiculo no sistema a partir de seus dados
adicionarVeiculo() :- write("Digite o id do veiculo a ser adicionado."),
read(Id),
write("Digite o tipo do veiculo a ser adicionado."),
read(Tipo),
write("Digite o modelo do veiculo a ser adicionado."),
read(Modelo),
write("Digite o ano de fabricação do veiculo a ser adicionado."),
read(Ano),
adicionaComParametros(Id, Tipo, Modelo, Ano).

adicionaComParametros(Id, Tipo, Modelo, Ano) :- assertz(veiculo(Id, Tipo, Modelo, Ano)),
write("Veiculo adicionado com sucesso").

% Remove um veiculo do sistema a partir do ID
removerVeiculo() :- write("Digite o id do veiculo a ser removido."),
read(Id),
removerComParametro(Id).

removerComParametro(Id) :- verificaVeiculo(Id),
veiculo(Id, Tipo, Modelo, Ano),
realizaRemocao(Id, Tipo, Modelo, Ano).

realizaRemocao(Id, Tipo, Modelo, Ano) :- retract(veiculo(Id, Tipo, Modelo, Ano)),
write("Veiculo devolvido com sucesso.").

opcao(1) :- writeln("Voce selecionou a opcao para listar todos os veiculos do inventario."),
imprimeVeiculos().

opcao(2) :- writeln("Voce selecionou a opcao para listar um veiculo do inventario."),
write("Digite o ID do veiculo a ser visualizado: "),
read(Id),
verificaVeiculo(Id),
veiculo(Id, Tipo, Modelo, Ano),
write("ID: "),
write(Id),
write("/"),
write(" Tipo: "),
write(Tipo),
write("/"),
write(" Modelo: "),
write(Modelo),
write("/"),
write(" Ano: "),
writeln(Ano).

opcao(3) :- writeln("Voce selecionou a opcao para listar todos os veiculos disponiveis do inventario."),
listaVeiculosDisponiveis().

opcao(4) :- writeln("Voce selecionou a opcao para listar todos os veiculos indisponiveis do inventario."),
listaVeiculosIndisponiveis().

opcao(5) :- writeln("Voce selecionou a opcao para locar um veiculo."),
alugarVeiculo().

opcao(6) :- writeln("Voce selecionou a opcao para receber um veiculo."),
receberVeiculo().

opcao(7) :- writeln("Voce selecionou a opcao para remover um veiculo do inventário."),
removerVeiculo().

opcao(8) :- writeln("Voce selecionou a opcao para adicionar um veiculo ao inventário."),
adicionarVeiculo().

opcao(9) :- halt.

menuOpcoes() :-
writeln("\nSelecione uma das opcoes abaixo:"),
writeln("1 - Listar todos os veiculos do inventario."),
writeln("2 - Visualizar veiculo especifico do inventario."),
writeln("3 - Listar os veiculos disponiveis."),
writeln("4 - Listar os veiculos indisponiveis."),
writeln("5 - Realizar Locacao de Veiculo."),
writeln("6 - Recebimento de Veiculo."),
writeln("7 - Remover veiculo do inventário."),
writeln("8 - Adicionar veiculo ao inventário."),
writeln("9 - Sair"),
read(A),
opcao(A),
menuOpcoes().

main :-
menuOpcoes().
