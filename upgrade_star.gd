extends Area2D

@export var speed = 200
@export var health = 1
@export var rotation_rate := 1.5

func _process(delta):
	self.position.y += speed * delta
	rotation += rotation_rate * delta
#Make the enemy get destroyed when they hit something
func _on_area_entered(otherArea):
	if otherArea.is_in_group("playerAbilities") or otherArea.is_in_group("player"):
		health -= 1
	# Will remove the enemy when health is at 0
	# when upgrade star is collected emit a signal to tell the player
	if health == 0:
		GameState.upgrade_collected.emit()
		self.queue_free()
