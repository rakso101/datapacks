#gets player position
execute store result score x minimap run data get entity @a[limit=1] Pos[0]
execute store result score y minimap run data get entity @a[limit=1] Pos[2]

function minimap:minimap/map_000