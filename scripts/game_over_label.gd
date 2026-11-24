extends Label

func _ready():
	GameState.game_is_over.connect(game_over)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if self.visible == true and Input.is_action_just_pressed("ui_accept"):
		# reload the scene (restart the game)
		get_tree().reload_current_scene()
		GameState.resetValues()

func game_over():
	self.visible = true
