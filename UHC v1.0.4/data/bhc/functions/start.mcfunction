
#> bhc:start
#
# @within			uhc:start/2start
#
#
# @description		Collectes et modifs de quelques données au démarrage
#

# Nombre d'équipes en jeu
scoreboard players operation #Teams BHC.data = #Teams uhc.data.setup

# Désactivation starter food
scoreboard players set #StarterFood uhc.data.setup 0
give @a[tag=Joueur] oak_boat

# Reset advancements des joueurs
advancement revoke @a everything

# Sélecteur de collections Mini-Bingos
summon marker 1 0 1 {Tags:["Selector"]}

# Intégration joueurs aux scores BHC
scoreboard players set @a[tag=Joueur] BHC.invStepA 0
scoreboard players set @a[tag=Joueur] BHC.invStepB 0
scoreboard players set @a[tag=Joueur] BHC.invKills 0
scoreboard players set @a[tag=Joueur] BHC.invDeath 0
scoreboard players set @e[type=marker,tag=BHC] BHC.invStepA 0
scoreboard players set @e[type=marker,tag=BHC] BHC.invStepB 0
scoreboard players set @e[type=marker,tag=BHC] BHC.invKills 0
scoreboard players set @e[type=marker,tag=BHC] BHC.invDeath 0
scoreboard players set @a[tag=Joueur] uhc.players.lives 3

scoreboard players set #team uhc.id.teams 0
function bhc:scores_calculator/death/scores
function bhc:scores_calculator/kills/detect
function bhc:scores_calculator/stepa/rank
function bhc:scores_calculator/stepb/rank

# Config BHC
execute if score #scenario BHC.scenario matches 0 run function bhc:00/timer/config
execute if score #scenario BHC.scenario matches 1 run function bhc:01/timer/config
execute if score #scenario BHC.scenario matches 2 run function bhc:02/timer/config
execute if score #scenario BHC.scenario matches 3 run function bhc:03/timer/config
execute if score #scenario BHC.scenario matches 4 run function bhc:04/timer/config
execute if score #scenario BHC.scenario matches 5 run function bhc:05/timer/config
execute if score #scenario BHC.scenario matches 6 run function bhc:06/timer/config
execute if score #scenario BHC.scenario matches 7 run function bhc:07/timer/config
execute if score #scenario BHC.scenario matches 8 run function bhc:08/timer/config
execute if score #scenario BHC.scenario matches 9 run function bhc:09/timer/config

# Annulation des effets causés par le passage de la minute -1 à 0
scoreboard players add #vie3 BHC.timer 1
scoreboard players add #vie2 BHC.timer 1
scoreboard players add #vie1 BHC.timer 1
scoreboard players remove #start_stepa BHC.timer 1
scoreboard players remove #start_stepb BHC.timer 1

