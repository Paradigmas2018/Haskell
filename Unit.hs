
{-Module      : Unit
Description : 
Modulo para controle de unidades como criação, e alteração dos atributos durante o jogo;
-}

module Unit
(
  Unit(..),
  Class(..),
  Attributes(..),
  showUnit,
  createUnit,
  setName,
  setHP,
  setClass,
  setAttack,
  setDefense,
  setSpeed,
  getName,
  getClass,
  getHP,
  getMaxHP,
  getAttack,
  getDefense,
  getSpeed,
  isDead
) where


type UnitName = String -- Nome da Unidade
type HP = Int -- Pontos de vida atual
type MaxHP = Int -- Pontos de vida Maximo
type Attack = Int -- Pontos de ataque
type Defense = Int -- Pontos de defesa
type Speed = Int -- Pontos de Velocidade
type IsDead = Bool -- Verificador se a unidade está viva
type IsPlayer = Bool -- Verifica se é controlada pelo jogador
data Class = Archer | Warrior | Wizard deriving (Show, Read, Eq) -- Classe da unidade, para determinar habilidade
data Attributes = Attributes (HP, MaxHP, Attack, Defense, Speed) deriving (Show, Read, Eq)  -- Representação de todos atributos em uma tupla
data Unit = Null | DeadUnit | Unit (UnitName, Class, Attributes, IsDead, IsPlayer)  deriving (Show, Read, Eq) -- Dados da Unidade

showUnit :: Unit -> [Char]
showUnit (Unit (name, clas, Attributes (hp, maxhp, atk, def, spd), dead, player)) = do
  (name) ++","++ 
    (show clas)  ++","++  
      (show hp) ++","++
        (show maxhp) ++","++
          (show atk) ++","++
            (show def) ++","++
              (show spd) ++","++
                (show dead) ++","++ 
                  (show player)

-- Retorna o nome da Unidade
getName :: Unit -> String
getName (Unit ("", _, _, _, _)) = "unknown"
getName (Unit (name, Archer, _, _, _)) = name ++ ", o arqueiro"
getName (Unit (name, Warrior, _, _, _)) = name ++ ", o guerreiro"
getName (Unit (name, Wizard, _, _, _)) = name ++ ", o mago"

getClass :: Unit -> Class
getClass (Unit (_, cls, _, _, _)) = cls

setName :: Unit -> String -> Unit
setName (Unit (name, clas, (Attributes (hp, maxHP, atk, def, spd)), dead, player)) newName = (Unit (newName, clas, Attributes (hp, maxHP, atk, def, spd), dead, player))

setClass :: Unit -> Class -> Unit
setClass (Unit (name, clas, (Attributes (hp, maxHP, atk, def, spd)), dead, player)) newClass = (Unit (name, newClass, Attributes (hp, maxHP, atk, def, spd), dead, player))


-- Retorna o HP atual da unidade
getHP :: Unit -> Int
getHP (Unit (_, _, Attributes (hp, _, _, _, _), _, _)) = hp

-- Retorna o HP maximo da unidade
getMaxHP :: Unit -> Int
getMaxHP (Unit (_, _, Attributes (_, maxHP, _, _, _), _, _)) = maxHP

-- Retorna os pontos de ataque atual da unidade
getAttack :: Unit -> Int
getAttack (Unit (_, _, Attributes (_, _, atk, _, _), _, _)) = atk

-- Retorna os pontos de defesa atual da unidade
getDefense :: Unit -> Int
getDefense (Unit (_, _, Attributes (_, _, _, def, _), _, _)) = def

-- Retorna os pontos de velocidade atual da unidade
getSpeed :: Unit -> Int
getSpeed (Unit (_, _, Attributes (_, _, _, _, spd), _, _)) = spd

-- Dado os atributos, uma nova unidade é criada
createUnit :: UnitName -> Class -> HP -> Attack -> Defense -> Speed -> IsPlayer -> Unit
createUnit unitName clas maxHP atk def spd player = (Unit (unitName, clas, (Attributes (maxHP, maxHP, atk, def, spd)), False, player))

-- Dado uma unidade e os pontos de vida, uma nova unidade é retornada com os pontos de vida atualizados
setHP :: Unit -> Int -> Unit
setHP (Unit (name, clas, (Attributes (oldHP, maxHP, atk, def, spd)), dead, player)) newHP = (Unit (name, clas, Attributes (newHP, maxHP, atk, def, spd), dead, player))

-- Dado uma unidade e os pontos de ataque, uma nova unidade é retornada com os pontos de ataque atualizados
setAttack :: Unit -> Int -> Unit
setAttack (Unit ( name, clas, (Attributes (hp,maxHP, oldAtk, def, spd)), dead, player)) newAtk = (Unit ( name, clas, Attributes (hp,maxHP, newAtk, def, spd), dead, player))

-- Dado uma unidade e os pontos de defesa, uma nova unidade é retornada com os pontos de defesa atualizados
setDefense :: Unit -> Int -> Unit
setDefense (Unit ( name, clas, (Attributes (hp,maxHP, atk, oldDef, spd)), dead, player)) newDef = (Unit ( name, clas, Attributes (hp,maxHP, atk, newDef, spd), dead, player))

-- Dado uma unidade e os pontos de velocidade, uma nova unidade é retornada com os pontos de velocidade atualizados
setSpeed :: Unit -> Int -> Unit
setSpeed (Unit (name, clas, (Attributes (hp,maxHP, atk, def, oldSpd)), dead, player)) newSpd = (Unit (name, clas, Attributes (hp,maxHP, atk, def, newSpd), dead, player))

isDead :: Unit -> Bool
isDead unit = if (getHP unit) <= 0 then True else False
