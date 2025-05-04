extends Sprite2D

func _ready():
	show()
	
	add_child($hint1_1)
	$hint1_1.pressed.connect(_hint1_1)
	
	add_child($hint1_2)
	$hint1_2.pressed.connect(_hint1_2)
	
	add_child($hint1_3)
	$hint1_3.pressed.connect(_hint1_3)
	
	add_child($hint1_4)
	$hint1_4.pressed.connect(_hint1_4)
	
	add_child($hint1_5)
	$hint1_5.pressed.connect(_hint1_5)

	
func _hint1_1():
	print("connect")
	$Label1_1.show()
func _hint1_2():
	$Label1_1.show()
func _hint1_3():
	$Label1_3.show()
func _hint1_4():
	$Label1_4.show()
func _hint1_5():
	$Label1_5.show()
