extends Node2D

func _ready():
	$storeBar.show()
	$exitButton.pressed.connect(_exitStore)

func _exitStore():
	get_tree().change_scene_to_file("res://mainMenu.tscn")
