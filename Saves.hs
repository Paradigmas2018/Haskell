module Saves 
(
  saveGameData,
  loadGameData,
) where

import System.IO
import Unit

saveGameData :: Unit -> IO ()
saveGameData unit = do
    file <- openFile "save.txt" WriteMode
    hPrint file (unit)
    putStrLn "Escrito com sucesso"
    hFlush file
    hClose file


loadGameData = do
    file <- openFile "save.txt" ReadMode
    content <- hGetContents file
    let unit = (read (content) :: Unit)
    return unit