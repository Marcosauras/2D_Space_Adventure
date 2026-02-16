extends Node2D

@export var fast_enemy_tscn: PackedScene
@export var basic_enemy_tscn: PackedScene
@export var spacing:float = 80



# might add stuff to switch between spawning one or the other and not both at the same time

func spawnBasicEnemyShip():
	var screenWidth = get_viewport_rect().size.x
	var randomLocation = randf_range(40, screenWidth - 40)
	var groupSize = randf_range(1,4)
	var spawningSpace = (groupSize - 1) * spacing
	var wallSpacing = screenWidth - 20 - spawningSpace
	var baseX = randf_range(20, wallSpacing)
	# spawn enemy ship when timer clicks (1 sec default)
	for i in range(groupSize):
		var newEnemy = basic_enemy_tscn.instantiate()
		self.add_child(newEnemy)
		newEnemy.position.y = -10
		newEnemy.position.x = (baseX + i * spacing)
		
func spawnFastEnemyShip():	
	var screenWidth = get_viewport_rect().size.x
	var randomLocation = randf_range(40, screenWidth - 40)
	var groupSize = randf_range(1,4)
	var spawningSpace = (groupSize - 1) * spacing
	var wallSpacing = screenWidth - 20 - spawningSpace
	var baseX = randf_range(20, wallSpacing)
	# spawn enemy ship when timer clicks (1 sec default)
	for i in range(groupSize):
		var newEnemy = fast_enemy_tscn.instantiate()
		self.add_child(newEnemy)
		newEnemy.position.y = -10
		newEnemy.position.x = (baseX + i * spacing)
