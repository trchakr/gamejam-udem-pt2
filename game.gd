extends Node2D
var score = 5

# Load the custom images for the mouse cursor.
@onready
var arrow = load("res://images/highlighter.png")


func _ready():
	$background.show()
	_page_show(Global.document)
	add_child($gameExit)
	$gameExit.pressed.connect(_exitGame)
	Input.set_custom_mouse_cursor(arrow)

	
func _exitGame():
	var score = 5
	get_tree().change_scene_to_file("res://main.tscn")
	

func _page_show(x):
	match Global.document:
		1:
			$page1.show() # (demarche eval)
			if (x + 2) == 1:
				x += 1
				_page_show(x)
		2:
			$page2.show() # (eval_norm)
			
func _on_text_submitted(new_text: String) -> void:
	match Global.document:
		1:
			if new_text.naturalnocasecmp_to("DÉMARCHE ÉVALUATIVE")==0:
				_correct()
			else:
				_incorrect()
				
		2:  
			if new_text.naturalnocasecmp_to("EVALUATION NORMATIVE")==0:
				_correct()
			else:
				_incorrect()
				
	
func _correct():
	print(score, "correct")
	if score < 0:
		score = 0   # fix negative
	
	Global.cash += score * 100 # reward gold
	score = 5                  # reset score
	$reward.text = ("Correct! +" + str(Global.cash))
	$reward.show()
	$rewardTimer.start()
	
	match Global.document:
		1:
			$page1.hide()
		2:
			$page2.hide()
	Global.document += 1
	_page_show(Global.document)
	print (Global.document)
	
func _incorrect():
	print(score, "incorrect")
	score -= 1
	$reward.text = ("Incorrect! -100")
	$reward.show()
	$rewardTimer.start()
	
func _on_reward_timeout():
	$reward.hide()
	
	
