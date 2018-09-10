{-
    Module      : Saves
    Description : Save player status according to game
-}
module Saves 
(
  saveGameData,
  loadGameData,
  loadUnit,
  loadMap
) where

import System.IO
import Unit
import MapTree
import Text.Read
import Data.List.Split
import System.Directory (renameFile)

-- Funcao que recebe a o estado da unidade e do mapa e escreve em arquivo
saveGameData :: Show a => Unit -> a -> IO ()
saveGameData unit map= do
    writeFile "tmp.txt" $ ((showUnit unit)++";"++(show map))
    renameFile "tmp.txt" "save.txt"

-- Realiza a leitura do arquivo como string e retorna essas informacoes em uma lista
loadGameData :: IO [String]
loadGameData = do
    unit <- readFile "save.txt"
    return (splitOn ";" unit)

-- Funcao que recebe uma lista de dados do arquivo e returna uma Unidade com o estado em que foi salvo
loadUnit :: IO Unit
loadUnit = do
    gameData <- loadGameData
    let unit = createUnit (getData gameData 0) 
                    (read (getData gameData 1)) 
                        (read (getData gameData 2)) 
                            (read (getData gameData 4)) 
                                (read (getData gameData 5)) 
                                    (read (getData gameData 6)) 
                                        (read (getData gameData 8))
    return unit

-- Funcao que recebe uma lista dos dados do arquivo e retorna a posicao em que o mapa foi salvo
loadMap :: IO (MapTree a)
loadMap = do
    gameData <- loadGameData
    let map = (read (getData gameData 9) :: MapTree a)
    return map

-- Funcao utilizada para extrair informações das informacoes na lista
getData :: (Eq t, Num t) => [String] -> t -> [Char]
getData [] _ = ""
getData (x:xs) 0 = x
getData (x:xs) num = getData xs (num-1)
