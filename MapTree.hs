{- 
  Module : MapTree
  Description : Tree that contains stages for archer
-}
module MapTree (
    actionTree
) where

import System.IO
import Data.List

type NorthVillage = String -- Villages localized in north
type SouthVillage = String -- Villages localized in south
type EastVillage = String -- Villages localized in east
type WestVillage = String -- Vilages localized in west

-- Represent Villages
data Village = NorthVillage | SouthVillage | EastVillage | WestVillage deriving (Show)

-- Tree Structure
type HistoryString = String
type Value = Int

data MapNode = MapNode(Village, Value, HistoryString) -- MapTree node

-- FIXME: - Delete - User for testing pourpose
data Tree a = Null
          | Node a (Tree a) (Tree a) deriving(Show)

-- Tree for each Village
data MapTree a = Null
               | Node Village (MapTree a) (MapTree a) (MapTree a) (MapTree a)  deriving (Show)

-- Create MapTree
getMapTree :: MapTree [Char]
getMapTree = 
    Node "Warrior"
      (Node "North Village" Null Null)
      (Node "South Village" Null Null)
      (Node "East Village" Null Null)
      (Node "West Village" Null Null)

-- Create MapTree node
createMapNode :: Village -> Value -> HistoryString -> MapNode
createMapNode village value history = MapNode(village, value, history)

-- Testing values with simple tree
sumNodes :: Num a => Tree a -> a
sumNodes Null = 0
sumNodes (Node n t1 t2) = n + sumNodes t1 + sumNodes t2

getBranch :: Tree a -> String -> Tree a
getBranch Null value = Null
getBranch Tree a value = do
    if a == value then Tree a
    else getBranch (((Tree a) (Tree a)), value)

-- Getters

getHistoryString :: MapNode -> String
getHistoryString (MapNode((_, _, h))) = h 

getValue :: MapNode -> Int
getValue (MapNode(_, v, _)) = v

getVillageName :: MapNode -> String
getVillageName (MapNode(n, _, _)) = n