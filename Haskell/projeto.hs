mostrarMenu :: IO()
mostrarMenu = do 
    putStrLn ("Selecione uma das opcoes abaixo")
    putStrLn ("1 - Adicionar veiculo ao invetario")
    putStrLn ("2 - Remover veiculo do inventario")
    putStrLn ("3 - Visualizar veículo do invetário")
    putStrLn ("4 - Atualizar veículo do inventário")
    putStrLn ("5 - Listar todos os veículos do invetário")
    putStrLn ("6 - Listar os veículos disponíveis")
    putStrLn ("7 - Listar os veículos indisponíveis")
    putStrLn ("8 - Realizar locação de veículo")
    putStrLn ("9 - Recebimento de veículo")
    putStrLn ("10 - Sair")


criarBD :: Int -> [(String, String)]
criarBD qntd =
    [ ("N", "0") | y <- [1 .. qntd ]]

addVehicle :: [(String, String)] -> (String, String) -> Int -> Int -> [(String, String)]
addVehicle [] _ _ _ = []
addVehicle ((a,b):xs) vehicle count col
    | count == col = [vehicle] ++ (addVehicle xs vehicle count (col+1))
    | otherwise = [(a, b)] ++ (addVehicle xs vehicle count (col+1))

remove :: [(String, String)] -> String -> Int -> [(String, String)]
remove _ _ 0 = []
remove ((a,b):xs) id count
    | id == a = (remove xs id (count-1))
    | otherwise = [(a, b)] ++ (remove xs id (count-1))

imprimirTauleiro :: [(String, String)] -> Int -> IO()
imprimirTauleiro _ 0 = putStrLn("")
imprimirTauleiro (a:xs) cont = do
    if(fst a == "N") then do
        imprimirTauleiro (xs) (cont-1)
    else do
        print a
    imprimirTauleiro (xs) (cont-1)

iniciarJogo :: [(String, String)] -> Int -> IO ()
iniciarJogo bd count = do
    
    mostrarMenu
    opcao <- getLine
    if (opcao == "1") then do
        entrada1 <- getLine
        entrada2 <- getLine
        let a = addVehicle bd (entrada1, entrada2) count 0
        let count1 = count + 1
        print a
        iniciarJogo a count1

        putStrLn $ "Saindo..."
    else do 
        if(opcao == "2") then do
            imprimirTauleiro bd count
            iniciarJogo bd count
        else do
            id <- getLine
            let a = remove bd id (length bd)
            print a
            putStrLn $ "Voce digitou uma opacaoinvalida. Tente Novamente..."
            iniciarJogo a count


main :: IO ()
main = do
    let bd = criarBD 50
    let count = 0
    iniciarJogo bd count
    putStrLn ("10 - Sair")

