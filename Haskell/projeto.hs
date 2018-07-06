-- Função que mostra menu
showMenu :: IO()
showMenu = do 
    putStrLn ("Selecione uma das opcoes abaixo")
    putStrLn ("1 - Adicionar veículo ao inventário")
    putStrLn ("2 - Remover veículo do inventário")
    putStrLn ("3 - Visualizar veículo")
    putStrLn ("4 - Listar todos os veículos do inventário")
    putStrLn ("5 - Listar todos os veículos Disponíveis")
    putStrLn ("6 - Listar todos os veículos Indisponíveis")
    putStrLn ("7 - Alugar veículo")
    putStrLn ("8 - Devolver veículo")
    putStrLn ("")
    putStrLn ("Digite a opção a ser escolhida: ")
    


-- Função que cria um inventário de tamanho pre determinado e o alimenta com dados nulos
createInventory :: Int -> [( ( ( (String, String), String), String), String) ]
createInventory qntd = [ ( ( ( ("N", "0"), "0"), "0"), "0") | y <- [1 .. qntd ]]

-- Função que adiciona uma n-tupla (veiculo) ao inventário
addVehicle :: [( ( ( (String, String), String), String), String)] -> ( ( ( (String, String), String), String), String) -> Int -> Int -> [( ( ( (String, String), String), String), String)]
addVehicle [] _ _ _ = []
addVehicle ( ( ( ( (a,b), c), d), e):xs) vehicle count col
    | count == col = [vehicle] ++ (addVehicle xs vehicle count (col+1))
    | otherwise = [( ( ( (a,b), c), d), e)] ++ (addVehicle xs vehicle count (col+1))

-- Função que remove uma n-tupla (veiculo) do inventário
removeVehicle :: [( ( ( (String, String), String), String), String)] -> String -> Int -> [( ( ( (String, String), String), String), String)]
removeVehicle _ _ 0 = []
removeVehicle ( ( ( ( (a,b), c), d), e):xs) idRemoval count
    | idRemoval == a = (removeVehicle xs idRemoval (count-1))
    | otherwise = [( ( ( (a,b), c), d), e)] ++ (removeVehicle xs idRemoval (count-1))

-- Função que exibe ao usuário todos os veículos disponiveis do inventário
availables :: [( ( ( (String, String), String), String), String)] -> Int -> IO()
availables _ 0 = putStrLn("")
availables (a:xs) cont = do
    if((snd a) == "Indisponivel") then do
        availables (xs) (cont-1)
    else do
        let id_print = (fst (fst (fst (fst a))))
        let type_print = (snd (fst (fst (fst a))))
        let model_print = (snd (fst (fst a)))
        let year_print = (snd (fst a))
        let situation_print = (snd a)
        putStrLn("ID: " ++ id_print ++ " / Tipo: " ++ type_print ++ " / Modelo: " ++ model_print ++ " / Ano de fabricação: " ++ year_print ++ " / Situação: " ++ situation_print)
    availables (xs) (cont-1)

-- Função que exibe ao usuário todos os veículos indisponíveis do inventário
unavailables :: [( ( ( (String, String), String), String), String)] -> Int -> IO()
unavailables _ 0 = putStrLn("")
unavailables (a:xs) cont = do
    if((snd a) == "Disponivel") then do
        unavailables (xs) (cont-1)
    else do
        let id_print = (fst (fst (fst (fst a))))
        let type_print = (snd (fst (fst (fst a))))
        let model_print = (snd (fst (fst a)))
        let year_print = (snd (fst a))
        let situation_print = (snd a)
        putStrLn("ID: " ++ id_print ++ " / Tipo: " ++ type_print ++ " / Modelo: " ++ model_print ++ " / Ano de fabricação: " ++ year_print ++ " / Situação: " ++ situation_print)
    unavailables (xs) (cont-1)

-- Função que exibe ao usuário todos os veículos do inventário
listAll :: [( ( ( (String, String), String), String), String)] -> Int -> IO()
listAll _ 0 = putStrLn("")
listAll (a:xs) cont = do
    if( (fst (fst (fst (fst a)))) == "N") then do
        listAll (xs) (cont-1)
    else do
        let id_print = (fst (fst (fst (fst a))))
        let type_print = (snd (fst (fst (fst a))))
        let model_print = (snd (fst (fst a)))
        let year_print = (snd (fst a))
        let situation_print = (snd a)
        putStrLn("ID: " ++ id_print ++ " / Tipo: " ++ type_print ++ " / Modelo: " ++ model_print ++ " / Ano de fabricação: " ++ year_print ++ " / Situação: " ++ situation_print)
    listAll (xs) (cont-1)

    --Funcao que retorna os atributos do veiculo
getVehicle :: [( ( ( (String, String), String), String), String)] -> Int -> String -> [String]
getVehicle (a:xs) cont id = do
    if((fst (fst (fst (fst a)))) == id) then do
        let vehicle = []
        let id_print = (fst (fst (fst (fst a))))
        let type_print = (snd (fst (fst (fst a))))
        let model_print = (snd (fst (fst a)))
        let year_print = (snd (fst a))
        let situation_print = (snd a)                 
        vehicle ++ [id_print] ++ [type_print] ++ [model_print]  ++ [year_print]  ++ [situation_print]
    else do 
        getVehicle (xs) (cont-1) id

