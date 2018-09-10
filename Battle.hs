module Battle where

import Unit
import Story
import Interface
import System.Exit
import System.Console.ANSI

data Action = Attack (Unit, Unit) | Heal (Unit)

actionValue :: Action -> Int
actionValue (Attack (hero, enemy))
    | getClass hero == Archer && getClass enemy == Warrior = -(abs (round (-(((attack*speed)/3) - defense * (boostDef)))))
    | getClass hero == Archer && getClass enemy == Wizard = -(abs (round (-(( (attack*speed)/3) * (boostAtk) - defense))))
    | getClass hero == Wizard && getClass enemy == Archer = -(abs (round (-(((attack*speed)/3) - defense * (boostDef)))))
    | getClass hero == Wizard && getClass enemy == Warrior = -(abs (round (-(((attack*speed)/3) * (boostAtk) - defense))))
    | getClass hero == Warrior && getClass enemy == Wizard = -(abs (round (-(((attack*speed)/3) - defense * (boostDef)))))
    | getClass hero == Warrior && getClass enemy == Archer = -(abs (round (-(((attack*speed)/3) * (boostAtk) - defense))))
    | otherwise = -(abs (round (-(((attack*speed)/3) + defense))))
    where attack  = fromIntegral (getAttack hero) :: Float
          speed   = fromIntegral (getSpeed hero) :: Float
          defense = fromIntegral (getDefense enemy) :: Float
          boostAtk = 1.3
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
    printChoiceBattle
    if isDead(hero) then (return DeadUnit)
    else
        do
            action <- getLine
            clearScreen
            case action of
                "1" -> do
                    putStrLn $ "\n ==>"++(getName hero) ++ " atacou " ++ (getName enemy)++"\n"
                    enemyTurn (updateUnit enemy (Attack (hero, enemy))) hero
                "2" -> do
                    putStrLn $ "\n ==>"++(getName hero) ++ " se curou."++"\n"
                    enemyTurn enemy (updateUnit hero (Heal (hero)))
                otherwise -> do
                    putStrLn "Movimento inválido"
                    heroTurn hero enemy

enemyTurn :: Unit -> Unit -> IO Unit
enemyTurn enemy hero = do
    -- drawUnitStat hero enemy
    let action = if (getHP enemy) > 10 then "1" else "2"
    if isDead(enemy) then return hero
    else
        do
            case action of
                "1" -> do
                    putStrLn $ "\n ==>"++(getName enemy) ++ " atacou " ++ (getName hero)++"\n"
                    heroTurn (updateUnit hero (Attack (enemy, hero))) enemy
                "2" -> do
                    putStrLn $ "\n ==>"++(getName enemy) ++ " se curou."++"\n"
                    heroTurn hero (updateUnit enemy (Heal (enemy)))
                otherwise -> do
                    putStrLn "Movimento inválido"
                    enemyTurn enemy hero

combat hero enemy = do

    unit <- if (getSpeed hero) >= (getSpeed enemy) then (heroTurn hero enemy) else (enemyTurn enemy hero)
    clearScreen
    case unit of
        DeadUnit -> do
            putStrLn $ endGameDeath
            exitSuccess
        Unit _ -> do
            putStrLn $ battleWonDialogue
            case (getClass enemy) of
                Archer -> return (setAttack unit ((getAttack unit)+1)) 
                Warrior -> return (setDefense unit ((getDefense unit)+1)) 
                Wizard -> return (setSpeed unit ((getSpeed unit)+1)) 
