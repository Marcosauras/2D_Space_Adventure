extends Label

func _ready() -> void:
	GameState.current_stats.connect(update_stats)

func update_stats(hp: int, shield: int) -> void:
	text = "HP: %d   |   Shield: %d" % [hp, shield]
