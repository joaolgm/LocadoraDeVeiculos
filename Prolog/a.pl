:- initialization(main).

:- dynamic
	alugado(filme(_,_,_,_,_)).

% filme(cod, nome, genero, ano, descrição).
filme(1, "Vingadores: Guerra do Infinito", 'fantasia', "2018", "Homem de Ferro, Thor, Hulk e os Vingadores se unem para combater seu inimigo mais poderoso, o maligno Thanos. Em uma missão para coletar todas as seis pedras infinitas, Thanos planeja usá-las para infligir sua vontade maléfica sobre a realidade.").
filme(2, "Black Panther", 'fantasia', "2018",  "Conheça a história de T'Challa, príncipe do reino de Wakanda, que perde o seu pai e viaja para os Estados Unidos, onde tem contato com os Vingadores. Entre as suas habilidades estão a velocidade, inteligência e os sentidos apurados.").
filme(3, "Deadpool 2", 'fantasia', "2018", "Sequência das aventuras do Mercenário Tagarela, interpretado por Ryan Reynolds. Na história original, o herói adquire superpoderes após uma experiência científica, e decide se vingar da pessoa responsável por sequestrar sua namorada." ).
filme(4, "Oito Mulheres e um Segredo", 'thriller', "2018", "Recém-saída da prisão, Debbie Ocean planeja executar o assalto do século em pleno Met Gala, em Nova York, com o apoio de Lou, Nine Ball, Amita, Constance, Rose, Daphne Kluger e Tammy.").
filme(5, "A Origem", 'ficção', "2010", "Don Cobb é um ladrão que invade os sonhos das pessoas e rouba segredos do subconsciente. As habilidades especiais de Cobb fazem com que ele seja procurado pelo mundo da espionagem empresarial, mas lhe custa tudo que ama. Cobb recebe uma missão impossível: plantar uma ideia na mente de uma pessoa. Se for bem-sucedido, será o crime perfeito, mas um amigo prevê todos os passos de Cobb.").
filme(6, "Moulin Rouge: Amor em Vermelho",'romance', "2001", "Don Cobb é um ladrão que invade os sonhos das pessoas e rouba segredos do subconsciente. As habilidades especiais de Cobb fazem com que ele seja procurado pelo mundo da espionagem empresarial, mas lhe custa tudo que ama. Cobb recebe uma missão impossível: plantar uma ideia na mente de uma pessoa. Se for bem-sucedido, será o crime perfeito, mas um amigo prevê todos os passos de Cobb.").
% colocar resto dos filmes...zzzz

sugestao("").
%sugestao("Sugestes para a locadora2").

menu() :- 
	writeln("██████╗ ███████╗███╗   ███╗    ██╗   ██╗██╗███╗   ██╗██████╗  ██████╗ "),
	writeln("██╔══██╗██╔════╝████╗ ████║    ██║   ██║██║████╗  ██║██╔══██╗██╔═══██╗"),
	writeln("██████╔╝█████╗  ██╔████╔██║    ██║   ██║██║██╔██╗ ██║██║  ██║██║   ██║"),
	writeln("██╔══██╗██╔══╝  ██║╚██╔╝██║    ╚██╗ ██╔╝██║██║╚██╗██║██║  ██║██║   ██║"),
	writeln("██████╔╝███████╗██║ ╚═╝ ██║     ╚████╔╝ ██║██║ ╚████║██████╔╝╚██████╔╝"),
	writeln("╚═════╝ ╚══════╝╚═╝     ╚═╝      ╚═══╝  ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝ ").                    

listaFilmes([], _).
listaFilmes([H|T], Cod) :-  write(Cod), write(" - "), writeln(H), Cod1 is Cod + 1, listaFilmes(T, Cod1).

listarPorGenero(Gen):- 	write("Aqui estão todos os filmes do sistema com o genero "), % Print da frase inicial
						writeln(Gen), % Print do genero
						findall(Nome, filme(_, Nome,Gen,_,_), Filmes), % Retorna uma Lista com todos os filmes que possuem o genero recebido como parametro
						imprimePorGenero(Filmes). % Vai para o metodo de imprimir passando a lista de filmes filtrada

