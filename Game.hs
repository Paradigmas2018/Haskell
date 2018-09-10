module Game where

import Unit
import MapTree
import Battle
import Story
import System.Console.ANSI
import System.IO
import System.Exit  

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


-- drawStartScreen :: IO()
drawStartScreen = do
  putStrLn $ "#####  RPGaskell  #####"
  putStrLn $ "1 <- Novo Jogo"
  putStrLn $ "2 <- Continuar"
  putStrLn $ "3 <- Sair"
  choice <- getLine
  case choice of 
    "1" -> newGame;
    "2" -> loadGame;
    "3" -> exitGame;

  
newGame = do
  name <- readName
  cls <- readClass
  let unit = createUnit name cls 100 10 10 10 True
  playGame unit storyMap

readName = do
  clearScreen
  putStrLn $ "Como voce se chama? "
  name <- getLine
  return name

readClass = do
  clearScreen
  beginning
  ch <- getChar
  putStrLn $ "(1) " ++bow ++ "\n"++ "(2) "++wand ++"\n"++ "(3) "++sword++"\n"
  option <- getLine
  case option of
    "1" -> return (Archer) 
    "2" -> return (Wizard) 
    "3" -> return (Warrior) 
    otherwise -> do
      putStrLn $ "Escolha uma dos equipamentos! Sem eles você será amassado como uma batata."
      ch <- getChar
      readClass

-- loadGame :: IO()
loadGame = exitSuccess

-- exitGame :: IO()
exitGame = exitSuccess