extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = GameManager.get_star_color()
	await get_tree().create_timer(randf_range(0.0, 1.0)).timeout
	play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
