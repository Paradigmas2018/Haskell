module Saves 
(
  saveGameData,
  loadGameData,
  loadUnit
) where

import System.IO
import Unit
import Text.Read
import Data.List.Split

saveGameData :: Unit -> IO ()
saveGameData unit = do
    writeFile "save.txt" $ showUnit unit


-- loadGameData:: Unit
loadGameData = do
    unit <- readFile "save.txt"
    return (splitOn "," unit)

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

    -- Usar read

getData [] _ = ""
getData (x:xs) 0 = x
getData (x:xs) num = getData xs (num-1)
