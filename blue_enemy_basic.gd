extends Node2D

@export var speed = 200
@export var health = 10
@export var explosion_tscn: PackedScene

var implements = interface.Damageable

func _process(delta):
	self.position.y += speed * delta
#Make the enemy get destroyed when they hit something
func _on_area_entered(otherArea):
	pass
	
func take_damage(amount):
	health -= amount
	if health <= 0:
		var explosion = explosion_tscn.instantiate()
		self.add_sibling(explosion)
		explosion.position = global_position
		explosion.z_index = 100

		GameState.score += 10
		self.queue_free()
