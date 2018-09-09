{- 
  Module : MapTree
  Description : Tree that contains stages for archer
-}
module MapTree (
    actionTree
) where

import Unit

type NorthVillage = String -- Villages localized in north
type SouthVillage = String -- Villages localized in south
type EastVillage = String -- Villages localized in east
type WestVillage = String -- Vilages localized in west

-- Represent Villages
data Village = NorthVillage | SouthVillage | EastVillage | WestVillage deriving (Show)

-- Tree Structure
type HistoryString = String
type Value = Int
type Enemy = Unit

data MapNode = MapNode(Village, Enemy, HistoryString) -- MapTree node

-- FIXME: - Delete - User for testing pourpose
data Tree a = Null
            | Node a (Tree a) (Tree a) deriving(Show)

-- Tree for each Village
data MapTree a = Null
               | MapNode (MapTree a) (MapTree a) deriving (Show)

Node 5 (Node 3 Null Null) (Node 2 Null Null)

-- Create MapTree
getMapTree :: Unit -> MapTree [Char]
getMapTree = ("Map"
                (Node "Warrior"
                    (Node "North Village" Null Null)
                    (Node "South Village" Null Null)
                )
                (Node "Archer"
                    (Node "East Village" Null Null)
                    (Node "West Village" Null Null)
                )
            )

-- Create MapTree node
createMapNode :: Village -> Value -> HistoryString -> MapNode
createMapNode village value history = MapNode(village, value, history)

-- Testing values with simple tree
sumNodes :: Num a => Tree a -> a
sumNodes Null = 0
sumNodes (Node n t1 t2) = n + sumNodes t1 + sumNodes t2

-- 
getBranch :: Tree a -> String -> Tree a
getBranch Null value = Null
getBranch Tree a value = do
    if a == value then Tree a
    else getBranch (((Tree a) (Tree a)), value)

-- Getters

getHistoryString :: MapNode -> String
getHistoryString (MapNode((_, _, h))) = h 

getValue :: MapNode -> Enemy
getValue (MapNode(_, e, _)) = e

getVillageName :: MapNode -> String
getVillageName (MapNode(n, _, _)) = n