extends Node2D
@onready var spaceship = $Spaceship

var speed = 200  # Speed of the node
var rotation_speed = 0.05  # Rotation speed factor
var extreme_point = 150.0
const TOLERANCE = 1.0 # Define a small tolerance va

signal reach_at_extreme()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.ZERO
	
	if position.y > 490 and Input.is_action_pressed("ui_down"):
		return
		
	if Input.is_action_pressed("ui_left") and position.x < 40:
#		spaceship.position.x -= speed * delta
		return
		
	if Input.is_action_pressed("ui_right") and position.x > 325:
#		spaceship.position.x += speed * delta
		return
	
#	print(int(position.y), " | ", int(extreme_point))
	if position.y < extreme_point:
		extreme_point -= 300
		print("Reached to extreme point: ", extreme_point)
		SignalsManager.BackgroundSpawn()

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
		
#	print(position)

	# Normalize the direction to avoid faster diagonal movement
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		
	# Update the position
	position += direction * speed * delta
