module Battle where

import Unit
import Interface
import System.Exit

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

killHero :: Unit -> IO()
killHero unit = do
    putStrLn (getName unit ++ " morreu.")
    return DeadUnit 
    exitSuccess

killEnemy :: Unit -> IO()
killEnemy unit = do
    putStrLn (getName unit ++ " morreu.")
    return DeadUnit 
    exitSuccess

heroTurn :: Unit -> Unit -> IO()
heroTurn hero enemy = do
    drawUnitStat hero
    drawUnitStat enemy
    putStr "hero (atk, heal): "
    if isDead(hero) then  (killHero hero)
    else
        do
            action <- getLine
            case action of
                "atk" -> enemyTurn (updateUnit enemy (Attack (hero, enemy))) hero
                "heal" -> enemyTurn enemy (updateUnit hero (Heal (hero)))
                otherwise -> do 
                    putStrLn "Movimento inválido"
                    heroTurn hero enemy

enemyTurn :: Unit -> Unit -> IO()
enemyTurn enemy hero = do
    drawUnitStat hero
    drawUnitStat enemy
    putStr "enemy (atk, heal): "
    if isDead(enemy) then (killEnemy enemy)
    else
        do
            action <- getLine
            case action of
                "atk" -> heroTurn (updateUnit hero (Attack (enemy, hero))) enemy
                "heal" -> heroTurn hero (updateUnit enemy (Heal (enemy)))
                otherwise -> do 
                    putStrLn "Movimento inválido"
                    enemyTurn enemy hero