imprimePorGenero([]).
imprimePorGenero([H|T]):-	filme(C,H,_,_,_), % Recupera o codigo do filme
							write(C), % Printa o codigo
							write(" - "), % Printa ajuste
							writeln(H), % Printa o nome do filme
							imprimePorGenero(T). % Chama recursivamente passando o tail



listaDisponiveis():- findall(Nome, filme(_, Nome,_,_,_), Filmes), % Gera uma lista com os nomes de todos os filmes do sistema
					 imprimeDisponiveis(Filmes). % Repassa pra regra imprimeDisponiveis a lista com todos os filmes
		  
imprimeDisponiveis([]).		  
imprimeDisponiveis([H|T]):- not(alugado(filme(_,H,_,_,_))) -> % Se o filme nao estiver alugado
							filme(C,H,_,_,_), % Recupera o codigo do filme
							write(C), % Printa o codigo
							write(" - "), % Printa ajuste
							writeln(H), % Printa o nome do filme
							imprimeDisponiveis(T) ; % Chama recursivamente passando o tail
							imprimeDisponiveis(T) .	% Se estiver alugado apenas chama recursivamente passando o tail	  
		  

imprimeFilmes() :- writeln("Os filmes são:"), 
    			   findall(Nome, filme(_, Nome,_,_,_), Filmes),
    			   listaFilmes(Filmes, 1).

realizaAluguel(Cod, Nome, Ano, Genero, Descricao) :- assertz(alugado(filme(Cod, Nome, Ano, Genero, Descricao))),
    												 write("Filme alugado com sucesso").
verificaFilme(Cod) :- call(filme(Cod,_,_,_,_)), !;
                      call(alugado(filme(Cod,_,_,_,_))), !;
                      writeln("Filme nao existe ou esta indisponivel!").

listaAlugados() :- writeln("Os filmes alugaos são:"), 
    			   forall(alugado(Filme), writeln(Filme)).

toStringLista([]).
toStringLista([filmes(Cod, Nome, _,_,_)|T]) :- write(Cod), write(" - "), writeln(Nome) , toStringLista(T).  

listaSugestoes() :- forall(sugestao(S),writeln(S)).

enviarSugestao(Sugestao) :- assertz(sugestao(Sugestao)).

opcao(0) :- halt.

opcao(1) :- imprimeFilmes().

opcao(2) :- writeln("Abaixo estao os filmes disponiveis para aluguel:"),
			listaDisponiveis().
			
opcao(3) :- listaAlugados().

opcao(4) :- write("Digite o codigo do Filme que deseja alugar:"),
    		read(Cod),
            verificaFilme(Cod),
            filme(Cod, Nome, Ano, Genero, Descricao),                                  
            realizaAluguel(Cod, Nome, Ano, Genero, Descricao).

opcao(5) :- write("Realiza devolução").

opcao(6) :- write("Digite o nome do genero que voce deseja filtrar:"),
			read(Genero),
			listarPorGenero(Genero).

opcao(7) :- writeln("Escreva sua sugestão:"), read(S), enviarSugestao(S).

opcao(8) :- listaSugestoes().

opcao(X) :- writeln("Opcao invalida, tente outra!").


menuOpcoes() :- 
	writeln("\nUse sempre um ponto no final de cada instrucao"), 
    writeln("0 - Sair"), 
    writeln("1 - Listar todos filmes"),
    writeln("2 - Listar filmes disponiveis"),
    writeln("3 - Listar os seus filmes alugados"),
    writeln("4 - Realizar Aluguel"),
    writeln("5 - Realizar Devolução"),
    writeln("6 - Listar filmes por genero"),
    writeln("7 - Enviar sugestão de filme"),
    writeln("8 - Visualizar suas sugestões de filmes"),
    writeln("\nOpcao: "),
    writeln("\n"),
    read(A),
    opcao(A),
    menuOpcoes().

main :-
    menu(),
    menuOpcoes().