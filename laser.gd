extends Node2D

@export var speed = 240 # pixels per sec that is to be moved (make sure to * by delta to make framerate indepedant)
@export var damageAmount = 5
func _process(delta):
	self.position.y -= speed * delta
	if self.position.y == -200:
		self.queue_free()

func _on_area_entered(otherArea):
	# If enemy gets hit, or if it's too far off the viewpoint.
	if otherArea.is_in_group("enemy") or otherArea.is_in_group("upgrades"):
		self.queue_free()
		
	if "implements" in otherArea:
		if otherArea.implements == interface.Damageable:
	#if otherArea.has_method("take_damage"):
			otherArea.take_damage(self.damageAmount)


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	self.queue_free()
