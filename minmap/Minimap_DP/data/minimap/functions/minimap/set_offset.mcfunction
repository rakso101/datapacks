#sets players current pos as the x and y 0 point
execute store result score x_offset minimap run data get entity @a[limit=1] Pos[0]
execute store result score y_offset minimap run data get entity @a[limit=1] Pos[2]