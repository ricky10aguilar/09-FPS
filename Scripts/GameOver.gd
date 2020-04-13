extends Node2D

onready var playagain = get_node("res://Scenes/Game.tscn")



func _unhandled_input(event):
	if Input.is_action_pressed("jump"):
		get_tree().change_scene("res://Scenes/Game.tscn")
	if Input.is_action_pressed("quit"):
		get_tree().quit()
