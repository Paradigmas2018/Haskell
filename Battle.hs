module Battle where

import Unit
import Interface
import System.Exit
import System.Console.ANSI

data Action = Attack (Unit, Unit) | Heal (Unit)

actionValue :: Action -> Int
actionValue (Attack (hero, enemy)) 
    | getClass hero == Archer && getClass enemy == Warrior = round (-(((attack*speed)/3) - defense * (boostDef)))
    | getClass hero == Archer && getClass enemy == Wizard = round (-(( (attack*speed)/3) * (boostAtk) - defense))
    | getClass hero == Wizard && getClass enemy == Archer = round (-(((attack*speed)/3) - defense * (boostDef))) 
    | getClass hero == Wizard && getClass enemy == Warrior = round (-(((attack*speed)/3) * (boostAtk) - defense)) 
    | getClass hero == Warrior && getClass enemy == Wizard = round (-(((attack*speed)/3) - defense * (boostDef)))
    | getClass hero == Warrior && getClass enemy == Archer = round (-(((attack*speed)/3) * (boostAtk) - defense)) 
    | otherwise = round (-(((attack*speed)/3) + defense))
    where attack  = fromIntegral (getAttack hero) :: Float
          speed   = fromIntegral (getSpeed hero) :: Float
          defense = fromIntegral (getDefense enemy) :: Float
          boostAtk = 1.2
          boostDef = 1.3
actionValue (Heal (unit)) = (if (hp + potion) >= maxHP then maxHP-hp else potion)
    where hp = getHP unit
          maxHP = getMaxHP unit
          potion = div (getMaxHP unit) 6


updateUnit :: Unit -> Action -> Unit 
updateUnit unit action = setHP unit (health + effect)
    where effect = actionValue action
          health = getHP unit
    

heroTurn :: Unit -> Unit -> IO Unit
heroTurn hero enemy = do
    drawUnitStat hero enemy
    putStr "hero (atq, cura): "
    if isDead(hero) then (return DeadUnit)
    else
        do
            action <- getLine
            case action of
                "atq" -> do
                    putStrLn $ (getName hero) ++ " atacou " ++ (getName enemy)
                    enemyTurn (updateUnit enemy (Attack (hero, enemy))) hero
                "cura" -> do
                    putStrLn $ (getName hero) ++ " se curou."
                    enemyTurn enemy (updateUnit hero (Heal (hero)))
                otherwise -> do 
                    putStrLn "Movimento inválido"
                    heroTurn hero enemy

enemyTurn :: Unit -> Unit -> IO Unit
enemyTurn enemy hero = do
    drawUnitStat hero enemy
    let action = if (getHP enemy) > 10 then "atq" else "cura"
    if isDead(enemy) then return hero
    else
        do
            case action of
                "atq" -> do
                    putStrLn $ (getName enemy) ++ " atacou " ++ (getName hero)
                    heroTurn (updateUnit hero (Attack (enemy, hero))) enemy
                "cura" -> do
                    putStrLn $ (getName enemy) ++ " se curou."
                    heroTurn hero (updateUnit enemy (Heal (enemy)))
                otherwise -> do 
                    putStrLn "Movimento inválido"
                    enemyTurn enemy hero

combat hero enemy = do 

    unit <- if (getSpeed hero) >= (getSpeed enemy) then (heroTurn hero enemy) else (enemyTurn enemy hero)
    clearScreen
    case unit of
        DeadUnit -> do
            putStrLn "Voce Morreu"
            exitSuccess
        Unit _ -> do
            case (getClass enemy) of
                Archer -> return (setHP (setAttack unit ((getAttack unit)+1)) (getMaxHP unit))
                Warrior -> return (setHP (setDefense unit ((getDefense unit)+1)) (getMaxHP unit))
                Wizard -> return (setHP (setSpeed unit ((getSpeed unit)+1)) (getMaxHP unit))
           
