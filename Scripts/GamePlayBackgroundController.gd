extends Node2D

var bg_position_y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	create_new_background()
	SignalsManager.new_dark_bg.connect(create_new_background)
	
func create_new_background():
	var scene = GameManager.spawn_scene("bg_main", self)
	scene.position.y = bg_position_y
	bg_position_y -= 1000.0
