extends Node2D


@export var front_offset := Vector2(0, -25)

func _ready() -> void:
	position = front_offset

func _process(delta):
	position = front_offset

func _on_area_entered(otherArea):
	if otherArea.is_in_group("enemy"):
		# destroy enemy 
		otherArea.queue_free()
		GameState.shield_hit.emit()
