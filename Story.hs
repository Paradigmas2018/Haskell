module Story
    (
    beginning,
    sword,
    wand,
    bow,
    printChoice,
    flip'
    ) where

beginning = putStrLn "Você acorda em uma casa vazia. 'O que está acontecendo?'\
\ Você se pergunta. Ainda atordoado por algum motivo, resolve estudar melhor\
\ o ambiente. Imediamente, nota uma mesa a sua frente com três itens.\
\ Um graveto - não. Seus olhos voltam ao normal - uma varinha à\
\ esquerda. Uma espada no centro. E um arco e uma aljava com algumas\
\ flechas à direita. \n\n\
\ Ao redor, apenas paredes brancas e uma porta. Você está confuso.\
\ É melhor tentar sair para descobrir por que você está aqui. Você decide pegar\
\ um dos equipamentos da mesa e explorar. \n\n\
\ O que você quer pegar?"

sword = "Você pega a espada e "

wand = "Você pega a varinha e "

bow = "Você pega o arco e a aljava e "

printChoice xs = putStrLn $ xs ++ "imeadiatamente um flashback passa por\
\ sua mente. Imagens confusas. Uma nave. Um vírus. Tripulação.\
\ A Terra. Um nome: Talinia. Você resolve sair e tentar entender o que tudo\
\ isso significa."

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x
