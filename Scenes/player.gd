extends Node2D

var speed = 200  # Speed of the node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.ZERO

	# Arrow keys
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		rotate(0.2)
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	# WASD keys
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1

	# Normalize the direction to avoid faster diagonal movement
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Update the position
	position += direction * speed * delta
