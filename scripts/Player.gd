extends Node2D

@export var laser_tscn: PackedScene
@export var playerHealth = 3

# shield feature vars
@export var shield_tscn: PackedScene
@export var shieldFrontOffset := Vector2(0, -5)
var shield_node: Area2D = null

@export var laserUpgrade = 0
@export var shieldUpgrade = 0
@export var laserSpacing = 20
@export var maxLaser = 4
@export var maxSheild = 3

@onready var laser_SFX = $LaserSFX
@onready var shield_up_SFX = $ShieldUpSFX
@onready var shield_down_SFX = $ShieldDownSFX

func _ready():
	GameState.upgrade_collected.connect(_on_upgrade_collected)
	GameState.shield_hit.connect(_on_shield_hit)
	# emit the stats for the label
	GameState.current_stats.emit(playerHealth, shieldUpgrade)
	update_shield()
	
# the function process is a built in function that runs every moment of the game
func _process(delta):
	GameState.current_stats.emit(playerHealth, shieldUpgrade)
	# sets the location of the ship to the mouse location (Only X axis)
	var mouse_pos = get_global_mouse_position()
	self.position.x = mouse_pos.x
	
	# Spawn a laser everytime a player clicks (left click default)
	if Input.is_action_just_pressed("fireLaser"):
		laser_SFX.play()
		fire_laser()
		
func fire_laser():
		# if player has an upgrade shoot more laser
		var numOfLasers = laserUpgrade + 1
		var start_offset = -((numOfLasers - 1) * laserSpacing) / 2.0
		for i in range(numOfLasers):
			var laser = laser_tscn.instantiate()
			self.add_sibling(laser)

			var offset = start_offset + i * laserSpacing
			laser.position = self.position + Vector2(offset, 0)

func _on_area_entered(otherArea):
	if otherArea.is_in_group("enemy"):
		playerHealth -= 1
		GameState.current_stats.emit(playerHealth, shieldUpgrade)
		if playerHealth <= 0:
			self.queue_free()
			GameState.game_is_over.emit()

func _on_upgrade_collected():
	# decides if it's a sheild or laser
	var randomNum = randi_range(1, 2)
	
	# 1 for laser upgrade and 2 for sheild upgrade.
	if randomNum == 1 and laserUpgrade < maxLaser:
		laserUpgrade += 1
		return
	
	# if laser upgrade is max upgrade sheild
	if randomNum == 1 and shieldUpgrade < maxSheild:
		shieldUpgrade += 1
		update_shield()
		return
		
	if randomNum == 2 and shieldUpgrade < maxSheild:
		shieldUpgrade += 1
		update_shield()
		return
	
	# if sheild upgrade is max upgrade laser
	if randomNum == 2 and laserUpgrade < maxLaser:
		laserUpgrade += 1
		return

# removes the sheild from the screen if it is destoryed and creates it when needed
func update_shield():
	GameState.current_stats.emit(playerHealth, shieldUpgrade)
	# remove the shield if there are no charges
	if shieldUpgrade <= 0:
		shield_down_SFX.play()
		if shield_node != null:
			shield_node.queue_free()
			shield_node = null
		return

	# if sheild charges exist keep sheild
	if shield_node == null:
		shield_up_SFX.play()
		shield_node = shield_tscn.instantiate()
		add_child(shield_node)
		shield_node.front_offset = shieldFrontOffset
		shield_node.z_index = 10

func _on_shield_hit():
	print("Shield hit")
	shieldUpgrade -= 1
	GameState.current_stats.emit(playerHealth, shieldUpgrade)
	update_shield()
