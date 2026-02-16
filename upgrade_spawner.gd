extends Node2D

@export var upgrade_tscn: PackedScene
# Called when the node enters the scene tree for the first time.
func summonUpgrade():
	var screenWidth = get_viewport_rect().size.x
	var randomLocation = randf_range(40, screenWidth - 40)
	var newUpgrade = upgrade_tscn.instantiate()
	self.add_sibling(newUpgrade)
	newUpgrade.position.y = -10
	newUpgrade.position.x = randomLocation
