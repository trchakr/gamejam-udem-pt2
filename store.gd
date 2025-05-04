extends Node2D

func _ready():
	$storeBar.show()
	$exitButton.pressed.connect(_exitStore)
	$appleBuy.pressed.connect(_appleBuy)
	$ABCBuy.pressed.connect(_ABCBuy)
	$bookcaseBuy.pressed.connect(_bookcaseBuy)
	$chairBuy.pressed.connect(_chairBuy)
	$pencilBuy.pressed.connect(_pencilBuy)
	$mathBuy.pressed.connect(_mathBuy)
	$plantBuy.pressed.connect(_plantBuy)
	
	$storeBar/HBoxContainer/apple.pressed.connect(_apple)
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
		$ABCBuy.show()
		$abcd.show()
	else:
		$ABCBuy.hide()
		$abcd.hide()

func _ABCBuy():
	if can_afford(price_for("ABC")):
		Global.cash -= price_for("ABC")
		Global.ABC = true

func _apple():
	if $storeBar/HBoxContainer/apple.button_pressed == true:
		$appleBuy.show()
		$apple.show()
	else:
		$appleBuy.hide()
		$apple.hide()
			
func _appleBuy():
	if can_afford(price_for("apple")):
		Global.cash -= price_for("apple")
		Global.apple = true



func _bookcase():
	if $storeBar/HBoxContainer/bookcase.button_pressed == true:
		$bookcaseBuy.show()
		$bookcase.show()
	else:
		$bookcaseBuy.hide()
		$bookcase.hide()

func _bookcaseBuy():
	if can_afford(price_for("bookcase")):
		Global.cash -= price_for("bookcase")
		Global.bookcase = true



func _chair():
	if $storeBar/HBoxContainer/chair.button_pressed == true:
		$chairBuy.show()
		$chair.show()
	else:
		$chairBuy.hide()
		$chair.hide()
		
func _chairBuy():
	if can_afford(price_for("chair")):
		Global.cash -= price_for("chair")
		Global.chair = true
	

func _pencil():
	if $storeBar/HBoxContainer/pencil.button_pressed == true:
		$pencilBuy.show()
		$pencil.show()
	else:
		$pencilBuy.hide()
		$pencil.hide()

func _pencilBuy():
	if can_afford(price_for("pencil")):
		Global.cash -= price_for("pencil")
		Global.hbPencil = true


func _mathBuy():
	if $storeBar/HBoxContainer/math.button_pressed == true:
		$mathBuy.show()
		$math.show()
	else:
		$mathBuy.hide()
		$math.hide()

func _math():
	if can_afford(price_for("math")):
		Global.cash -= price_for("math")
		Global.math = true


func _pencilHolder():
	if $storeBar/HBoxContainer/pencilHolder.button_pressed == true:
		$pencilHolderBuy.show()
		$pencilHolder.show()
	else:
		$pencilHolderBuy.hide()
		$pencilHolder.hide()
		
func _pencilHolderBuy():
	if can_afford(price_for("pencilHolder")):
		Global.cash -= price_for("pencilHolder")
		Global.pencilHolder = true


func _plant():
	if $storeBar/HBoxContainer/plant.button_pressed == true:
		$plantBuy.show()
		$pottedPlant.show()
	else:
		$plantBuy.hide()
		$pottedPlant.hide()
	
func _plantBuy():
	if can_afford(price_for("plant")):
		Global.cash -= price_for("plant")
		Global.plant = true


func _stapler():
	if $storeBar/HBoxContainer/stapler.button_pressed == true:
		$staplerBuy.show()
		$stapler.show()
	else:
		$staplerBuy.hide()
		$stapler.hide()

func _staplerBuy():
	if can_afford(price_for("stapler")):
		Global.cash -= price_for("stapler")
		Global.stapler = true



func _window():
	if $storeBar/HBoxContainer/window.button_pressed == true:
		$windowBuy.show()
		$window.show()
	else:
		$windowBuy.hide()
		$window.hide()

func _windowBuy():
	if can_afford(price_for("window")):
		Global.cash -= price_for("window")
		Global.window = true
# Helper function to check if player can afford an item
func can_afford(price):
	return Global.cash >= price

# Helper function to get the price for each item
func price_for(item_name):
	match item_name:
		"apple": return 250
		"ABC": return 500
		"bookcase": return 1000
		"chair": return 500
		"pencil": return 250
		"math": return 2000
		"pencilHolder": return 500
		"plant": return 750
		"stapler": return 500
		"window": return 1000
		_: return 0
