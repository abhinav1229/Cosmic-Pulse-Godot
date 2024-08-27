extends Node

var STAR_SPAWN_MIN_X = -100
var STAR_SPAWN_MAX_X = 420
var STAR_SPAWN_MIN_Y = -200
var STAR_SPAWN_MAX_Y = 840
var MAX_STAR_SPAWN_COUNT = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	stars_animtion_spawner()
	obstacles_spawn()
	
	SignalsManager.new_dark_bg.connect(stars_animtion_spawner)

func stars_animtion_spawner():
	print("new created")
	for i in MAX_STAR_SPAWN_COUNT:
		var starAnim = preload("res://Scenes/star_animation.tscn").instantiate();
		var allDarkBg = get_tree().get_nodes_in_group("StarsAnimCnt")
		allDarkBg[allDarkBg.size() - 1].add_child(starAnim)
		starAnim.position = Vector2(randi_range(STAR_SPAWN_MIN_X, STAR_SPAWN_MAX_X), randi_range(STAR_SPAWN_MIN_Y, STAR_SPAWN_MAX_Y))

func obstacles_spawn():
	for i in 2:
		var obs = preload("res://Scenes/obstacle.tscn").instantiate()
		$"../../ObstaclesContainer".add_child(obs)
	
