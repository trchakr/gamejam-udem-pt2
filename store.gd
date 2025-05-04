extends Node2D

func _ready():
	$storeBar.show()
	$exitButton.pressed.connect(_exitStore)
	
	#$apple.pressed.connect(_appleBuy)

func _exitStore():
	get_tree().change_scene_to_file("res://mainMenu.tscn")
	
func _ABCBuy():
	Global.ABC = true
func _appleBuy():
	Global.apple = true
func _bookcase():
	Global.bookcase = true
func _chair():
	Global.chair = true
func _pencil():
	Global.hbPencil = true
func _math():
	Global.math = true
func _pencilHolder():
	Global.pencilHolder = true
func _plant():
	Global.plant = true
func _stapler():
	Global.stapler = true
func _window():
	Global.window = true
