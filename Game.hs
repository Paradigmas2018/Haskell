module Game where

import Unit
import MapTree
import Battle

-- playGame :: Unit -> MapTree -> IO ()
playGame unit Null = do
    putStrLn "Fim"
playGame unit (Node (MapNode(village, enemy, story)) (a) (b) (c) (d)) = do
    if enemy /= NullUnity then do
        putStrLn $ story
        stop <- getLine
        hero <- combat unit enemy
        choice hero a b c d
    else do
        putStrLn $ story
        stop <- getLine
        choice unit a b c d


-- choice :: Unit -> MapTree -> MapTree -> MapTree -> MapTree -> IO()
choice hero Null Null Null Null = do
    playGame hero Null
choice hero a b c d = do 
    putStrLn $ "Escolha um caminho (1)" ++ (getVillageName a) ++ " ou (2)" ++ (getVillageName b)
    ch <- getLine
    case ch of
        "1" -> playGame hero a
        "2" -> playGame hero b
        "3" -> playGame hero c
        "4" -> playGame hero d
        otherwise -> (choice hero a b c d)