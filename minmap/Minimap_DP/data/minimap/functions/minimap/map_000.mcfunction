#Converts the players scoreboard position into hex
scoreboard players operation x minimap -= x_offset minimap
#y was inverted in the so it has to be inverted here too
scoreboard players operation y minimap += y_offset minimap
execute if score x minimap matches 0..255 run function minimap:minimap/calculate_hex_x
execute if score y minimap matches 0..255 run function minimap:minimap/calculate_hex_y



#Runs a macro that puts the hex values into a title command
function minimap:minimap/map_001 with storage minimap
