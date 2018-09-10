{-
    Module      : Interface
    Description : Present Info about games Units
-}
module Interface
(
  drawUnitStat
) where

import Unit


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

