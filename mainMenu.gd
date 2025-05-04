extends Node2D

func _process(delta):
	$Cash.text =  str(Global.cash)+ "$"

func _ready():
	Input.set_custom_mouse_cursor(null)
	show()
	if Global.abcd == false:
		$abcd.hide()
	if Global.apple == false:
		$apple.hide()
	if Global.bookcase == false:
		$bookcase.hide()
	if Global.chair == false:
		$chair.hide()
	if Global.math == false:
		$math.hide()
	if Global.pencilHolder == false:
		$pencilHolder.hide()
	if Global.pottedPlant == false:
		$pottedPlant.hide()
	if Global.stapler == false:
		$stapler.hide()
	if Global.window == false:
		$window.hide()
	
	add_child($startButton)
	$startButton.pressed.connect(_startGame)
	
	add_child($storeButton)
	$storeButton.pressed.connect(_openStore)

	
func _startGame():
	get_tree().change_scene_to_file("res://game.tscn")

func _openStore():
	get_tree().change_scene_to_file("res://store.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_store_button_pressed() -> void:
	$"select sound".play()

func _on_store_button_mouse_entered() -> void:
	$"hover sound".play()

func _on_start_button_pressed() -> void:
	$"select sound".play()

func _on_start_button_mouse_entered() -> void:
	$"hover sound".play()


func _on_exit_button_mouse_entered() -> void:
	$"hover sound".play()
