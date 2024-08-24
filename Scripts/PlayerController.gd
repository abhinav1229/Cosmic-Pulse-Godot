extends Node
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	print("PlayerController is ready")
	
	#spawn the player in game
	player = preload("res://Scenes/player.tscn").instantiate()
	GameManager.mainNode.call_deferred("add_child", player)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
