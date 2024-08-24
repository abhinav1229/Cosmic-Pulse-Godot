extends Node

var STAR_SPAWN_MIN_X = 0
var STAR_SPAWN_MAX_X = 320
var STAR_SPAWN_MIN_Y = 0
var STAR_SPAWN_MAX_Y = 640


# Called when the node enters the scene tree for the first time.
func _ready():
	StarsAnimtionSpawner()

func StarsAnimtionSpawner():
	for i in 5:
		var starAnim = preload("res://Scenes/star_animation.tscn").instantiate();
		get_tree().get_first_node_in_group("StarsAnimCnt").add_child(starAnim)
		starAnim.position = Vector2(randi_range(STAR_SPAWN_MIN_X, STAR_SPAWN_MAX_X), randi_range(STAR_SPAWN_MIN_Y, STAR_SPAWN_MAX_Y))
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
