extends Node2D

# We'll find the nodes more carefully
var scroll_container
var item_container

func _ready():
	$storeBar.show()
	$exitButton.pressed.connect(_exitStore)
	$ABCBuy.pressed.connect(_ABCBuy)
	
	$storeBar/HBoxContainer/apple.pressed.connect(_appleBuy)
	$storeBar/HBoxContainer/ABC.pressed.connect(_ABC)
	$storeBar/HBoxContainer/bookcase.pressed.connect(_bookcase)
	$storeBar/HBoxContainer/chair.pressed.connect(_chair)
	$storeBar/HBoxContainer/pencil.pressed.connect(_pencil)
	$storeBar/HBoxContainer/math.pressed.connect(_math)
	$storeBar/HBoxContainer/pencilHolder.pressed.connect(_pencilHolder)
	$storeBar/HBoxContainer/plant.pressed.connect(_plant)
	$storeBar/HBoxContainer/stapler.pressed.connect(_stapler)
	$storeBar/HBoxContainer/window.pressed.connect(_window)

func _exitStore():
	get_tree().change_scene_to_file("res://mainMenu.tscn")


# Purchase functions 
func _ABC():
	if $storeBar/HBoxContainer/ABC.button_pressed == true:
		print("pressed")
		$ABCBuy.show()
		$abcd.show()
	else:
		$ABCBuy.hide()
		$abcd.hide()

func _ABCBuy():
	if can_afford(price_for("ABC")):
		Global.cash -= price_for("ABC")
		Global.ABC = true
			
func _appleBuy():
	print("apple!")
	if can_afford(price_for("apple")):
		Global.cash -= price_for("apple")
		Global.apple = true

func _bookcase():
	if can_afford(price_for("bookcase")):
		Global.cash -= price_for("bookcase")
		Global.bookcase = true

func _chair():
	if can_afford(price_for("chair")):
		Global.cash -= price_for("chair")
		Global.chair = true

func _pencil():
	if can_afford(price_for("pencil")):
		Global.cash -= price_for("pencil")
		Global.hbPencil = true

func _math():
	if can_afford(price_for("math")):
		Global.cash -= price_for("math")
		Global.math = true

func _pencilHolder():
	if can_afford(price_for("pencilHolder")):
		Global.cash -= price_for("pencilHolder")
		Global.pencilHolder = true

func _plant():
	if can_afford(price_for("plant")):
		Global.cash -= price_for("plant")
		Global.plant = true

func _stapler():
	if can_afford(price_for("stapler")):
		Global.cash -= price_for("stapler")
		Global.stapler = true

func _window():
	if can_afford(price_for("window")):
		Global.cash -= price_for("window")
		Global.window = true
# Helper function to check if player can afford an item
func can_afford(price):
	return Global.cash >= price

# Helper function to get the price for each item
func price_for(item_name):
	match item_name:
		"apple": return 100
		"ABC": return 200
		"bookcase": return 300
		"chair": return 250
		"pencil": return 50
		"math": return 150
		"pencilHolder": return 100
		"plant": return 200
		"stapler": return 75
		"window": return 400
		_: return 0
