extends Node2D

var current_situation: String = ""
var current_score: int = 0
var countdown: int = 3

@onready var character = $Character
@onready var left_item = $LeftItem
@onready var right_item = $RightItem
@onready var ui = $UI

func _ready():
	randomize()
	start_new_turn()

func start_new_turn():
	generate_situation()
	present_items()
	start_countdown()

func generate_situation():
	# Placeholder: We'll implement this fully when we create the SituationManager
	current_situation = "It's a sunny day"
	ui.update_situation(current_situation)

func present_items():
	# Placeholder: We'll implement this fully when we create the ItemManager
	left_item.slide_in()
	right_item.slide_in()

func start_countdown():
	countdown = 3
	ui.update_countdown(countdown)
	$CountdownTimer.start()

func _on_CountdownTimer_timeout():
	countdown -= 1
	ui.update_countdown(countdown)
	
	if countdown <= 0:
		end_turn()

func _unhandled_input(event):
	if countdown > 0:
		if event.is_action_pressed("left_click"):
			process_choice(left_item)
		elif event.is_action_pressed("right_click"):
			process_choice(right_item)

func process_choice(chosen_item):
	# Update this function in main.gd
	current_score += 10
	ui.update_score(current_score)
	
	# Interact with the character
	# Assuming chosen_item has a 'name' property. If not, we'll need to adjust this.
	character.react_to_choice(chosen_item.name)
	
	# For now, let's assume all choices increase comfort by 10
	character.update_comfort(10)
	
	end_turn()

func end_turn():
	$CountdownTimer.stop()
	left_item.slide_out()
	right_item.slide_out()
	# Wait for slide-out animation to complete
	await get_tree().create_timer(1.0).timeout
	start_new_turn()


func _on_countdown_timer_timeout():
	pass # Replace with function body.
