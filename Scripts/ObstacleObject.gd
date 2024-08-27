extends Node2D

@export var obstacle = Obstacle.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	obstacle.health = randi_range(100, 200)
