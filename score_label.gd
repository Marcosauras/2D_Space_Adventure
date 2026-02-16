extends Label

func _process(delta):
	# Checks the score in the global variable and displays on screen
	self.text = "Score: " + str(GameState.score)
