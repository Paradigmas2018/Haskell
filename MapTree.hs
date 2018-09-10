{-
  Module : MapTree
  Description : Tree that contains stages for archer
-}
module MapTree (
    MapTree(..),
    MapNode(..),
    storyMap,
    createMapNode,
    getHistoryString,
    getValue,
    getVillageName
) where

import Unit
import Enemies
import Story

-- Represent Villages
type Village =  String

-- Tree Structure
type StoryString = String
type Enemy = Unit

data MapNode = MapNode(Village, Enemy, StoryString) deriving(Read, Show) -- MapTree node

-- Tree for game
data MapTree a = Null
             | Node MapNode (MapTree a) (MapTree a) deriving(Read, Show)

-- Places
tresting = "Tresting"
meridell = "Meridell"
phorofor = "Phorofor"
paris = "Paris"

-- Enemies' nodes for Tree
initialNode = MapNode("Initial Game", NullUnity, "")
ramsorNode = MapNode(tresting, ramsor, ramsorDialogue)
mynxeNode = MapNode(meridell, mynxe, mynxeDialogue)
anmiNode = MapNode(phorofor, anmi, anmiDialogue)
ghaaaauyaNode = MapNode(paris, ghaaaauya, ghaaaauyaDialogue)
lohnNode = MapNode(tresting, lohn, lohnDialogue)
mountainWolfNode = MapNode(meridell, mountainWolf, mountainWolfDialogue)
malfoyNode = MapNode(phorofor, malfoy, malfoyDialogue)
robinhoODoFilmeNode = MapNode(paris, robinhoODoFilme, robinhoODoFilmeDialogue)
singleEyedGladiatorNode = MapNode(tresting, singleEyedGladiator, singleEyedGladiatorDialogue)
itzelNode = MapNode(paris, itzel, itzelDialogue)
hydellNode = MapNode(meridell, hydell, hydellDialogue)
durgessNode = MapNode(phorofor, durgess, durgessDialogue)
terakNode = MapNode(tresting, terak, terakDialogue)
ilyNode = MapNode(meridell, ily, ilyDialogue)
noxNode = MapNode(phorofor, nox, noxDialogue)
kingForgusGhostNode = MapNode(paris, kingForgusGhost, kingForgusGhostDialogue)


-- MapTree
leftSide = (Node (MapNode(northVillage, NullUnity , northVillageDialogue))
     (Node ramsorNode
       (Node mynxeNode
         (Node ghaaaauyaNode
           (Node lohnNode Null Null) (Node mountainWolfNode Null Null))
         (Node malfoyNode
           (Node robinhoODoFilmeNode Null Null) (Node singleEyedGladiatorNode Null Null)))
       (Node anmiNode
         (Node itzelNode
           (Node hydellNode Null Null) (Node durgessNode Null Null))
         (Node terakNode
           (Node ilyNode Null Null) (Node noxNode Null Null))))
     (Node kingForgusGhostNode
       (Node malfoyNode
         (Node singleEyedGladiatorNode
           (Node itzelNode Null Null) (Node hydellNode Null Null))
         (Node noxNode
           (Node robinhoODoFilmeNode Null Null) (Node ghaaaauyaNode Null Null)))
       (Node anmiNode
         (Node noxNode
           (Node ramsorNode Null Null) (Node durgessNode Null Null))
         (Node robinhoODoFilmeNode
           (Node terakNode Null Null) (Node mountainWolfNode Null Null)))))

rightSide = (Node (MapNode(southVillage, NullUnity , southVillageDialogue))
     (Node mynxeNode
       (Node mountainWolfNode
         (Node anmiNode
           (Node lohnNode Null Null) (Node robinhoODoFilmeNode Null Null))
         (Node noxNode
           (Node itzelNode Null Null) (Node ramsorNode Null Null)))
       (Node malfoyNode
         (Node itzelNode
           (Node terakNode Null Null) (Node ramsorNode Null Null))
         (Node ghaaaauyaNode
           (Node ilyNode Null Null) (Node mountainWolfNode Null Null))))
     (Node kingForgusGhostNode
       (Node anmiNode
         (Node terakNode
           (Node durgessNode Null Null) (Node itzelNode Null Null))
         (Node hydellNode
           (Node mountainWolfNode Null Null) (Node ghaaaauyaNode Null Null)))
       (Node ghaaaauyaNode
         (Node ramsorNode
           (Node mynxeNode Null Null) (Node durgessNode Null Null))
         (Node hydellNode
           (Node durgessNode Null Null) (Node lohnNode Null Null)))))

storyMap = Node initialNode leftSide rightSide

-- Create MapTree node
createMapNode :: Village -> Unit -> StoryString -> MapNode
createMapNode village unit history = MapNode(village, unit, history)

-- Getters

getHistoryString :: MapNode -> String
getHistoryString (MapNode((_, _, h))) = h

getValue :: MapNode -> Enemy
getValue (MapNode(_, e, _)) = e

getVillageName :: MapTree a -> String
getVillageName (Node (MapNode(n, _, _)) _ _) = n
