extends Node

# Global variables
var mainNode:Node2D = null
var score: int = 0
var player_health: int = 100
var game_state: String = "menu"  

# Constants for easy reference
const MAX_HEALTH = 100
const GAME_OVER_HEALTH_THRESHOLD = 0

const star_animation_colors = [Color.INDIAN_RED, Color.AQUAMARINE, Color.YELLOW, Color.WHITE, Color.CORNFLOWER_BLUE, Color.DARK_MAGENTA]

func _ready():
	mainNode = get_tree().get_first_node_in_group("mainNode")
	
func get_star_color() -> Color:
	var rand = randi_range(0, star_animation_colors.size() - 1)
	var color = star_animation_colors[rand]
	var alpha_for_stars = randf_range(0.25, 0.65)
	return Color(color.r, color.g, color.b, alpha_for_stars)
	
func spawn_scene(scene_name: String, parent = null):
	var scene_path = "res://Scenes/" + scene_name + ".tscn"
	var scene = load(scene_path).instantiate()
	if scene != null:
		if parent != null:
			parent.add_child(scene)
		return scene
	else:
		print("Failed to load the scene: ", scene_name)
		
	return null

