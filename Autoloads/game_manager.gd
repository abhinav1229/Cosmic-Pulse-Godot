extends Node

# Global variables
var score: int = 0
var player_health: int = 100
var game_state: String = "menu"  # Possible states: "menu", "playing", "paused", "game_over"

# Constants for easy reference
const MAX_HEALTH = 100
const GAME_OVER_HEALTH_THRESHOLD = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize the game state when the game starts
	reset_game()

# Function to start the game
func start_game():
	score = 0
	player_health = MAX_HEALTH
	game_state = "playing"
	print("Game started")
	# Notify other scenes or nodes that the game has started (optional)
	# emit_signal("game_started")

# Function to pause the game
func pause_game():
	if game_state == "playing":
		game_state = "paused"
		print("Game paused")
		# Optionally pause all other processes or animations

# Function to resume the game
func resume_game():
	if game_state == "paused":
		game_state = "playing"
		print("Game resumed")
		# Optionally resume all other processes or animations

# Function to end the game
func end_game():
	game_state = "game_over"
	print("Game over")
	# Notify other scenes or nodes that the game has ended (optional)
	# emit_signal("game_over")

# Function to increase the player's score
func increase_score(amount: int):
	score += amount
	print("Score increased by %d. Total score: %d" % [amount, score])

# Function to decrease the player's health
func decrease_health(amount: int):
	player_health -= amount
	if player_health <= GAME_OVER_HEALTH_THRESHOLD:
		player_health = 0
		end_game()
	print("Health decreased by %d. Remaining health: %d" % [amount, player_health])

# Function to reset the game state
func reset_game():
	score = 0
	player_health = MAX_HEALTH
	game_state = "menu"
	print("Game reset to initial state")

# Function to get the current score
func get_score() -> int:
	return score

# Function to get the player's current health
func get_player_health() -> int:
	return player_health

# Function to get the current game state
func get_game_state() -> String:
	return game_state
