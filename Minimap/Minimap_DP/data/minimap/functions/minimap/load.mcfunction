scoreboard objectives add ui dummy
scoreboard objectives setdisplay sidebar ui
scoreboard objectives add minimap dummy
#this just loads a blank title when you start up because the minimap is being displayed in the subtitle
scoreboard players set m ui 1
scoreboard players set hex minimap 16
execute unless score scale minimap matches 1.. run scoreboard players set scale minimap 1
team add ui_m
team join ui_m m
title @a times 0 1s 0
title @a title ""