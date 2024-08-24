extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var dark_bg = preload("res://Scenes/bg_main.tscn").instantiate()
	add_child(dark_bg)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
