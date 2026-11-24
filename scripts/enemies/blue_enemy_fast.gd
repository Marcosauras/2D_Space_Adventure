extends Node2D

@export var speed = 400
@export var health = 10
@export var explosion_tscn: PackedScene

var implements = interface.Damageable

func _process(delta):
	self.position.y += speed * delta
	
func take_damage(amount):
	# Subtract the damage received from the enemy's current health
	# Set as variables so that updates can be made more easily
	health -= amount
	if health <= 0:
		var explosion = explosion_tscn.instantiate()
		self.add_sibling(explosion)
		explosion.position = global_position
		explosion.z_index = 100
		
		# GameState stores the score used by the UI
		GameState.score += 10
		self.queue_free()
