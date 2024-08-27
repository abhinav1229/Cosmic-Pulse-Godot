extends Node

signal new_dark_bg()

func BackgroundSpawn():
	print("Spawing new background")
	emit_signal("new_dark_bg")
