extends Node2D

var speed = 200  # Speed of the node
var rotation_speed = 0.05  # Rotation speed factor

# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.ZERO

	# Arrow keys
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
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

		# Apply rotation based on the movement direction
		rotation = direction.angle() * rotation_speed

	# Update the position
	position += direction * speed * delta
