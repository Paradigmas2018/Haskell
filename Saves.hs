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

-- saveGameData :: Unit -> MapNode -> IO ()
saveGameData unit map= do
    writeFile "tmp.txt" $ ((showUnit unit)++";"++(show map))
    renameFile "tmp.txt" "save.txt"


-- loadGameData:: Unit
loadGameData = do
    unit <- readFile "save.txt"
    return (splitOn ";" unit)

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

loadMap = do
    gameData <- loadGameData
    let map = (read (getData gameData 9) :: MapTree a)
    return map

    -- Usar read

getData [] _ = ""
getData (x:xs) 0 = x
getData (x:xs) num = getData xs (num-1)
