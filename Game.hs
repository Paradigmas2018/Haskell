module Game where

import Unit
import MapTree
import Battle

playGame :: Unit -> MapTree -> IO ()
playGame unit (MapNode(village, enemy, story) (MapTree a) (MapTree b)) = do
    putStrLn $ story
    stop <- getline
    hero <- combat unit enemy
    putStrLn $ "Escolha um caminho (1)" ++ a ++ " ou (2)" ++ b
    choice hero a b

choice :: Unit -> MapTree -> MapTree -> IO()
choice hero a b = do 
    c <- getline
    case c of
        "1" -> playGame hero a
        "2" -> playGame hero b
        otherwise (choicer hero a b)