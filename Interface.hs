module Interface
(
  drawStartScreen,
  drawUnitStat
) where

import Unit
import Saves
import System.Console.ANSI
import System.IO
import System.Exit

-- drawStartScreen :: IO()
drawStartScreen = do
  putStrLn $ "#####  NOME DO JOGO  #####"
  putStrLn $ "1 <- Novo Jogo"
  putStrLn $ "2 <- Continuar"
  putStrLn $ "3 <- Sair"
  -- choice <- getLine
  -- case choice of 
  --   "1" -> newGame;
  --   "2" -> loadGame;
  --   "3" -> exitGame;

  
newGame = do
  name <- readName
  cls <- readClass
  let unit = createUnit name cls 100 10 10 10 True
  return unit

readName = do
  putStrLn $ "Qual o seu nome? "
  name <- getLine
  return name

readClass = do
  putStrLn $ "Você é um (1) Arqueiro, (2) Guerreiro ou (3) Mago?"
  option <- getLine
  case option of
    "1" -> return (Archer) 
    "2" -> return (Warrior) 
    "3" -> return (Wizard) 
    otherwise -> do
      putStrLn $ "Não há essa opção"
      readClass

loadGame :: IO()
loadGame = putStrLn "abc"

exitGame :: IO()
exitGame = exitSuccess
  

drawUnitStat :: Unit -> Unit -> IO()
drawUnitStat hero enemy = do
  let lenName = length ("Nome: " ++ (getName hero))
  let lenHP = length ("HP:  " ++ (show (getHP hero)) ++ "/"++ (show (getMaxHP hero)))
  let lenAtq = length ("Atq: " ++ (show (getAttack hero)))
  let lenDef = length ("Def: " ++ (show (getDefense hero)))
  let lenSpd = length ("Vel: " ++ (show (getSpeed hero)))
  putStrLn $ "Nome: " ++ (getName hero) ++ (replicate (30 - lenName) ' ') ++"|| "++ "Nome: " ++ (getName enemy)
  putStrLn $ "HP:  " ++ (show (getHP hero)) ++ "/"++ (show (getMaxHP hero))++ (replicate (30 - lenHP) ' ') ++"|| "++"HP:  " ++ (show (getHP enemy)) ++ "/"++ (show (getMaxHP enemy))
  putStrLn $ "Atq: " ++ (show (getAttack hero))++ (replicate (30 - lenAtq) ' ') ++"|| "++ "Atq: " ++ (show (getAttack enemy))
  putStrLn $ "Def: " ++ (show (getDefense hero)) ++ (replicate (30 - lenDef) ' ') ++"|| "++ "Def: " ++ (show (getDefense enemy))
  putStrLn $ "Vel: " ++ (show (getSpeed hero))  ++ (replicate (30 - lenSpd) ' ') ++"|| "++ "Vel: " ++ (show (getSpeed enemy))
  putStrLn $ (replicate 60 '-')

