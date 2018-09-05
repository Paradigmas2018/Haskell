import System.IO
import Data.List

{- 
  Module : MapTree
  Description : Tree that contains stages for archer
-}
module MapTree (
    actionTree
) where

type NorthVillage = String -- Villages localized in north
type SouthVillage = String -- Villages localized in south
type EastVillage = String -- Villages localized in east
type WestVillage = String -- Vilages localized in west

-- Represent Villages
data Village = NorthVillage | SouthVillage | EastVillage | WestVillage deriving (Show)

-- Tree for each Village
data MapTree a = Null
               | Node Village (MapTree a) (MapTree a) (MapTree a) (MapTree a)  deriving (Show)

-- Create Tree RPG actions
actionTree :: MapTree [Char]
actionTree = 
    Node "Warrior"
      (Node "North Village" Null Null)
      (Node "South Village" Null Null)
      (Node "East Village" Null Null)
      (Node "West Village" Null Null)
 