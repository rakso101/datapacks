#this converts the players position into a hexadecimal value 
scoreboard players operation ya minimap = y minimap
scoreboard players operation yb minimap = y minimap

scoreboard players operation ya minimap %= hex minimap
scoreboard players operation yb minimap /= hex minimap

execute if score ya minimap matches 0..9 store result storage minimap ya int 1 run scoreboard players get ya minimap
execute if score ya minimap matches 10 run data modify storage minimap ya set value "a"
execute if score ya minimap matches 11 run data modify storage minimap ya set value "b"
execute if score ya minimap matches 12 run data modify storage minimap ya set value "c"
execute if score ya minimap matches 13 run data modify storage minimap ya set value "d"
execute if score ya minimap matches 14 run data modify storage minimap ya set value "e"
execute if score ya minimap matches 15 run data modify storage minimap ya set value "f"

execute if score yb minimap matches 0..9 store result storage minimap yb int 1 run scoreboard players get yb minimap
execute if score yb minimap matches 10 run data modify storage minimap yb set value "a"
execute if score yb minimap matches 11 run data modify storage minimap yb set value "b"
execute if score yb minimap matches 12 run data modify storage minimap yb set value "c"
execute if score yb minimap matches 13 run data modify storage minimap yb set value "d"
execute if score yb minimap matches 14 run data modify storage minimap yb set value "e"
execute if score yb minimap matches 15 run data modify storage minimap yb set value "f"