-- Função que inicializa o inventário a cada chamada do main
initiateInvetory :: [( ( ( (String, String), String), String), String)] -> Int -> IO ()
initiateInvetory inventory count = do

    showMenu
    option <- getLine

    -- Opção de adição de veículo
    if (option == "1") then do
        putStrLn ("")
        putStrLn ("Você escolheu a opção para adicionar veículo ao inventário.")
        putStrLn ("Digite o ID do novo veículo:")
        id_ <- getLine
        putStrLn ("Digite o tipo do novo veículo:")
        type_ <- getLine
        putStrLn ("Digite o modelo do novo veículo:")
        model_ <- getLine
        putStrLn ("Digite o ano de fabricação do novo veículo:")
        year_ <- getLine
	putStrLn ("")
        putStrLn ("-----------Adicionado com sucesso!-------------")
	putStrLn ("")
        let inventoryUpgrade = addVehicle inventory ( ( ( (id_, type_), model_), year_), "Disponivel" ) count 0

        let countUpgrade = count + 1

        initiateInvetory inventoryUpgrade countUpgrade

    else do 

        -- Opção de remoção de veículo
        if(option == "2") then do

            if(count == 0) then do
                putStrLn ("")
                putStrLn ("Inventário vazio, escolha outra opção.")
                putStrLn ("")
                initiateInvetory inventory count
            else do
                putStrLn ("")
                putStrLn ("Você escolheu a opção para remover veículo do inventário.")
                putStrLn ("Digite o ID do veículo a ser removido:")
                idRemoval <- getLine

                let inventoryDowngrade = removeVehicle inventory idRemoval (length inventory)

                let countDowngrade = count - 1

                initiateInvetory inventoryDowngrade countDowngrade
		putStrLn ("-----------Removido com sucesso!-------------")

        else do

            -- Opção para listar todos os veículos 
            if(option == "4") then do

                if(count == 0) then do
                    putStrLn ("")
                    putStrLn ("Inventário vazio, escolha outra opção.")
                    putStrLn ("")
                    initiateInvetory inventory count
                else do
                    putStrLn ("")
                    putStrLn ("Inventário: ")
                    putStrLn ("")
                    listAll inventory count
                    initiateInvetory inventory count

            else do

                -- Opção para listar todos os veículos disponiveis
                if(option == "5") then do

                    if(count == 0) then do
                        putStrLn ("")
                        putStrLn ("Inventário vazio, escolha outra opção.")
                        putStrLn ("")
                        initiateInvetory inventory count
                    else do
                        putStrLn ("")
                        putStrLn ("Veículos Disponíveis: ")
                        putStrLn ("")
                        availables inventory count
                        initiateInvetory inventory count

                else do

                    -- Opção para listar todos os veículos indisponiveis
                    if(option == "6") then do

                        if(count == 0) then do
                            putStrLn ("")
                            putStrLn ("Inventário vazio, escolha outra opção.")
                            putStrLn ("")
                            initiateInvetory inventory count
                        else do
                            putStrLn ("")
                            putStrLn ("Veículos Indisponíveis:")
                            putStrLn ("")
                            unavailables inventory count
                            initiateInvetory inventory count

                    else do
                        -- Opção para alugar um veículo
                        if(option == "7") then do

                            if(count == 0) then do
                                putStrLn ("")
                                putStrLn ("Inventário vazio, escolha outra opção.")
                                putStrLn ("")
                                initiateInvetory inventory count
                            else do
                                putStrLn ("Digite o ID do veículo a ser alugado:")
                                id <- getLine
                                putStrLn ("")
                                putStrLn ("-----------Veiculo alugado com sucesso!-------------")
                                let vehicle = getVehicle inventory count id
                                                               
                                let inventoryRem = removeVehicle inventory id (length inventory)                       
                                let inventoryAdd = addVehicle inventoryRem ((((vehicle !! 0, vehicle !! 1), vehicle !! 2),vehicle !! 3), "Indisponivel" ) count 1
                                                              
                                initiateInvetory inventoryAdd count
				
                        else do
                            -- Opção para devolver um veículo
                            if(option == "8") then do

                                if(count == 0) then do
                                    putStrLn ("")
                                    putStrLn ("Inventário vazio, escolha outra opção.")
                                    putStrLn ("")
                                    initiateInvetory inventory count
                                    
                                else do
                                    putStrLn ("Digite o ID do veículo a ser devolvido:")
                                    id <- getLine
                                    putStrLn ("")
                                    putStrLn ("-----------Devolução realizada com sucesso!-------------")
                                    let vehicle = getVehicle inventory count id
                                                                        
                                    let inventoryRem = removeVehicle inventory id (length inventory)                                    
                                    let inventoryAdd = addVehicle inventoryRem ((((vehicle !! 0, vehicle !! 1), vehicle !! 2),vehicle !! 3), "Disponivel" ) count 1
                                                                            
                                    initiateInvetory inventoryAdd count
				    
                            else do
                                -- Opção para visualizar um veículo
                                if(option == "3") then do

                                    if(count == 0) then do
                                        putStrLn ("")
                                        putStrLn ("Inventário vazio, escolha outra opção.")
                                        putStrLn ("")
                                        initiateInvetory inventory count
                                        
                                    else do
                                        putStrLn ("Digite o ID do veículo a ser visualizado:")
                                        id <- getLine
                                        putStrLn ("")
                                        
                                        let vehicle = getVehicle inventory count id
                                                                            
                                        putStrLn("ID: " ++ vehicle !! 0 ++ " / Tipo: " ++ vehicle !! 1 ++ " / Modelo: " ++ vehicle !! 2 ++ " / Ano de fabricação: " ++ vehicle !! 3 ++ " / Situação: " ++ vehicle !! 4)                                    
                                        putStrLn ("")                                                                               
                                        
                                        initiateInvetory inventory count
                                
                                else do
                                putStrLn ("Você escolheu uma opção inválida, escolha outra opção.")
                                initiateInvetory inventory count

-- Função Main
main :: IO ()
main = do
    let size = 100
    let inventory = createInventory size
    let count = 0
    initiateInvetory inventory count
