
#> bhc:scores_calculator/detector/endgame
#
# @within			uhc:in_game/endgame
#
#
# @description		Fin de partie
#

## Distinction du gagnant au classement Survie

scoreboard players add #tick BHC.data 2
scoreboard players operation #team_alive uhc.id.teams = @s uhc.id.teams
execute as @e[type=marker,tag=BHC] if score @s uhc.id.teams = #team_alive uhc.id.teams run scoreboard players set @s BHC.teams.deathcount 0
execute if score #end uhc.game.end matches 1 run function bhc:scores_calculator/detector/death
execute if score #end uhc.game.end matches 1 run function bhc:scores_calculator/scores_internal/death_penalty

## Calcul Classement Final

function bhc:scores_calculator/scores_internal/equality_rules
function bhc:scores_calculator/rank_internal/endgame

## Message et affichage de fin
execute if score #end uhc.game.end matches 1 run scoreboard objectives setdisplay sidebar BHC.Total
execute if score #end uhc.game.end matches 1..2 run execute as @a run tellraw @s [{"text":"","bold":true,"hoverEvent":{"action":"show_text","value":[{"text":"","bold":true},{"text":"SCORES D'ÉQUIPE :","color":"#9F3FFF"},{"text":"\n• ","color":"#9F3FFF"},{"text":"Étape A\n","color":"#BF7FFF"},{"text":"    Points : ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.invStepA"},"color":"#BF7FFF","bold":false},{"text":"\n    Place : ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.CA"},"color":"#BF7FFF","bold":false},{"text":"/","color":"#F3E7FF","bold":false},{"score":{"name":"#Teams","objective":"BHC.data"},"color":"#BF7FFF","bold":false},{"text":" → ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.invSA"},"color":"#9F3FFF"},{"text":" Points","color":"#BF7FFF"},{"text":"\n• ","color":"#9F3FFF"},{"text":"Étape B\n","color":"#BF7FFF"},{"text":"    Points : ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.invStepB"},"color":"#BF7FFF","bold":false},{"text":"\n    Place : ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.CB"},"color":"#BF7FFF","bold":false},{"text":"/","color":"#F3E7FF","bold":false},{"score":{"name":"#Teams","objective":"BHC.data"},"color":"#BF7FFF","bold":false},{"text":" → ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.invSB"},"color":"#9F3FFF"},{"text":" Points","color":"#BF7FFF"},{"text":"\n• ","color":"#9F3FFF"},{"text":"Kills\n","color":"#BF7FFF"},{"text":"    Points : ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.invKills"},"color":"#BF7FFF","bold":false},{"text":"\n    Place : ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.CK"},"color":"#BF7FFF","bold":false},{"text":"/","color":"#F3E7FF","bold":false},{"score":{"name":"#Teams","objective":"BHC.data"},"color":"#BF7FFF","bold":false},{"text":" → ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.invSK"},"color":"#9F3FFF"},{"text":" Points","color":"#BF7FFF"},{"text":"\n• ","color":"#9F3FFF"},{"text":"Survie\n","color":"#BF7FFF"},{"text":"    Points : ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.invDeath"},"color":"#BF7FFF","bold":false},{"text":"\n    Place : ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.CD"},"color":"#BF7FFF","bold":false},{"text":"/","color":"#F3E7FF","bold":false},{"score":{"name":"#Teams","objective":"BHC.data"},"color":"#BF7FFF","bold":false},{"text":" → ","color":"#F3E7FF","bold":false},{"score":{"name":"@s","objective":"BHC.invSD"},"color":"#9F3FFF"},{"text":" Points","color":"#BF7FFF"}]}},{"text":"################################","color":"#9F3FFF","obfuscated":true},{"text":"\n                                                \nPartie terminée !                                \n                                                \n","color":"#BF7FFF"},{"text":"MEILLEURS PERFORMANCES :                ","color":"#9F3FFF"},{"text":"\n• ","color":"#9F3FFF"},{"text":"Étape A                                        \n   ","color":"#BF7FFF"},{"selector":"@e[type=marker,scores={BHC.CA=1}]"},{"text":" : ","color":"#F3E7FF"},{"score":{"name":"#max","objective":"BHC.StepA"},"color":"#BF7FFF"},{"text":" points → ","color":"#F3E7FF"},{"score":{"name":"@e[type=marker,scores={BHC.CA=1},limit=1]","objective":"BHC.invSA"},"color":"#9F3FFF"},{"text":" points    ","color":"#BF7FFF"},{"text":"\n• ","color":"#9F3FFF"},{"text":"Étape B                                        \n   ","color":"#BF7FFF"},{"selector":"@e[type=marker,scores={BHC.CB=1}]"},{"text":" : ","color":"#F3E7FF"},{"score":{"name":"#max","objective":"BHC.StepB"},"color":"#BF7FFF"},{"text":" points → ","color":"#F3E7FF"},{"score":{"name":"@e[type=marker,scores={BHC.CB=1},limit=1]","objective":"BHC.invSB"},"color":"#9F3FFF"},{"text":" points    ","color":"#BF7FFF"},{"text":"\n• ","color":"#9F3FFF"},{"text":"Kills                                        \n   ","color":"#BF7FFF"},{"selector":"@e[type=marker,scores={BHC.CK=1}]"},{"text":" : ","color":"#F3E7FF"},{"score":{"name":"#max","objective":"BHC.Kills"},"color":"#BF7FFF"},{"text":" points → ","color":"#F3E7FF"},{"score":{"name":"@e[type=marker,scores={BHC.CK=1},limit=1]","objective":"BHC.invSK"},"color":"#9F3FFF"},{"text":" points    ","color":"#BF7FFF"},{"text":"\n• ","color":"#9F3FFF"},{"text":"Survie                                        \n   ","color":"#BF7FFF"},{"selector":"@e[type=marker,scores={BHC.CD=1}]"},{"text":" : ","color":"#F3E7FF"},{"score":{"name":"#max","objective":"BHC.Death"},"color":"#BF7FFF"},{"text":" points → ","color":"#F3E7FF"},{"score":{"name":"@e[type=marker,scores={BHC.CD=1},limit=1]","objective":"BHC.invSD"},"color":"#9F3FFF"},{"text":" points    ","color":"#BF7FFF"},{"text":"\n                                                \nVOTRE PERFORMANCE :                        \n","color":"#9F3FFF"},{"text":"Score Total : ","color":"#F3E7FF"},{"score":{"name":"@s","objective":"BHC.invTotal"},"color":"#9F3FFF"},{"text":" (","color":"#F3E7FF"},{"score":{"name":"@s","objective":"BHC.CT"},"color":"#BF7FFF"},{"text":"/","color":"#F3E7FF"},{"score":{"name":"#Teams","objective":"BHC.data"},"color":"#F3E7FF"},{"text":")                        ","color":"#F3E7FF"},{"text":"\nPour plus d'information sur votre performance, passez la souris par dessus ce pavé                        ","color":"#F3E7FF","bold":false},{"text":"\n                                                \nÉQUIPE GAGNANTE :                        \n","color":"#9F3FFF"},{"selector":"@e[type=marker,scores={BHC.CT=1}]"},{"text":" avec ","color":"#F3E7FF","bold":false},{"score":{"name":"@e[type=marker,scores={BHC.CT=1},limit=1]","objective":"BHC.invTotal"},"color":"#9F3FFF"},{"text":" points !                \n                                                \n","color":"#BF7FFF"},{"text":"################################","color":"#9F3FFF","obfuscated":true}]
