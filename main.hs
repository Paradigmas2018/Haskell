{-
    Module      : main
    Description : Delegated to execute all modules
-}


data Tree a = Null
          | Node a (Tree a) (Tree a) deriving(Show)

main = do
      putStrLn "Hello, world!"
      putStrLn "Miguel"

      let tree = Node 5 (Node 3 Null Null) (Node 2 Null Null)
      print tree
   