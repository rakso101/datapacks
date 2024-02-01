#toggles on and clears title
execute if score minimap_on minimap matches 1 run title @a clear
execute if score minimap_on minimap matches 1 run scoreboard players set minimap_on minimap 0

#toggles on and creates title for subtitle to sit in
execute unless score minimap_on minimap matches 1 run title @a times 0 1000d 0
execute unless score minimap_on minimap matches 1 run title @a title ""
execute unless score minimap_on minimap matches 1 run scoreboard players set minimap_on minimap 1