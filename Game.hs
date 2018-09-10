module Game where

import Unit
import MapTree
import Battle
import Story
import Saves
import System.Console.ANSI
import System.IO
import System.Exit

-- playGame :: Unit -> MapTree -> IO ()
playGame unit Null = do
    putStrLn $ endGameCongrats
playGame unit (Node (MapNode(village, enemy, story)) (a) (b)) = do
    if enemy /= NullUnity then do
        putStrLn $ "\n\n\n" ++ story
        putStrLn $ startBattleDialogue
        stop <- getLine
        hero <- combat unit enemy
        wantSave hero
        choice hero a b
    else do
        putStrLn $ story
        choice unit a b

wantSave hero = do
    putStrLn $ "Quer sair para descansar?"
    ch <- getLine
    case ch of
        "sim" -> do 
            putStrLn $ "Deseja salvar?"
            ch <- getLine
            case ch of
                "sim" -> do 
                    saveGameData hero 
                    exitSuccess
                "nao" -> exitSuccess
        "nao" -> return hero
        otherwise->  wantSave hero

-- choice :: Unit -> MapTree -> MapTree -> MapTree -> MapTree -> IO()
choice hero Null Null = do
    playGame hero Null
choice hero a b = do
    putStrLn $ "Escolha um caminho! Onde explorar? (1) " ++ (getVillageName a) ++ " (2) " ++ (getVillageName b)
    ch <- getLine
    case ch of
        "1" -> playGame hero a
        "2" -> playGame hero b
        otherwise -> (choice hero a b)


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
  putStrLn $ "(1) " ++bow ++ "\n"++ "(2) "++wand ++"\n"++ "(3) "++sword++"\n"
  option <- getLine
  case option of
    "1" -> do
        printChoice bow
        return (Archer)
    "2" -> do
        printChoice wand
        return (Wizard)
    "3" -> do
        printChoice sword
        return (Warrior)
    otherwise -> do
      putStrLn $ "Escolha uma dos equipamentos! Sem eles você será amassado como uma batata."
      ch <- getChar
      readClass

-- loadGame :: IO()
loadGame = do
  unit <- loadUnit
  getLine
  playGame unit storyMap

-- exitGame :: IO()
exitGame = exitSuccess
