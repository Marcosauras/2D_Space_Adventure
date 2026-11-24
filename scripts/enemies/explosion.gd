extends Node2D

@onready var particles: CPUParticles2D = $CPUParticles2D
@onready var explosion_SFX = $Explosion_SFX

func _ready() -> void:
	# Play the explosion sound and start emitting particles
	explosion_SFX.play()
	particles.emitting = true
	# Wait for the particles to finish their lifetime
	# Add a small delay to ensure the effect finishes before removal
	await get_tree().create_timer(particles.lifetime + 0.1).timeout
	queue_free()
