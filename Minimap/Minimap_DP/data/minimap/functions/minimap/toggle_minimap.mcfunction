#toggles on and clears title
execute if score minimap_on minimap matches 1 run team modify ui_m prefix ""
execute if score minimap_on minimap matches 1 run scoreboard players set minimap_on minimap 2
execute unless score minimap_on minimap matches 1.. run scoreboard players set minimap_on minimap 1
execute if score minimap_on minimap matches 2 run scoreboard players set minimap_on minimap 0