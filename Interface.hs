module Interface
(
  drawStartScreen,
  drawUnitStat
) where

import Unit
import System.Console.ANSI
import System.IO
import System.Exit

drawStartScreen :: IO()
drawStartScreen = do
  putStrLn $ "#####  NOME DO JOGO  #####"
  putStrLn $ "1 <- Novo Jogo"
  putStrLn $ "2 <- Continuar"
  putStrLn $ "3 <- Sair"
  choice <- getLine
  case choice of 
    "1" -> newGame;
    "2" -> loadGame;
    "3" -> exitGame;

newGame :: IO()    
newGame = do
  putStrLn $ ""

loadGame :: IO()
loadGame = putStrLn "abc"

exitGame :: IO()
exitGame = exitSuccess
  

drawUnitStat :: Unit -> IO()
drawUnitStat unit = do
  putStrLn $ "Nome: " ++ (getName unit)
  putStrLn $ "HP:  " ++ (show (getHP unit)) ++ "/"++ (show (getMaxHP unit))
  putStrLn $ "Atq: " ++ (show (getAttack unit))
  putStrLn $ "Def: " ++ (show (getDefense unit))
  putStrLn $ "Vel: " ++ (show (getSpeed unit))  
  putStrLn $ (replicate 35 '-')

