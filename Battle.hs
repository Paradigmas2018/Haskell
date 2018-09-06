module Battle where

import Unit

data Action = Attack (Unit, Unit) | Heal (Unit)

actionValue :: Action -> Int
actionValue (Attack (hero, enemy)) 
    | getClass hero == Archer && getClass enemy == Warrior = -(((attack*speed)/10) + defense) * boostDown
    | getClass hero == Archer && getClass enemy == Wizard = -(((attack*speed)/10) + defense) * boostUp
    | getClass hero == Wizard && getClass enemy == Archer = -(((attack*speed)/10) + defense) * boostDown
    | getClass hero == Wizard && getClass enemy == Warrior = -(((attack*speed)/10) + defense) * boostUp
    | getClass hero == Warrior && getClass enemy == Wizard = -(((attack*speed)/10) + defense) * boostDown
    | getClass hero == Warrior && getClass enemy == Archer = -(((attack*speed)/10) + defense) * boostUp
    | otherwise = -((attack*speed)/10) + defense
    where attack  = getAttack hero
          speed   = getSpeed hero
          defense = (getDefense enemy) % 2
          boostUp = 1.1
          boostDown = 0.9
actionValue (Heal (unit)) = (if (hp + potion) >= maxHP then maxHP-hp else potion)
    where hp = getHP unit
          maxHP = getMaxHP unit
          potion = div (getMaxHP unit) 3


updateUnit :: Unit -> Action -> Unit 
updateUnit unit action = health + effect
    where effect = actionValue action
          health = getHealth unit

heroTurn :: Unit -> Unit -> IO()
heroTurn hero enemy = do
    action = getLine
    if isDead(hero) = return ()
    else
        case action of
            "atk" <- enemy = updateUnit hero (Attack (hero, enemy))
            "heal" <- hero = 
    enemyTurn 




