{- 
  Module : MapTree
  Description : Tree that contains stages for archer
-}
module MapTree (
    storyMap,
    createMapNode,
    getHistoryString,
    getValue,
    getVillageName
) where

import Unit
import Enemies

-- Represent Villages
type Village =  String

-- Tree Structure
type StoryString = String
type Enemy = Unit

data MapNode = MapNode(Village, Enemy, StoryString) deriving(Show) -- MapTree node

-- Tree for game
data MapTree a = Null
             | Node MapNode (MapTree a) (MapTree a) (MapTree a) (MapTree a) deriving(Show)

-- MapTree

storyMap = Node (MapNode("Initial Game", NullUnity, ""))
           (
            Node (MapNode("North Village", NullUnity , ""))
                (Node (MapNode("Tresting", ramsor, "")) Null Null Null Null)
                (Node (MapNode("Tresting", mynxe, "")) Null Null Null Null)
                (Node (MapNode("Tresting", anmi, "")) Null Null Null Null)
                (Node (MapNode("Tresting", ghaaaauya, "")) Null Null Null Null)
            )
           (
            Node (MapNode("South Village", NullUnity, ""))
                (Node (MapNode("Meridell", lohn, "")) Null Null Null Null)
                (Node (MapNode("Meridell", mountainWolf, "")) Null Null Null Null)
                (Node (MapNode("Meridell", malfoy, "")) Null Null Null Null)
                (Node (MapNode("Meridell", robinhoODoFilme, "")) Null Null Null Null)
            )
           (
            Node (MapNode("East Village", NullUnity, ""))
                (Node (MapNode("Phorofor", singleEyedGladiator, "")) Null Null Null Null)
                (Node (MapNode("Phorofor", itzel, "")) Null Null Null Null)
                (Node (MapNode("Phorofor", hydell, "")) Null Null Null Null)
                (Node (MapNode("Phorofor", durgess, "")) Null Null Null Null)
            )
           (
            Node (MapNode("West Village", NullUnity, ""))
                (Node (MapNode("Ramtor", terak, "")) Null Null Null Null)
                (Node (MapNode("Ramtor", ily, "")) Null Null Null Null)
                (Node (MapNode("Ramtor", nox, "")) Null Null Null Null)
                (Node (MapNode("Ramtor", ghaaaauya, "")) Null Null Null Null)
            )

-- Create MapTree node
createMapNode :: Village -> Unit -> StoryString -> MapNode
createMapNode village unit history = MapNode(village, unit, history)

-- Getters

getHistoryString :: MapNode -> String
getHistoryString (MapNode((_, _, h))) = h 

getValue :: MapNode -> Enemy
getValue (MapNode(_, e, _)) = e

getVillageName :: MapNode -> String
getVillageName (MapNode(n, _, _)) = n