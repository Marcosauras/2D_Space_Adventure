extends Node

signal game_is_over
signal shield_hit
signal upgrade_collected
signal current_stats (hp: int, shield: int)

var score = 0
var is_game_over = false

func resetValues():
	score = 0
	is_game_over = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
