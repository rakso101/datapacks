#this converts the players position into a hexadecimal value 
scoreboard players operation xa minimap = x minimap
scoreboard players operation xb minimap = x minimap

scoreboard players operation xa minimap %= hex minimap
scoreboard players operation xb minimap /= hex minimap

execute if score xa minimap matches 0..9 store result storage minimap xa int 1 run scoreboard players get xa minimap
execute if score xa minimap matches 10 run data modify storage minimap xa set value "a"
execute if score xa minimap matches 11 run data modify storage minimap xa set value "b"
execute if score xa minimap matches 12 run data modify storage minimap xa set value "c"
execute if score xa minimap matches 13 run data modify storage minimap xa set value "d"
execute if score xa minimap matches 14 run data modify storage minimap xa set value "e"
execute if score xa minimap matches 15 run data modify storage minimap xa set value "f"

execute if score xb minimap matches 0..9 store result storage minimap xb int 1 run scoreboard players get xb minimap
execute if score xb minimap matches 10 run data modify storage minimap xb set value "a"
execute if score xb minimap matches 11 run data modify storage minimap xb set value "b"
execute if score xb minimap matches 12 run data modify storage minimap xb set value "c"
execute if score xb minimap matches 13 run data modify storage minimap xb set value "d"
execute if score xb minimap matches 14 run data modify storage minimap xb set value "e"
execute if score xb minimap matches 15 run data modify storage minimap xb set value "f"
