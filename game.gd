extends Node2D

var score = 5

# Load the custom images for the mouse cursor.
@onready var arrow = load("res://images/highlighter.png")

func _ready():
	# Hide all pages first
	hide_all_pages()
	
	$background.show()
	page_show(Global.document)
	
	# No need to add_child to nodes that are already in the scene tree
	$gameExit.pressed.connect(_exitGame)
	$gameRestart.pressed.connect(_restartGame)
	
	Input.set_custom_mouse_cursor(arrow)

# Add this new function to hide all pages
func hide_all_pages():
	for i in range(1, 16):  # For pages 1-15
		var page_node = get_node("page" + str(i))
		if page_node:
			page_node.hide()
	
func _exitGame():
	get_tree().change_scene_to_file("res://mainMenu.tscn")
	
func _restartGame():
	Global.document = 1
	get_tree().change_scene_to_file("res://mainMenu.tscn")
	
func page_show(x):
	# First hide all pages
	hide_all_pages()
	
	# Then show only the requested page
	match x:
		1:
			$page1.show() # (demarche eval)
		2:
			$page2.show() # (eval_norm)
		3:
			$page3.show()
		4:
			$page4.show()
		5:
			$page5.show()
		6:
			$page6.show()
		7:
			$page7.show()
		8:
			$page8.show()
		9:
			$page9.show()
		10:
			$page10.show()
		11:
			$page11.show()
		12:
			$page12.show()
		13:
			$page13.show()
		14:
			$page14.show()
		15:
			$page15.show()
		_:  # Default case if document number is out of range
			print("Invalid page number: ", x)
			
func _on_text_submitted(new_text: String) -> void:
	match Global.document:
		1:
			if new_text.naturalnocasecmp_to("DÉMARCHE ÉVALUATIVE")==0:
				_correct()
			else:
				_incorrect()
				
		2:  
			if new_text.naturalnocasecmp_to("ÉVALUATION NORMATIVE")==0:
				_correct()
			else:
				_incorrect()
		
		3:  
			if new_text.naturalnocasecmp_to("ÉVALUATION DES COMPÉTENCES")==0:
				_correct()
			else:
				_incorrect()
		4:  
			if new_text.naturalnocasecmp_to("CORRIGÉ")==0:
				_correct()
			else:
				_incorrect()
		5:  
			if new_text.naturalnocasecmp_to("TÂCHE SIMPLE")==0:
				_correct()
			else:
				_incorrect()
		6:  
			if new_text.naturalnocasecmp_to("TÂCHE COMPLEXE")==0:
				_correct()
			else:
				_incorrect()
		7:  
			if new_text.naturalnocasecmp_to("OUTIL DE JUGEMENT")==0:
				_correct()
			else:
				_incorrect()
		8:  
			if new_text.naturalnocasecmp_to("INTERPRÉTATION CRITÉRIÉE")==0:
				_correct()
			else:
				_incorrect()
		9:  
			if new_text.naturalnocasecmp_to("INTERPRÉTATION NORMATIVE")==0:
				_correct()
			else:
				_incorrect()
		10:  
			if new_text.naturalnocasecmp_to("INTERPRÉTATION DYNAMIQUE")==0:
				_correct()
			else:
				_incorrect()
				
		11:  
			if new_text.naturalnocasecmp_to("VALEURS ÉVALUATIVES INSTRUMENTALES")==0:
				_correct()
			else:
				_incorrect()
		12:  
			if new_text.naturalnocasecmp_to("VALEURS ÉVALUATIVES FONDAMENTALES")==0:
				_correct()
			else:
				_incorrect()
		13:  
			if new_text.naturalnocasecmp_to("RECONNAISSANCE DES COMPÉTENCES")==0:
				_correct()
			else:
				_incorrect()
		14:  
			if new_text.naturalnocasecmp_to("AIDE À L'APPRENTISSAGE")==0:
				_correct()
			else:
				_incorrect()
		15:  
			if new_text.naturalnocasecmp_to("NORMES ET MODALITÉS")==0:
				_correct()
			else:
				_incorrect()
	
func _correct():
	print(score, "correct")
	if score < 0:
		score = 0   # fix negative
	
	Global.cash += score * 100 # reward gold
	score = 5                  # reset score
	$reward.text = ("Correct! +" + str(score * 100))  # Fixed to show actual gold added
	$reward.show()
	$rewardTimer.start()
	
	# Hide current page
	var page_node = get_node("page" + str(Global.document))
	if page_node:
		page_node.hide()
	
	# Move to next page
	Global.document += 1
	page_show(Global.document)
	print(Global.document)
	
func _incorrect():
	print(score, "incorrect")
	score -= 1
	$reward.text = ("Incorrect! -100")
	$reward.show()
	$rewardTimer.start()
	
func _on_reward_timeout():
	$reward.hide()
