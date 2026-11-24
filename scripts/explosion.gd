extends Node2D

@onready var particles: CPUParticles2D = $CPUParticles2D
@onready var explosion_SFX = $Explosion_SFX

func _ready() -> void:
	explosion_SFX.play()
	particles.emitting = true
	# wait for the burst to finish
	await get_tree().create_timer(particles.lifetime + 0.1).timeout
	queue_free()
