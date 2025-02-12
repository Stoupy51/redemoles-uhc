
#> bhc:00/bingo_stepa/column
#
# @within			bhc:advancements/stepa
#
#
# @description		Ajout de points
#

# Ajout de points au joueur et à l'équipe
scoreboard players add @s bhc.invStepA 2
scoreboard players operation @e[type=marker,tag=BHC,predicate=uhc:id_teams] bhc.invStepA /= #1m bhc.data
scoreboard players add @e[type=marker,tag=BHC,predicate=uhc:id_teams] bhc.invStepA 2
scoreboard players operation @e[type=marker,tag=BHC,predicate=uhc:id_teams] bhc.invStepA *= #1m bhc.data
scoreboard players add @e[type=marker,tag=BHC] bhc.invStepA 1

# Récompenses
execute if score #total_first_column bhc.data matches 1 run give @s minecraft:diamond 2
give @s minecraft:diamond 2
experience add @s 1 levels
