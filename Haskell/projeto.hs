main :: IO()
main = do { putStrLn "Selecione uma das opcoes abaixo\n";
    putStrLn "1 - Adicionar veiculo ao invetario";
    putStrLn "2 - Remover veiculo do inventario";
    putStrLn "3 - Visualizar veículo do invetário";
    putStrLn "4 - Atualizar veículo do inventário";
    putStrLn "5 - Listar todos os veículos do invetário";
    putStrLn "6 - Listar os veículos disponíveis";
    putStrLn "7 - Listar os veículos indisponíveis";
    putStrLn "8 - Realizar locação de veículo";
    putStrLn "9 - Recebimento de veículo";
    putStrLn "10 - Sair";
    opcao <- getLine;
    case opcao of "1" -> putStrLn "Opcao 1 escolhida";
                  "2" -> putStrLn "Opcao 2 escolhida";
                  "3" -> putStrLn "Opcao 3 escolhida";
                  "4" -> putStrLn "Opcao 4 escolhida";
                  "5" -> putStrLn "Opcao 5 escolhida";
                  "6" -> putStrLn "Opcao 6 escolhida";
                  "7" -> putStrLn "Opcao 7 escolhida";
                  "8" -> putStrLn "Opcao 8 escolhida";
                  "9" -> putStrLn "Opcao 9 escolhida";
                  "10" -> putStrLn "Opcao 10 escolhida";
    }
